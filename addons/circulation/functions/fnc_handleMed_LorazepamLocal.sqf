#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Handles surgery sedation effects when Lorazepam is administered.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_circulation_fnc_handleMed_LorazepamLocal;
 *
 * Public: No
 */

params ["_patient"];

if (!alive _patient) exitWith {};

_patient setVariable [QEGVAR(surgery,sedated), true, true];
[_patient, true] call ACEFUNC(medical,setUnconscious);

if (random 1 < 0.33) then {
    [_patient, "BRADYCARDIA", 120, 1200, -35, 0, 0] call ACEFUNC(medical_status,addMedicationAdjustment);
};
