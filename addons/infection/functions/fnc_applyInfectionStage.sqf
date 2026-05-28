#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Transitions the patient to a new infection stage, applying or removing effects.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: New stage (0=none, 1=local, 2=systemic, 3=sepsis) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 2] call ACM_infection_fnc_applyInfectionStage;
 *
 * Public: No
 */

params ["_patient", "_newStage"];

private _currentStage = _patient getVariable [QGVAR(Infection_Stage), 0];

if (_newStage == _currentStage) exitWith {};

_patient setVariable [QGVAR(Infection_Stage), _newStage, true];

// Clear sepsis PFH when leaving stage 3
if (_currentStage == 3 && {_newStage < 3}) then {
    private _sepsisPFH = _patient getVariable [QGVAR(Sepsis_PFH), -1];
    if (_sepsisPFH != -1) then {
        [_sepsisPFH] call CBA_fnc_removePerFrameHandler;
        _patient setVariable [QGVAR(Sepsis_PFH), -1];
    };
};

private _stageTime = (GVAR(infectionStageTime) * 60) + (random 300);

switch (_newStage) do {
    case 0: {
        _patient setVariable [QGVAR(Infection_EligibleTime),    -1, true];
        _patient setVariable [QGVAR(Infection_RiskAccumulator),  0, true];
        _patient setVariable [QGVAR(Infection_NextStageTime),   -1, true];
        _patient setVariable [QGVAR(Fever_Offset),               0, true];
    };
    case 1: {
        _patient setVariable [QGVAR(Infection_NextStageTime), CBA_missionTime + _stageTime, true];
        _patient setVariable [QGVAR(Fever_Offset), 0.8, true];
    };
    case 2: {
        _patient setVariable [QGVAR(Infection_NextStageTime), CBA_missionTime + _stageTime, true];
        _patient setVariable [QGVAR(Fever_Offset), 2.0, true];
    };
    case 3: {
        _patient setVariable [QGVAR(Infection_NextStageTime), -1, true];
        _patient setVariable [QGVAR(Fever_Offset), 3.5, true];
        [_patient] call FUNC(handleSepsisPFH);
    };
};
