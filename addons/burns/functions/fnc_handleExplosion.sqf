#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Burns a unit caught in a nearby explosion. Registered as a CAManBase "explosion" class event handler
 * (mirrors ACM_ophthalmology) so it fires automatically for any unit close enough to a blast - no
 * projectile tracking or ammo classification needed. Runs where the unit is local and applies a
 * distance/damage-scaled "burn"; depth is then selected by the ACM_damage "burn" damageType.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Explosion damage <NUMBER>
 * 2: Explosion source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, 0.6, _grenade] call ACM_burns_fnc_handleExplosion;
 *
 * Public: No
 */

params ["_unit", "_damage", "_explosionSource"];

if (!GVAR(burnsEnabled) || {!GVAR(sourcesEnabled)}) exitWith {};
if (!local _unit || {!alive _unit} || {isNull _explosionSource}) exitWith {};

// Distance falloff (mirror ophthalmology) combined with the blast's damage, scaled by the setting.
private _dist = (eyePos _unit) vectorDistance (getPosASL _explosionSource);
private _strength = (1 - ((_dist min BURN_EXPLOSION_RANGE) / BURN_EXPLOSION_RANGE)) * GVAR(igniteChanceMul);
_strength = _strength * (linearConversion [0.05, 0.5, _damage, 0.3, 1, true]);

if (_strength < 0.2 || {random 1 > _strength}) exitWith {};

private _severity = linearConversion [0.2, 1, _strength, 0.12, 0.45, true];
[_unit, _severity, selectRandom ["body", "leftarm", "rightarm", "leftleg", "rightleg", "head"]] call FUNC(applyBurnWound);
