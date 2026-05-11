#include "..\script_component.hpp"
/*
 * Author: Blue
 * Handle nausea when paracetamol is taken in rapid succession (>3 doses within 15 minutes).
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Classname <STRING>
 * 3: Medication Dose <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Stomach", "Paracetamol", 1] call ACM_circulation_fnc_handleMed_ParacetamolLocal;
 *
 * Public: No
 */

params ["_patient", "", "", ""];

if (_patient != ACE_player) exitWith {};

// Count doses taken within the last 15 minutes (rapid succession window)
private _recentDoseCount = {
    (_x select 0) == "Paracetamol" && {(CBA_missionTime - (_x select 1)) < 900}
} count (_patient getVariable [VAR_MEDICATIONS, []]);

if (_recentDoseCount <= 3) exitWith {};

// Don't stack if nausea effect is already running, or a stronger anesthetic is active
if (_patient getVariable [QGVAR(NauseaEffect_Paracetamol), false]) exitWith {};
if (_patient getVariable [QGVAR(AnestheticEffect_PFH), -1] != -1) exitWith {};

_patient setVariable [QGVAR(NauseaEffect_Paracetamol), true];

// Scale intensity with number of extra doses, capped well below ketamine levels
private _intensity = linearConversion [4, 8, _recentDoseCount, 0.015, 0.035, true];

EGVAR(core,ppAnestheticEffect_chrom) ppEffectEnable true;
EGVAR(core,ppAnestheticEffect_chrom) ppEffectAdjust [_intensity, _intensity, false];
EGVAR(core,ppAnestheticEffect_chrom) ppEffectCommit 60;

// Hold at peak briefly, then fade out — total duration ~4 minutes
[{
    params ["_patient", "_intensity"];

    if (_patient getVariable [QGVAR(AnestheticEffect_PFH), -1] != -1) exitWith {
        _patient setVariable [QGVAR(NauseaEffect_Paracetamol), false];
    };

    EGVAR(core,ppAnestheticEffect_chrom) ppEffectAdjust [0, 0, false];
    EGVAR(core,ppAnestheticEffect_chrom) ppEffectCommit 120;

    [{
        params ["_patient"];
        if (_patient getVariable [QGVAR(AnestheticEffect_PFH), -1] == -1) then {
            EGVAR(core,ppAnestheticEffect_chrom) ppEffectEnable false;
        };
        _patient setVariable [QGVAR(NauseaEffect_Paracetamol), false];
    }, [_patient], 125] call CBA_fnc_waitAndExecute;

}, [_patient, _intensity], 90] call CBA_fnc_waitAndExecute;
