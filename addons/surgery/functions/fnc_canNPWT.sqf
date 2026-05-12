#include "..\script_component.hpp"
/*
 * Author: MiszczuZPolski
 * Check if patient's body part can be treated by NPWT.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Can use NPWT <BOOLEAN>
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

private _openWounds = GET_OPEN_WOUNDS(_patient) getOrDefault [_bodyPart, []];

private _isBleeding = false;

if (_openWounds isNotEqualTo []) then {
    {
        _x params ["", "_amountOf", "_bleeding"];

        if (_amountOf * _bleeding > 0) exitWith {
            _isBleeding = true;
        };
    } forEach _openWounds;
};

(_isBleeding
    || (GET_BANDAGED_WOUNDS(_patient) getOrDefault [_bodyPart, []] isNotEqualTo [])
    || (GET_CLOTTED_WOUNDS(_patient) getOrDefault [_bodyPart, []] isNotEqualTo [])
    || (GET_WRAPPED_WOUNDS(_patient) getOrDefault [_bodyPart, []] isNotEqualTo []));
