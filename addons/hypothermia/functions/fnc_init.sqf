#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Initializes unit variables.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACM_hypothermia_fnc_init;
 *
 * Public: No
 */

params ["_unit", ["_isRespawn", true]];

if (!local _unit) exitWith {};

[_unit] call FUNC(fullHealLocal);

private _oldPFH = _unit getVariable [QGVAR(handWarmerPFH), -1];
if (_oldPFH != -1) then {
    [_oldPFH] call CBA_fnc_removePerFrameHandler;
};

if (GVAR(hypothermiaActive)) then {
    private _pfh = [{
        params ["_args", "_idPFH"];
        _args params ["_unit"];

        if (!alive _unit) exitWith {
            _unit setVariable [QGVAR(handWarmerPFH), -1];
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        private _handWarmers = _unit getVariable [QGVAR(handWarmers), [0,0,0,0,0,0]];
        private _activeWarmers = 0;

        {
            private _timeRemaining = _x;

            if (_timeRemaining > 0) then {
                _handWarmers set [_forEachIndex, (_timeRemaining - 1) max 0];
                _activeWarmers = _activeWarmers + 1;
            } else {
                _handWarmers set [_forEachIndex, 0];
            };
        } forEach _handWarmers;

        _unit setVariable [QGVAR(handWarmers), _handWarmers, true];

        if (GET_EFF_BLOOD_VOLUME(_unit) > 4) then {
            private _impact = _unit getVariable [QGVAR(warmingImpact), 0];
            if (_activeWarmers > 0) then {
                // Scale warming with the number of active warmers so stacking matters.
                _impact = _impact + (180 * _activeWarmers);
            };
            if (_impact > 0) then {
                _impact = _impact - 80;
            } else {
                if (_impact < 0) then {
                    _impact = _impact + 160;
                };
            };
            _unit setVariable [QGVAR(warmingImpact), (_impact max -4000) min 12000, true];
        };
    }, 60, [_unit]] call CBA_fnc_addPerFrameHandler;

    _unit setVariable [QGVAR(handWarmerPFH), _pfh];
};
