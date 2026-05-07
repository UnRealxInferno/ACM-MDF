#include "..\script_component.hpp"
/*
 * Author: Mazinski.H, Inferno
 * Begins Remove Fluid Warmer treatment
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 * 4: Item User (not used) <OBJECT>
 * 5: Used Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "RightArm", "Fluid Warmer", objNull, "kat_fluidWarmer"] call ACM_hypothermia_fnc_removeFluidWarmer;
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

[QGVAR(removeFluidWarmer), [_medic, _patient, _bodyPart], _patient] call CBA_fnc_targetEvent;
