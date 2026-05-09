#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Estimate how much worn eyewear protects from blast/shrapnel eye trauma.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Protection coefficient, 0-1 <NUMBER>
 *
 * Public: No
 */

params ["_unit"];

private _goggles = goggles _unit;
if (_goggles == "") exitWith {0};

private _config = configFile >> "CfgGlasses" >> _goggles;
if (!isClass _config) exitWith {0};

if (isNumber (_config >> "ACE_Resistance")) exitWith {
    (getNumber (_config >> "ACE_Resistance")) min 1 max 0
};

0
