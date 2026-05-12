#include "..\script_component.hpp"
/*
 * Author: MiszczuZPolski
 * Progress callback for NPWT treatment. Bandages open wounds and stitches bandaged wounds.
 *
 * Arguments:
 * 0: Args [Medic, Patient, Body Part] <ARRAY>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * Continue treatment <BOOLEAN>
 *
 * Public: No
 */

params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_medic", "_patient", "_bodyPart"];

private _isBleeding = false;
{
    _x params ["", "_amountOf", "_bleeding"];

    if (_amountOf * _bleeding > 0) exitWith {
        _isBleeding = true;
    };
} forEach ((GET_OPEN_WOUNDS(_patient)) getOrDefault [_bodyPart, []]);

if (!_isBleeding
    && (GET_BANDAGED_WOUNDS(_patient) getOrDefault [_bodyPart, []]) isEqualTo []
    && (GET_CLOTTED_WOUNDS(_patient) getOrDefault [_bodyPart, []]) isEqualTo []
    && (GET_WRAPPED_WOUNDS(_patient) getOrDefault [_bodyPart, []]) isEqualTo []) exitWith {false};

if (_totalTime - _elapsedTime > ([_patient, _patient, _bodyPart] call FUNC(getNPWTTime)) - GVAR(npwtTime)) exitWith {true};

if (_isBleeding) then {
    [QACEGVAR(medical_treatment,bandageLocal), [_patient, _bodyPart, "Dressing"], _patient] call CBA_fnc_targetEvent;
};

private _stitchWoundsOnPart = [];
private _stitchWounds = createHashMap;
private _stitchVar = VAR_BANDAGED_WOUNDS;
private _foundSource = false;

{
    _x params ["_srcWounds", "_srcVar"];
    private _srcOnPart = _srcWounds getOrDefault [_bodyPart, []];
    if (_srcOnPart isNotEqualTo []) exitWith {
        _stitchWoundsOnPart = _srcOnPart;
        _stitchWounds = _srcWounds;
        _stitchVar = _srcVar;
        _foundSource = true;
    };
} forEach [
    [GET_BANDAGED_WOUNDS(_patient), VAR_BANDAGED_WOUNDS],
    [GET_CLOTTED_WOUNDS(_patient), VAR_CLOTTED_WOUNDS],
    [GET_WRAPPED_WOUNDS(_patient), VAR_WRAPPED_WOUNDS]
];

if (!_foundSource) exitWith {false};

private _treatedWound = _stitchWoundsOnPart deleteAt (count _stitchWoundsOnPart - 1);
_treatedWound params ["_treatedID", "_treatedAmountOf", "", "_treatedDamageOf"];

_stitchWounds set [_bodyPart, _stitchWoundsOnPart];

private _stitchedWounds = GET_STITCHED_WOUNDS(_patient);
private _stitchedWoundsOnPart = _stitchedWounds getOrDefault [_bodyPart, [], true];

private _woundIndex = _stitchedWoundsOnPart findIf {
    _x params ["_classID"];
    _classID == _treatedID
};

if (_woundIndex == -1) then {
    _stitchedWoundsOnPart pushBack _treatedWound;
} else {
    private _wound = _stitchedWoundsOnPart select _woundIndex;
    _wound set [1, (_wound select 1) + _treatedAmountOf];
};

_patient setVariable [_stitchVar, _stitchWounds, true];
_patient setVariable [VAR_STITCHED_WOUNDS, _stitchedWounds, true];

private _partIndex = ALL_BODY_PARTS find _bodyPart;
private _bodyPartDamage = _patient getVariable [QACEGVAR(medical,bodyPartDamage), []];
private _damage = (_bodyPartDamage select _partIndex) - (_treatedDamageOf * _treatedAmountOf);
if (_damage < 0.05) then {
    _bodyPartDamage set [_partIndex, 0];
} else {
    _bodyPartDamage set [_partIndex, _damage];
};
_patient setVariable [QACEGVAR(medical,bodyPartDamage), _bodyPartDamage, true];

switch (_bodyPart) do {
    case "head": {[_patient, true, false, false, false] call ACEFUNC(medical_engine,updateBodyPartVisuals);};
    case "body": {[_patient, false, true, false, false] call ACEFUNC(medical_engine,updateBodyPartVisuals);};
    case "leftarm";
    case "rightarm": {[_patient, false, false, true, false] call ACEFUNC(medical_engine,updateBodyPartVisuals);};
    default {[_patient, false, false, false, true] call ACEFUNC(medical_engine,updateBodyPartVisuals);};
};

[_patient] call ACEFUNC(medical_engine,updateDamageEffects);
[_patient] call ACEFUNC(medical_status,updateWoundBloodLoss);
