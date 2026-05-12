#include "..\script_component.hpp"
/*
 * Author: MiszczuZPolski
 * Calculates NPWT treatment time based on number of treatable wounds.
 *
 * Arguments:
 * 0: Medic (unused) <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Public: No
 */

params ["", "_patient", "_bodyPart"];

private _woundCount = 0;
{
    _x params ["_id", "_amountOf", "_bleeding"];

    if (_amountOf * _bleeding > 0) then {
        _woundCount = _woundCount + 1;
    };
} forEach ((GET_OPEN_WOUNDS(_patient)) getOrDefault [_bodyPart, []]);

if (_woundCount > 0) then {
    _woundCount * GVAR(npwtTime)
} else {
    (count (GET_BANDAGED_WOUNDS(_patient) getOrDefault [_bodyPart, []])
    + count (GET_CLOTTED_WOUNDS(_patient) getOrDefault [_bodyPart, []])
    + count (GET_WRAPPED_WOUNDS(_patient) getOrDefault [_bodyPart, []])) * GVAR(npwtTime)
};
