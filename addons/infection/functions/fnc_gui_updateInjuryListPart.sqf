#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Adds infection status to the per-body-part injury list in the ACE medical menu.
 * Only shown on body parts that have treated wounds, so it reads as "this wound looks wrong."
 *
 * Arguments:
 * 0: Injury list control <CONTROL>
 * 1: Target <OBJECT>
 * 2: Body part index <NUMBER>
 * 3: Existing entries <ARRAY>
 * 4: Body part name <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_ctrl", "_target", "_selectionN", "_entries", "_bodyPartName"];

if (!GVAR(infectionEnabled)) exitWith {};
if (_selectionN < 0 || {_selectionN > 5}) exitWith {};

private _stage = _target getVariable [QGVAR(Infection_Stage), 0];
if (_stage == 0) exitWith {};

// Selection index ordering matches ACE (and STRING_BODY_PARTS): 0=head, 1=body, ...
// Must NOT use the body-first ALL_BODY_PARTS_PRIORITY ordering here, or head/body get swapped.
private _partName = ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"] select _selectionN;

private _hasWoundsOnPart =
    !(GET_BANDAGED_WOUNDS(_target) getOrDefault [_partName, []] isEqualTo []) ||
    !(GET_CLOTTED_WOUNDS(_target)  getOrDefault [_partName, []] isEqualTo []) ||
    !(GET_WRAPPED_WOUNDS(_target)  getOrDefault [_partName, []] isEqualTo []) ||
    !(GET_STITCHED_WOUNDS(_target) getOrDefault [_partName, []] isEqualTo []);

if (!_hasWoundsOnPart) exitWith {};

switch (_stage) do {
    case 1: { _entries pushBack [LLSTRING(GUI_LocalInfection),    [1.0, 1.0, 0.2, 1]]; };
    case 2: { _entries pushBack [LLSTRING(GUI_SystemicInfection), [1.0, 0.5, 0.1, 1]]; };
    case 3: { _entries pushBack [LLSTRING(GUI_Sepsis),            [1.0, 0.2, 0.2, 1]]; };
};
