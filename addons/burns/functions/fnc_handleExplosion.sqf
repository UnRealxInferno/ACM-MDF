#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Burns a unit caught in a nearby explosion. Registered on the CBA "explosion" class event, which
 * maps to the engine "Explosion" event handler. That engine event passes only [unit, damage] (no
 * source object) and fires for every unit caught in a blast, with damage already scaled by the
 * engine for proximity/blast size - so burn chance/severity come straight from _damage, with no
 * projectile tracking or ammo classification needed. Runs where the unit is local and applies a
 * damage-scaled "burn"; depth is then selected by the ACM_damage "burn" damageType.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Explosion damage <NUMBER> (0-1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, 0.6] call ACM_burns_fnc_handleExplosion;
 *
 * Public: No
 */

params ["_unit", "_damage"];

if (!GVAR(burnsEnabled) || {!GVAR(sourcesEnabled)}) exitWith {};
if (!local _unit || {!alive _unit} || {_damage <= 0}) exitWith {};

// The engine "Explosion" event already scales _damage by proximity/blast size and only fires for
// units caught in the blast, so burn chance/severity come straight from _damage (no source needed).
private _strength = (linearConversion [0.05, 0.5, _damage, 0, 1, true]) * GVAR(igniteChanceMul);

if (_strength < 0.2 || {random 1 > _strength}) exitWith {};

private _severity = linearConversion [0.2, 1, _strength, 0.12, 0.45, true];
[_unit, _severity, selectRandom ["body", "leftarm", "rightarm", "leftleg", "rightleg", "head"]] call FUNC(applyBurnWound);
