#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Handles the player respawn for Hypothermia.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_hypothermia_fnc_handleRespawn
 *
 * Public: No
 */

params ["_patient"];
TRACE_1("fullHealLocal",_patient);

[_patient, true] call FUNC(init);
