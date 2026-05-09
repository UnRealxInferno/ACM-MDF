#include "..\script_component.hpp"
/*
 * Author: Mazinski
 * Local call to start the surgical process for a fracture.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

if (GVAR(Surgery_ConsciousnessRequirement) == 1 && !(IS_UNCONSCIOUS(_patient))) exitWith {
    private _output = LLSTRING(fracture_fail);
    [_output, 1.5, _medic] call ACEFUNC(common,displayTextStructured);
};

if (GVAR(Surgery_ConsciousnessRequirement) == 2) then {
    private _ketamineConc = ([_patient, "Ketamine_IV", false] call ACEFUNC(medical_status,getMedicationCount));
    private _fentanylConc = ([_patient, "Fentanyl_IV", false] call ACEFUNC(medical_status,getMedicationCount));
    if ((_ketamineConc max _fentanylConc) <= 0.2) exitWith {
        private _output = LLSTRING(fracture_fail_analgesia);
        [_output, 1.5, _medic] call ACEFUNC(common,displayTextStructured);
    };
};

private _part = ALL_BODY_PARTS find toLower _bodyPart;
private _fractureArray = _patient getVariable [QGVAR(fractures), [0,0,0,0,0,0]];
private _liveFracture = _fractureArray select _part;

_liveFracture = _liveFracture + 0.1;
_fractureArray set [_part, _liveFracture];
_patient setVariable [QGVAR(fractures), _fractureArray, true];

[_patient, false] call ACEFUNC(dragging,setCarryable);
[_patient, false] call ACEFUNC(dragging,setDraggable);

[_patient, "quick_view", LSTRING(incision_log), [[_medic] call ACEFUNC(common,getName), STRING_BODY_PARTS select _part]] call ACEFUNC(medical_treatment,addToLog);

[{
    params ["_args", "_idPFH"];
    _args params ["_patient", "_part"];

    private _fractureArray = _patient getVariable [QGVAR(fractures), [0,0,0,0,0,0]];
    private _liveFracture = _fractureArray select _part;
    private _etomidateConc = ([_patient, "Etomidate_IV", false] call ACEFUNC(medical_status,getMedicationCount));
    private _lorazepamConc = ([_patient, "Midazolam_IV", false] call ACEFUNC(medical_status,getMedicationCount));
    private _count = _etomidateConc max _lorazepamConc;

    private _alive = alive _patient;

    if ((!_alive) || (_liveFracture == 0)) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        _patient setVariable [QGVAR(etomidate_Pain), false]
    };

    if (((GVAR(Surgery_ConsciousnessRequirement) in [0,1]) && (!(IS_UNCONSCIOUS(_patient))) && (_count <= 0.2)) || (GVAR(Surgery_ConsciousnessRequirement) == 3 && _count <= 0.2)) exitWith {
        if !(_patient getVariable [QGVAR(etomidate_Pain), false]) then {
            [_patient, "Pain", 2, 10, 120, 0.8, 40] call ACEFUNC(medical_status,addMedicationAdjustment);
            _patient setVariable [QGVAR(etomidate_Pain), true]};
        [_patient, true] call ACEFUNC(medical,setUnconscious);
    };

    if (GVAR(Surgery_ConsciousnessRequirement) == 2) then {
        private _ketamineConc = ([_patient, "Ketamine_IV", false] call ACEFUNC(medical_status,getMedicationCount));
        private _fentanylConc = ([_patient, "Fentanyl_IV", false] call ACEFUNC(medical_status,getMedicationCount));
        if ((_ketamineConc max _fentanylConc) <= 0.2) then {
            if !(_patient getVariable [QGVAR(etomidate_Pain), false]) then {
                [_patient, "Pain", 2, 10, 120, 0.8, 40] call ACEFUNC(medical_status,addMedicationAdjustment);
                _patient setVariable [QGVAR(etomidate_Pain), true]
            };
        };
    };
}, 5, [_patient, _part]] call CBA_fnc_addPerFrameHandler;
