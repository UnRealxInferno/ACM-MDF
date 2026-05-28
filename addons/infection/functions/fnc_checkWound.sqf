#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Examine action callback — reports clinical infection signs to the medic for the examined body part.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body part <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "RightArm"] call ACM_infection_fnc_checkWound;
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

private _partLower = toLower _bodyPart;

private _hasWounds =
    !(GET_OPEN_WOUNDS(_patient)     getOrDefault [_partLower, []] isEqualTo []) ||
    !(GET_BANDAGED_WOUNDS(_patient) getOrDefault [_partLower, []] isEqualTo []) ||
    !(GET_CLOTTED_WOUNDS(_patient)  getOrDefault [_partLower, []] isEqualTo []) ||
    !(GET_WRAPPED_WOUNDS(_patient)  getOrDefault [_partLower, []] isEqualTo []) ||
    !(GET_STITCHED_WOUNDS(_patient) getOrDefault [_partLower, []] isEqualTo []);

private _stage = _patient getVariable [QGVAR(Infection_Stage), 0];

private _report = switch (true) do {
    case (!_hasWounds):  { LLSTRING(CheckWound_NoWounds) };
    case (_stage == 0):  { LLSTRING(CheckWound_Healing) };
    case (_stage == 1):  { LLSTRING(CheckWound_Inflamed) };
    case (_stage == 2):  { LLSTRING(CheckWound_Infected) };
    default              { LLSTRING(CheckWound_Critical) };
};

[_report, 2, _medic] call ACEFUNC(common,displayTextStructured);

private _medicName = [_medic, false, true] call ACEFUNC(common,getName);
[_patient, format ["Wound check (%1): %2", _bodyPart, _report]] call ACEFUNC(medical_treatment,addToTriageCard);
[_patient, "quick_view", "%1 checked wound (%2): %3", [_medicName, _bodyPart, _report]] call ACEFUNC(medical_treatment,addToLog);
