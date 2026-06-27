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

// Fallback: items without an ACE_Resistance value still count as eye protection
// if they identify as goggles by classname or display name. This restores the
// legacy behaviour for eyewear that predates / omits the ACE_Resistance field.
// Gated behind a CBA setting (on by default) so servers can opt out.
if (GVAR(goggles_name_fallback)) exitWith {
    private _displayName = getText (_config >> "displayName");
    if (((toLower _goggles) find "goggles" >= 0) || {(toLower _displayName) find "goggles" >= 0}) exitWith {1};
    0
};

0