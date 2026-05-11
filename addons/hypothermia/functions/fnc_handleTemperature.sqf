#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Calculates and stores unit temperature from blood volume, environment and warming impact.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Altitude temperature impact <NUMBER>
 * 2: Blood volume <NUMBER>
 * 3: Time since last update <NUMBER>
 * 4: Sync value <BOOL>
 *
 * Return Value:
 * Current temperature <NUMBER>
 *
 * Example:
 * [player, 0, 6, 1, true] call ACM_hypothermia_fnc_handleTemperature;
 *
 * Public: No
 */

params ["_unit", "_altitudeAdjustment", "_bloodVolume", "_deltaT", "_syncValue"];

private _bloodVolumeSafe = _bloodVolume max 0.1;
private _mapTemperature = missionNamespace getVariable ["ace_weather_currentTemperature", 15];
private _warmingImpact = (_unit getVariable [QGVAR(warmingImpact), 0]) / 1000;
private _pointTemperature = linearConversion [0, 40, (-3.5 * (0.95 ^ _mapTemperature + _altitudeAdjustment)), 12, -9, true];
private _initialBodyTemperature = 37 min (((-0.3392 * (_bloodVolumeSafe ^ 2)) + (6.00357 * _bloodVolumeSafe) + 13.3));
private _speed = if ((vehicle _unit) isEqualTo _unit) then { vectorMagnitude (velocity _unit) } else { 0 };
private _movementWarming = linearConversion [0, 4, 0, 1.5, _speed, true];
private _targetTemperature = _initialBodyTemperature + _warmingImpact + _movementWarming - (_pointTemperature / _bloodVolumeSafe);
_targetTemperature = _targetTemperature min 37;
private _currentTemperature = _unit getVariable [QGVAR(unitTemperature), 37];
private _baseChangeRate = linearConversion [35, 39, _targetTemperature, 1 / 300, 1 / 900, true];
private _hemorrhageMultiplier = linearConversion [6, 3, _bloodVolumeSafe, 1, 3.5, true];
private _temperatureChangeRate = _baseChangeRate * _hemorrhageMultiplier;
_currentTemperature = _currentTemperature + ((_targetTemperature - _currentTemperature) * ((_deltaT * _temperatureChangeRate) min 1));

_unit setVariable [QGVAR(unitTemperature), _currentTemperature, _syncValue];

_currentTemperature
