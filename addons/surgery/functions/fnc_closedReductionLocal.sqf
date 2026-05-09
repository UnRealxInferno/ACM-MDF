#include "..\script_component.hpp"
/*
 * Author: Mazinski
 * Local call for fully healing a simple fracture.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

private _part = ALL_BODY_PARTS find toLower _bodyPart;
playSound3D [QPATHTO_R(sounds\reduction.wav), _patient, false, getPosASL _patient, 8, 1, 15];

private _activeFracture = GET_FRACTURES(_patient);
private _fractureArray = _patient getVariable [QGVAR(fractures), [0,0,0,0,0,0]];

private _painControlEffectiveness = 0;
{
    _painControlEffectiveness = _painControlEffectiveness max ([_patient, _x, false] call ACEFUNC(medical_status,getMedicationCount));
} forEach [
    "Fentanyl",
    "Fentanyl_IV",
    "Fentanyl_BUC",
    "Ketamine",
    "Ketamine_IV",
    "Morphine",
    "Morphine_IV",
    "Lidocaine",
    "Lidocaine_IV"
];

if (_painControlEffectiveness <= 0.8) then {
    [_patient, [0.7, 0.8, 0.9] select (floor random 3)] call ACEFUNC(medical_status,adjustPainLevel);
};

if (random 100 < GVAR(closedReductionFailChance)) exitWith {
    private _output = LLSTRING(fracture_fail);
    [_output, 1.5, _medic] call ACEFUNC(common,displayTextStructured);
};

_activeFracture set [_part, 0];
_fractureArray set [_part, 0];

_patient setVariable [QGVAR(fractures), _fractureArray, true];
_patient setVariable [VAR_FRACTURES, _activeFracture, true];
_patient setVariable [QACEGVAR(medical,isLimping), false, true];
[_patient, "blockSprint", QACEGVAR(medical,fracture), false] call ACEFUNC(common,statusEffect_set);
[_patient] call ACEFUNC(medical_engine,updateDamageEffects);
