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
 * Example:
 * [player] call ACM_ophthalmology_fnc_getEyeProtection
 *
 * Public: No
 */

params ["_unit"];

private _goggles = goggles _unit;
if (_goggles == "") exitWith {0};

private _config = configFile >> "CfgGlasses" >> _goggles;
if (!isClass _config) exitWith {0};

// ACE_Protection (0-1) is ACE's eye protection flag; ACE_Resistance is lens breakage resistance
// only, and ACE uses it internally to decide whether eyewear renders a lens - so it is not used
// here. ace_goggles defines both on CfgGlasses >> None and config lookups resolve through
// inheritance, so the entry is present on nearly every item - test the value, never isNumber,
// or the fallback below is unreachable.
if (getNumber (_config >> "ACE_Protection") > 0) exitWith {1};

// Fallback for facewear that was never set up for ACE: count it as eye protection when the
// classname or display name identifies it as goggles or full-face gear.
if (!GVAR(goggles_name_fallback)) exitWith {0};

private _name = toLowerANSI format ["%1 %2", _goggles, getText (_config >> "displayName")];

[0, 1] select ((EYE_PROTECTION_KEYWORDS findIf {_name find _x > -1}) > -1)
