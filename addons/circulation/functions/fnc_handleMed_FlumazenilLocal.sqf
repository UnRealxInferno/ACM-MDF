#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Reverses surgery sedation state when Flumazenil is administered.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_circulation_fnc_handleMed_FlumazenilLocal;
 *
 * Public: No
 */

params ["_patient"];

if (!alive _patient) exitWith {};

_patient setVariable [QEGVAR(surgery,sedated), false, true];
