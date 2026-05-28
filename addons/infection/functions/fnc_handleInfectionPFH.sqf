#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Main infection monitoring loop. Runs at 1s intervals with an internal 30s throttle.
 * Handles risk accumulation, eligible time detection, stage escalation, and wound reopening boost.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_infection_fnc_handleInfectionPFH;
 *
 * Public: No
 */

params ["_patient"];

if (!GVAR(infectionEnabled)) exitWith {};
if (_patient getVariable [QGVAR(Infection_PFH), -1] != -1) exitWith {};

private _id = [{
    params ["_args", "_idPFH"];
    _args params ["_patient"];

    if (!alive _patient) exitWith {
        _patient setVariable [QGVAR(Infection_PFH), -1];
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    if ((_patient getVariable [QGVAR(Infection_NextCheck), 0]) > CBA_missionTime) exitWith {};
    _patient setVariable [QGVAR(Infection_NextCheck), CBA_missionTime + 30];

    private _stage = _patient getVariable [QGVAR(Infection_Stage), 0];

    // --- Start eligible clock on first treated wound ---
    if ((_patient getVariable [QGVAR(Infection_EligibleTime), -1]) < 0) then {
        ([_patient] call FUNC(getWoundCount)) params ["_c","_b","_w","_s"];
        if ((_c + _b + _w + _s) > 0) then {
            _patient setVariable [QGVAR(Infection_EligibleTime), CBA_missionTime + 3600, true];
        };
    };

    private _abLevel = (
        ([_patient, "Ertapenem_IV", false] call ACEFUNC(medical_status,getMedicationCount)) +
        ([_patient, "Ertapenem",    false] call ACEFUNC(medical_status,getMedicationCount)) +
        ([_patient, "Moxifloxacin", false] call ACEFUNC(medical_status,getMedicationCount))
    ) min 2;

    // --- Escalation: timer-based, only fires when untreated ---
    private _nextStageTime = _patient getVariable [QGVAR(Infection_NextStageTime), -1];
    if (_stage > 0 && {_nextStageTime > 0} && {CBA_missionTime >= _nextStageTime} && {_abLevel < 1.0}) then {
        [_patient, (_stage + 1) min 3] call FUNC(applyInfectionStage);
    };

    // --- Regression: accumulator-based (10 min of sufficient antibiotics = one stage down) ---
    // Each 30s tick at abLevel >= 1.0 increments the counter. At 20 ticks the stage regresses.
    // Counter decays slowly without antibiotics so partial treatment isn't wasted entirely.
    if (_stage > 0) then {
        private _treatAccum = _patient getVariable [QGVAR(Infection_TreatmentAccumulator), 0];
        if (_abLevel >= 1.0) then {
            _treatAccum = _treatAccum + 1;
            if (_treatAccum >= 20) then {
                _treatAccum = 0;
                [_patient, (_stage - 1) max 0] call FUNC(applyInfectionStage);
            };
        } else {
            _treatAccum = (_treatAccum - 2) max 0;
        };
        _patient setVariable [QGVAR(Infection_TreatmentAccumulator), _treatAccum, true];
    };

    // --- Risk accumulation (stage 0 only) ---
    if (_stage == 0) then {
        private _riskDelta = [_patient] call FUNC(getInfectionRisk);
        if (_riskDelta > 0) then {
            private _accumulator = ((_patient getVariable [QGVAR(Infection_RiskAccumulator), 0]) + _riskDelta) min 2.0;

            if (_accumulator >= 1.0) then {
                _accumulator = 0;
                [_patient, 1] call FUNC(applyInfectionStage);
            } else {
                _patient setVariable [QGVAR(Infection_RiskAccumulator), _accumulator, true];
            };
        };
    };

    // --- Pain push for active infection ---
    _stage = _patient getVariable [QGVAR(Infection_Stage), 0];
    if (_stage > 0) then {
        private _painTarget = [0.35, 0.60, 0.85] select (_stage - 1);
        if (GET_PAIN(_patient) < _painTarget) then {
            [_patient, 0.05 * _stage] call ACEFUNC(medical,adjustPainLevel);
        };
    };

}, 1, [_patient]] call CBA_fnc_addPerFrameHandler;

_patient setVariable [QGVAR(Infection_PFH), _id];
