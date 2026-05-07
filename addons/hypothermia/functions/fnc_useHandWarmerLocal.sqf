#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Local call for applying hand warmers
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "LeftLeg"] call ACM_hypothermia_fnc_useHandWarmerLocal;
 *
 * Public: No
 */
params ["_patient", "_bodyPart"];

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

private _warmerArray = _patient getVariable [QGVAR(handWarmers), [0,0,0,0,0,0]];
_warmerArray set [_partIndex, 60];

_patient setVariable [QGVAR(handWarmers), _warmerArray, true];
