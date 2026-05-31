#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Returns total wound amounts per treatment state across all body parts.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * [clotted, bandaged, wrapped, stitched] <ARRAY>
 *
 * Example:
 * [player] call ACM_infection_fnc_getWoundCount;
 *
 * Public: No
 */

params ["_patient"];

private _clotted  = 0;
private _bandaged = 0;
private _wrapped  = 0;
private _stitched = 0;

{
    private _part = _x;

    {_clotted  = _clotted  + (_x select 1)} forEach (GET_CLOTTED_WOUNDS(_patient)  getOrDefault [_part, []]);
    {_bandaged = _bandaged + (_x select 1)} forEach (GET_BANDAGED_WOUNDS(_patient) getOrDefault [_part, []]);
    {_wrapped  = _wrapped  + (_x select 1)} forEach (GET_WRAPPED_WOUNDS(_patient)  getOrDefault [_part, []]);
    {_stitched = _stitched + (_x select 1)} forEach (GET_STITCHED_WOUNDS(_patient) getOrDefault [_part, []]);
} forEach ALL_BODY_PARTS;

[_clotted, _bandaged, _wrapped, _stitched]
