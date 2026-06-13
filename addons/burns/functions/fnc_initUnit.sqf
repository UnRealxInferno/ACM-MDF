#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Initialises burn state for a unit on spawn/respawn. The burn system is event-driven (no PFH), so
 * this just clears any stale markers.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_burns_fnc_initUnit;
 *
 * Public: No
 */

params ["_patient"];

if (!local _patient) exitWith {};

[_patient] call FUNC(resetVariables);
