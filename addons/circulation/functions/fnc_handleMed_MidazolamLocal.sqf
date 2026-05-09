#include "..\script_component.hpp"
/*
 * Author: Mazinski
 * Handle Midazolam sedation effects (LOCAL)
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_patient"];

[{
    params ["_patient"];
    ([_patient, "Midazolam_IV", false] call ACEFUNC(medical_status,getMedicationCount)) >= 0.5;
}, {
    params ["_patient"];
    [_patient, true] call ACEFUNC(medical,setUnconscious);
}, [_patient], 60] call CBA_fnc_waitUntilAndExecute;
