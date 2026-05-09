#include "..\script_component.hpp"
/*
 * Author: Mazinski
 * Handle Flumazenil benzodiazepine reversal effects (LOCAL)
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

[_patient, false] call ACEFUNC(medical,setUnconscious);
