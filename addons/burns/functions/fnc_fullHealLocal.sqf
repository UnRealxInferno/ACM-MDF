#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Clears burn state on full heal.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_burns_fnc_fullHealLocal;
 *
 * Public: No
 */

params ["_patient"];

[_patient] call FUNC(resetVariables);
