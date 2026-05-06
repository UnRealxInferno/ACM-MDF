#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Clear ophthalmology dust and irritation state.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_patient"];

_patient setVariable [QGVAR(dustInjuryLight), 0, true];
_patient setVariable [QGVAR(dustInjuryHeavy), 0, true];
