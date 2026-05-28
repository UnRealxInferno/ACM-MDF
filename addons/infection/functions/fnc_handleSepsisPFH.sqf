#include "..\script_component.hpp"
/*
 * Author: Blue
 * Sepsis deterioration loop. Runs every 60 seconds while stage 3 is active.
 * Vitals deterioration (HR, RR, BP) is handled naturally by the fever temperature pipeline.
 * This PFH only manages pain and antibiotic regression.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_infection_fnc_handleSepsisPFH;
 *
 * Public: No
 */

params ["_patient"];

if (_patient getVariable [QGVAR(Sepsis_PFH), -1] != -1) exitWith {};

private _id = [{
    params ["_args", "_idPFH"];
    _args params ["_patient"];

    private _stage = _patient getVariable [QGVAR(Infection_Stage), 0];

    if (!alive _patient || {_stage < 3}) exitWith {
        _patient setVariable [QGVAR(Sepsis_PFH), -1];
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    // Agonising pain — patient needs both antibiotics and pain management to function.
    // Stage regression is handled by the main infection PFH via treatment accumulator.
    [_patient, 0.20] call ACEFUNC(medical,adjustPainLevel);

}, 60, [_patient]] call CBA_fnc_addPerFrameHandler;

_patient setVariable [QGVAR(Sepsis_PFH), _id];
