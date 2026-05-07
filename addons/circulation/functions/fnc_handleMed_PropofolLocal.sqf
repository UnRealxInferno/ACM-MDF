#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Handles surgery sedation effects when Propofol is administered.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_circulation_fnc_handleMed_PropofolLocal;
 *
 * Public: No
 */

params ["_patient"];

if (!alive _patient) exitWith {};

_patient setVariable [QEGVAR(surgery,sedated), true, true];
[_patient, true] call ACEFUNC(medical,setUnconscious);

if (random 1 < 0.45) then {
    [_patient, "BRADYCARDIA", 120, 1800, -35, 0, 0] call ACEFUNC(medical_status,addMedicationAdjustment);
};
