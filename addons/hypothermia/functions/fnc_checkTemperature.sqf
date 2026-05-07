#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Checks patient temperature
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ACM_hypothermia_fnc_checkTemperature;
 *
 * Public: No
 */
params ["_medic", "_patient"];

private _unitTemperature = _patient getVariable [QGVAR(unitTemperature), 37];
private _temperatureState = "";

switch (true) do {
    case (!(alive _patient)) : { _temperatureState = LLSTRING(temperature_dead); };
    case (_unitTemperature < 30) : { _temperatureState = LLSTRING(temperature_dead); };
    case (_unitTemperature < 33) : { _temperatureState = LLSTRING(temperature_cold); };
    case (_unitTemperature < 35) : { _temperatureState = LLSTRING(temperature_cool); };
    case (_unitTemperature < 36.5) : { _temperatureState = LLSTRING(temperature_mild); };
    case (_unitTemperature < 37.6) : { _temperatureState = LLSTRING(temperature_warm); };
    default { _temperatureState = LLSTRING(temperature_hot); };
};

[_temperatureState, 1.5, _medic] call ACEFUNC(common,displayTextStructured);

private _medicName = [_medic, false, true] call ACEFUNC(common,getName);

[_patient, format ["Temperature: %1", _temperatureState]] call ACEFUNC(medical_treatment,addToTriageCard);
[_patient, "quick_view", "%1 checked temperature: %2", [_medicName, _temperatureState]] call ACEFUNC(medical_treatment,addToLog);
