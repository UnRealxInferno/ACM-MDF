#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Resets infection state and restarts monitoring on respawn.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Dead body <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, body] call ACM_infection_fnc_handleRespawn;
 *
 * Public: No
 */

params ["_patient"];

[_patient] call FUNC(initUnit);
