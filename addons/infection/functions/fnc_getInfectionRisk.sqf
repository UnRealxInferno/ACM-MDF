#include "..\script_component.hpp"
/*
 * Author: INFERNO
 * Calculates infection risk delta for the current 30s tick.
 * Returns 0 if the 1-hour eligibility window has not elapsed.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * Risk delta <NUMBER>
 *
 * Example:
 * [player] call ACM_infection_fnc_getInfectionRisk;
 *
 * Public: No
 */

params ["_patient"];

private _eligibleTime = _patient getVariable [QGVAR(Infection_EligibleTime), -1];
if (_eligibleTime < 0 || {CBA_missionTime < _eligibleTime}) exitWith {0};

([_patient] call FUNC(getWoundCount)) params ["_clotted", "_bandaged", "_wrapped", "_stitched"];

private _rawRisk = (_clotted  * 0.040)
                + (_bandaged * 0.030)
                + (_wrapped  * 0.018)
                + (_stitched * 0.006);

_rawRisk = _rawRisk * GVAR(infectionRiskMultiplier);

private _abLevel = (
    ([_patient, "Ertapenem_IV", false] call ACEFUNC(medical_status,getMedicationCount)) +
    ([_patient, "Ertapenem",    false] call ACEFUNC(medical_status,getMedicationCount)) +
    ([_patient, "Moxifloxacin", false] call ACEFUNC(medical_status,getMedicationCount))
) min 2;

private _riskMultiplier = linearConversion [0.5, 2.0, _abLevel, 1.0, 0.0, true];

_rawRisk * _riskMultiplier
