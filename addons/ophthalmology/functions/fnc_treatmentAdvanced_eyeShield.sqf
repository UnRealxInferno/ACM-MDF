#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Handles the placement of the eye shield
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, patient] call ACM_ophthalmology_fnc_treatmentAdvanced_eyeShield
 *
 * Public: No
 */
 
params ["_medic", "_patient"];

private _eyeInjuries = _patient getVariable [QGVAR(eyeInjuries), [1, 1]];

#define IDC_LEFT_EYE_CONTROL 17103
#define IDC_RIGHT_EYE_CONTROL 17102

"ACM_EyeShield" cutRsc ["ACM_EyeShield", "PLAIN", 0, true];


private _fnc_applyEyeCover = {
    params ["_patient", "_shieldItem", "_eyeDisplay", "_eyeIndex"];

    // If patient has NVGs on, move them to the patient's inventory
    if (hmd _patient != "") then {
        _patient addItem (hmd _patient);
    };

    private _display = uiNamespace getVariable ["ACM_EyeShield", displayNull];
    private _activeEye = _display displayCtrl _eyeDisplay;

    _patient linkItem _shieldItem;
    
    _activeEye ctrlShow true;
    _activeEye ctrlCommit 0;

    // Approximately 8 minutes to fully re-heal a damaged eye using the eyeshield
    [{
        params ["_args", "_pfhID"];
        _args params ["_patient", "_activeEye", "_shieldItem", "_eyeIndex"];
    
        if ((hmd _patient) != _shieldItem) exitWith {
            _pfhID call CBA_fnc_removePerFrameHandler;
            "ACM_EyeShield" cutText ["","PLAIN",0,true];
        };
    
        private _eyeInjury = _patient getVariable [QGVAR(eyeInjuries), [1, 1]];
        _eyeInjury set [_eyeIndex, (((_eyeInjury select _eyeIndex) + 0.002) min 1)];
        _patient setVariable [QGVAR(eyeInjuries), _eyeInjury, true];

        if (({_x < 1} count _eyeInjury) == 0) then {
            _patient setVariable [QGVAR(eyeInjurySevere), false, true];
        };
    }, 1, [
        _patient,
        _activeEye,
        _shieldItem,
        _eyeIndex
    ]] call CBA_fnc_addPerFrameHandler;
};

if ((_eyeInjuries select 0) <= (_eyeInjuries select 1)) then {
    [_patient, "kat_eyecovers_left", IDC_LEFT_EYE_CONTROL, 0] call _fnc_applyEyeCover;
} else {
    [_patient, "kat_eyecovers_right", IDC_RIGHT_EYE_CONTROL, 1] call _fnc_applyEyeCover;
};

[_patient, LLSTRING(eyeshield_item)] call ACEFUNC(medical_treatment,addToTriageCard);
[_patient, "activity", ACELSTRING(medical_treatment,Activity_usedItem), [[_medic] call ACEFUNC(common,getName), LLSTRING(eyeshield_item)]] call ACEFUNC(medical_treatment,addToLog);
