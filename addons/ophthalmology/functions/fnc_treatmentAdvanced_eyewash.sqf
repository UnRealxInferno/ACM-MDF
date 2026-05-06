#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Handles the treatment of dust or heavy dust in eyes.
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, patient] call ACM_ophthalmology_fnc_treatmentAdvanced_eyewash
 *
 * Public: No
 */

params ["_medic", "_patient"];

[_patient] call FUNC(clearEyeInjury);

[_patient, LLSTRING(eyewash_item)] call ACEFUNC(medical_treatment,addToTriageCard);
[_patient, "activity", ACELSTRING(medical_treatment,Activity_usedItem), [[_medic] call ACEFUNC(common,getName), LLSTRING(eyewash_item)]] call ACEFUNC(medical_treatment,addToLog);
