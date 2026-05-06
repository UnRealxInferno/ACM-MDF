#include "..\script_component.hpp"
/*
 * Author: MiszczuZPolski, Inferno
 * Handles explosions.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Damage Source <OBJECT>
 * 2: Explosion Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, damage, explosion] call ACM_ophthalmology_fnc_handleExplosion
 *
 * Public: No
 */

params ["_unit", "_damage", "_explosionSource"];

if (_unit != ACE_player) exitWith {};

private _eyePos = eyePos _unit;
private _grenadePosASL = getPosASL _explosionSource;
_grenadePosASL set [2, (_grenadePosASL select 2) + 0.2]; // compensate for grenade glitching into ground

// Calculate distance-based strength
private _distance = _eyePos vectorDistance _grenadePosASL;
private _strength = 1 - (_distance min 30) / 30;

private _losCount = {
    !lineIntersects [_grenadePosASL vectorAdd _x, _eyePos, _unit]
} count [[0, 0, 0], [0, 0, 0.2], [0.1, 0.1, 0.1], [-0.1, -0.1, 0.1]];

// Adjust strength based on line of sight
private _losCoefficient = [1, 0.1] select (_losCount <= 1);
_strength = _strength * _losCoefficient;

// Account for player's viewing direction
private _eyeDir = ((AGLToASL positionCameraToWorld [0, 0, 1]) vectorDiff (AGLToASL positionCameraToWorld [0, 0, 0]));
private _dirToGrenade = _eyePos vectorFromTo _grenadePosASL;
private _angleDiff = acos (_eyeDir vectorDotProduct _dirToGrenade); // Angle difference in radians

if (_angleDiff > 50) exitWith {};

// Add visual and hearing effects
if (_strength > 0.2) then {

    // Eye closure from shock
    [(_strength * 2), true] call FUNC(effectEyeBlink);
    private _random = floor (random 101);
    private _eyeProtection = [_unit] call FUNC(getEyeProtection);
    private _heavyInjuryProbability = GVAR(probability_dust_heavy) * (1 - _eyeProtection);

    if (_random < _heavyInjuryProbability) then {

        // Get the current state of the eyes (defaulting to healthy if not set)
        private _eyeInjuries = _unit getVariable [QGVAR(eyeInjuries), [1, 1]];

        private _injuredEye = floor random 2;

        _eyeInjuries set [_injuredEye, 0];

        if (({_x == 0} count _eyeInjuries) > 1) then {
            _unit setVariable [QGVAR(eyeInjurySevere), true, true];
        };

        _unit setVariable [QGVAR(eyeInjuries), _eyeInjuries, true];
        [true, _eyeInjuries] call FUNC(effectHurtEye);
    } else {
        private _dustInjuryLight = _unit getVariable [QGVAR(dustInjuryLight), 0];
        private _dustIncrease = (0.5 + (_strength min 1)) * (1 - (_eyeProtection * 0.75));

        if (_dustIncrease > 0.1) then {
            _unit setVariable [QGVAR(dustInjuryLight), ((_dustInjuryLight + _dustIncrease) min 5), true];
            [true, GET_DUST_INJURY(_unit)] call FUNC(effectEyeInjury);
        };
    };

    // Reaction blink
    [{
        [0.1, true] call FUNC(effectEyeBlink);
        [{ [0.05, true] call FUNC(effectEyeBlink); }, [], 0.3] call CBA_fnc_waitAndExecute;
    }, [], (_strength * 2.2)] call CBA_fnc_waitAndExecute;
};
