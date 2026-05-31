#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Clears all infection state variables and stops active PFHs.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_infection_fnc_resetVariables;
 *
 * Public: No
 */

params ["_patient"];

private _infectionPFH = _patient getVariable [QGVAR(Infection_PFH), -1];
if (_infectionPFH != -1) then {
    [_infectionPFH] call CBA_fnc_removePerFrameHandler;
};

private _sepsisPFH = _patient getVariable [QGVAR(Sepsis_PFH), -1];
if (_sepsisPFH != -1) then {
    [_sepsisPFH] call CBA_fnc_removePerFrameHandler;
};

_patient setVariable [QGVAR(Infection_PFH),                -1, true];
_patient setVariable [QGVAR(Sepsis_PFH),                  -1, true];
_patient setVariable [QGVAR(Infection_Stage),               0, true];
_patient setVariable [QGVAR(Infection_EligibleTime),       -1, true];
_patient setVariable [QGVAR(Infection_RiskAccumulator),     0, true];
_patient setVariable [QGVAR(Infection_NextCheck),           0, true];
_patient setVariable [QGVAR(Infection_NextStageTime),      -1, true];
_patient setVariable [QGVAR(Infection_TreatmentAccumulator), 0, true];
_patient setVariable [QGVAR(Fever_Offset),                  0, true];
