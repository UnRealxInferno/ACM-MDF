#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Local call for removing a fluid warmer
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "LeftLeg"] call ACM_hypothermia_fnc_removeFluidWarmerLocal;
 *
 * Public: No
 */
params ["_medic", "_patient", "_bodyPart"];

private _partIndex = switch (toLowerANSI _bodyPart) do {
    case "head": {0};
    case "body": {1};
    case "torso": {1};
    case "leftarm": {2};
    case "rightarm": {3};
    case "leftleg": {4};
    case "rightleg": {5};
    default {-1};
};
if (_partIndex < 0) exitWith {};

private _warmerArray = _patient getVariable [QGVAR(fluidWarmer), [0,0,0,0,0,0]];
_warmerArray set [_partIndex, 0];
_patient setVariable [QGVAR(fluidWarmer), _warmerArray, true];

[_medic, "kat_fluidWarmer"] call ACEFUNC(common,addToInventory);
