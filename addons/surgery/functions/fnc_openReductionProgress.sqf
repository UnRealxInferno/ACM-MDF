#include "..\script_component.hpp"
/*
 * Author: Mazinski
 * Progresses the treatment process for a complex fracture.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Current Fracture Stage <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_entry"];

[QGVAR(openReductionProgress), [_medic, _patient, _bodyPart, _entry], _patient] call CBA_fnc_targetEvent;
