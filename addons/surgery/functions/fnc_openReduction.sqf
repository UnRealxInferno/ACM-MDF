#include "..\script_component.hpp"
/*
 * Author: Mazinski
 * Removes the fracture status from an open fracture.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Reset Surgery <BOOLEAN>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_exit"];

[QGVAR(openReduction), [_medic, _patient, _bodyPart, _exit], _patient] call CBA_fnc_targetEvent;
