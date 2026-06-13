#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Clears burn state on a unit (full heal / respawn). The only burn-owned state is the airway-burn
 * marker; the underlying airway inflammation it seeds is also cleared so a healed casualty breathes
 * normally again.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_burns_fnc_resetVariables;
 *
 * Public: No
 */

params ["_patient"];

_patient setVariable [QGVAR(AirwayBurned), false, true];
_patient setVariable [QEGVAR(CBRN,AirwayInflammation), 0, true];
