#include "..\script_component.hpp"
/*
 * Author: MiszczuZPolski, Inferno
 * Updates injury list for given body part for the target.
 *
 * Arguments:
 * 0: Injury list <CONTROL>
 * 1: Target <OBJECT>
 * 2: Body part, -1 to only show overall health info <NUMBER>
 * 3: Entries <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ctrlInjuries, _target, 0] call ACM_ophthalmology_fnc_gui_updateInjuryListPart
 *
 * Public: No
 */

params ["_ctrl", "_target", "_selectionN", "_entries"];

if (_selectionN != 0) exitWith {};

private _dustInjurySeverity = GET_DUST_INJURY(_target);
private _eyeInjuries = _target getVariable [QGVAR(eyeInjuries), [1,1]];

if (_dustInjurySeverity > 0) then {
    _entries pushBack [LLSTRING(eyeIrritationPresent), [0.87, 0.76, 0.32, 1]];
};

if (({_x != 1} count _eyeInjuries) > 0) then {
    private _eyeInjurySevere = _target getVariable [QGVAR(eyeInjurySevere), false];
    private _label = [LLSTRING(eyeInjuryPresent), LLSTRING(eyeInjurySeverePresent)] select _eyeInjurySevere;
    private _color = [[0.95, 0.56, 0.24, 1], [0.8, 0.18, 0.14, 1]] select _eyeInjurySevere;

    _entries pushBack [_label, _color];
};
