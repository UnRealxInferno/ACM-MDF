#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Adds per-body-part hypothermia status entries to the ACE medical injury list.
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
 * Example:
 * [_ctrl, _target, 1, _entries, "Torso"] call ACM_hypothermia_fnc_gui_updateInjuryListPart
 *
 * Public: No
 */

params ["_ctrl", "_target", "_selectionN", "_entries", "_bodyPartName"];

if (!GVAR(hypothermiaActive)) exitWith {};
if (_selectionN < 0 || {_selectionN > 5}) exitWith {};

private _handTitle = localize "STR_ACM_Hypothermia_HandWarmer_displayName";
private _lineTitle = localize "STR_ACM_Hypothermia_LineWarmer";

private _hasHandEntry = _entries findIf {
    ((_x param [0, ""]) find _handTitle) > -1
} > -1;

private _hasLineEntry = _entries findIf {
    ((_x param [0, ""]) find _lineTitle) > -1
} > -1;

if (!_hasLineEntry) then {
    private _fluidWarmers = _target getVariable [QGVAR(fluidWarmer), [0,0,0,0,0,0]];
    if !(_fluidWarmers isEqualType []) then {_fluidWarmers = [0,0,0,0,0,0];};

    if ((_fluidWarmers param [_selectionN, 0]) > 0) then {
        _entries pushBack [_lineTitle, [1, 0.75, 0.18, 1]];
    };
};

if (!_hasHandEntry) then {
    private _handWarmers = _target getVariable [QGVAR(handWarmers), [0,0,0,0,0,0]];
    if !(_handWarmers isEqualType []) then {_handWarmers = [0,0,0,0,0,0];};

    if ((_handWarmers param [_selectionN, 0]) > 0) then {
        _entries pushBack [format ["%1 [%2]", _handTitle, LELSTRING(core,Common_Active)], [1, 0.75, 0.18, 1]];
    };
};
