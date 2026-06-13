#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Condition for the burn cream treatment action: the body part has an OPEN 1st-degree burn (Burn1).
 * Burn cream only treats superficial burns; 2nd/3rd degree need the silver nylon dressing.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Can treat <BOOL>
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

private _woundNames = ACEGVAR(medical_damage,woundClassNames);
private _open = (_patient getVariable [VAR_OPEN_WOUNDS, createHashMap]) getOrDefault [toLower _bodyPart, []];

private _hasBurn1 = false;
{
    if ((_woundNames param [floor ((_x select 0) / 10), ""]) isEqualTo "Burn1") exitWith { _hasBurn1 = true };
} forEach _open;

_hasBurn1
