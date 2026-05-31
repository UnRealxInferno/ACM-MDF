#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Initialise infection monitoring for a unit. Called on spawn and respawn.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_infection_fnc_initUnit;
 *
 * Public: No
 */

params ["_patient"];

if (!local _patient) exitWith {};

[_patient] call FUNC(resetVariables);

if (GVAR(infectionEnabled)) then {
    [_patient] call FUNC(handleInfectionPFH);
};
