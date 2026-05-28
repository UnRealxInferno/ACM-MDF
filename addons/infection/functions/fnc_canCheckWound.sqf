#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Condition for the Check Wound treatment action.
 * Returns true if the infection system is enabled and the target body part has any treated wounds.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body part <STRING>
 *
 * Return Value:
 * Can perform action <BOOL>
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

if (!GVAR(infectionEnabled)) exitWith { false };

private _part = toLower _bodyPart;

!(GET_BANDAGED_WOUNDS(_patient) getOrDefault [_part, []] isEqualTo []) ||
!(GET_CLOTTED_WOUNDS(_patient)  getOrDefault [_part, []] isEqualTo []) ||
!(GET_WRAPPED_WOUNDS(_patient)  getOrDefault [_part, []] isEqualTo []) ||
!(GET_STITCHED_WOUNDS(_patient) getOrDefault [_part, []] isEqualTo [])
