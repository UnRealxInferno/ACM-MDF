#include "..\script_component.hpp"
/*
 * Author: AtrixZockt, Inferno
 * Updates surgery-specific injury list entries for selected body part.
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
 * [_ctrlInjuries, _target, 0, _entries] call ACM_surgery_fnc_gui_updateInjuryListPart
 *
 * Public: No
 */

params ["_ctrl", "_target", "_selectionN", "_entries"];

if (!GVAR(enable_fracture)) exitWith {};
if !(_selectionN in [2, 3, 4, 5]) exitWith {};

private _fractureStates = _target getVariable [QGVAR(fractures), [0,0,0,0,0,0]];
private _fractureState = _fractureStates param [_selectionN, 0];

if (_fractureState <= 0) exitWith {};

private _entry = "";
private _color = [1, 0.82, 0.16, 1];

switch (true) do {
    case (_fractureState == 1): {
        _entry = LLSTRING(SIMPLE_FRACTURE);
        _color = [0.94, 0.7, 0.2, 1];
    };
    case (_fractureState >= 2 && _fractureState < 3): {
        _entry = LLSTRING(COMPOUND_FRACTURE);
        _color = [0.98, 0.56, 0.2, 1];
    };
    case (_fractureState >= 3): {
        _entry = LLSTRING(COMMINUTED_FRACTURE);
        _color = [0.9, 0.3, 0.2, 1];
    };
};

if (_fractureState in [2.1, 2.3, 2.5, 3.1, 3.3, 3.5]) then {
    _entry = format ["%1 [%2]", _entry, LELSTRING(core,Common_InProgress)];
    _color = [0.85, 0.24, 0.24, 1];
};

_entries pushBack [_entry, _color];
