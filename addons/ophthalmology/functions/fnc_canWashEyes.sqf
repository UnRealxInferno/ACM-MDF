#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Check if ophthalmology eye state can be treated by washing.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Can wash eyes <BOOL>
 *
 * Public: No
 */

params ["_medic", "_patient"];

if !(missionNamespace getVariable [QGVAR(enable), false]) exitWith {false};
GET_DUST_INJURY(_patient) > 0
