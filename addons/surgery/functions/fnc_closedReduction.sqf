#include "..\script_component.hpp"
/*
 * Author: Mazinski
 * Fully heals a simple fracture on the selected limb. Network wrapper.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

[QGVAR(closedReduction), [_medic, _patient, _bodyPart], _patient] call CBA_fnc_targetEvent;
