#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Checks whether a fluid warmer can be attached to an existing ACM IV/IO line.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Can apply fluid warmer <BOOL>
 *
 * Example:
 * [player, cursorObject, "LeftArm"] call ACM_hypothermia_fnc_canApplyFluidWarmer;
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

if (!GVAR(hypothermiaActive)) exitWith { false };
if ([_patient, _bodyPart] call FUNC(removeWarmer)) exitWith { false };

([_patient, _bodyPart, 0, -1] call EFUNC(circulation,hasIV)) || {[_patient, _bodyPart, 0] call EFUNC(circulation,hasIO)}
