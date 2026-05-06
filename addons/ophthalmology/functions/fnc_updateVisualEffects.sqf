#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Keep local ophthalmology visual effects synchronized with player state.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

private _player = missionNamespace getVariable ["ACE_player", objNull];

if (
    isNull _player ||
    {!alive _player} ||
    {missionNamespace getVariable [QACEGVAR(common,OldIsCamera), false]} ||
    {_player getVariable ["ACE_isUnconscious", false]}
) exitWith {
    [false, 0] call FUNC(effectEyeInjury);
    [false, [1, 1]] call FUNC(effectHurtEye);
};

private _dustInjurySeverity = GET_DUST_INJURY(_player);
private _eyeInjuries = _player getVariable [QGVAR(eyeInjuries), [1, 1]];

[true, _dustInjurySeverity] call FUNC(effectEyeInjury);
[true, _eyeInjuries] call FUNC(effectHurtEye);
