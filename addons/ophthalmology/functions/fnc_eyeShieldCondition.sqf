#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Sets condition for the Eye Shield
 *
 * Return Value:
 * Boolean
 *
 * Example:
 * [bob, patient] call ACM_ophthalmology_fnc_eyeShieldCondition
 *
 * Public: No
 */

params ["_medic", "_patient"];

private _eyeInjuries = _patient getVariable [QGVAR(eyeInjuries), [1, 1]];

({_x < 1} count _eyeInjuries) > 0
