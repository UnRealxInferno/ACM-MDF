#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Applies a thermal burn wound to a unit by raising ACE's woundReceived event with the "burn"
 * damage type. The depth (1st/2nd/3rd degree) is selected from the severity by the ACM_damage
 * "burn" damageType config. Must run on the machine where the unit is local.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Severity <NUMBER> (per-event burn damage magnitude)
 * 2: Body part <STRING> (default: random non-head part)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, 0.3] call ACM_burns_fnc_applyBurnWound;
 *
 * Public: No
 */

params ["_unit", "_severity", ["_bodyPart", ""]];

if (!local _unit || {!alive _unit} || {_severity <= 0}) exitWith {};

if (_bodyPart isEqualTo "") then {
    _bodyPart = selectRandom ["body", "leftarm", "rightarm", "leftleg", "rightleg"];
};

[QACEGVAR(medical,woundReceived), [_unit, [[_severity, _bodyPart, _severity]], objNull, "burn"]] call CBA_fnc_localEvent;
