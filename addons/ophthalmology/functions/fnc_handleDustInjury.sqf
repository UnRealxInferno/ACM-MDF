#include "..\script_component.hpp"
/*
 * Author: MiszczuZPolski, Inferno
 * Handles the possibility to have dust in the eye.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Cause <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "dust"] call ACM_ophthalmology_fnc_handleDustInjury;
 *
 * Public: No
 */

params ["_unit", "_cause"];

private _random = floor (random 100);

if (_cause in ["dust", "rotorWash"]) then {
    if (_random < GVAR(probability_dust)) exitWith {
        [0.1, false] call FUNC(effectEyeBlink);

        private _dustInjuryLight = _unit getVariable [QGVAR(dustInjuryLight), 0];

        if (_random < GVAR(probability_dust_heavy)) then {
            private _dustInjuryHeavy = _unit getVariable [QGVAR(dustInjuryHeavy), 0];

            _unit setVariable [QGVAR(dustInjuryHeavy), ((_dustInjuryHeavy + (0.5 + random 0.5)) min 5), true];
        } else {
            _unit setVariable [QGVAR(dustInjuryLight), ((_dustInjuryLight + (0.5 + random 0.5)) min 5), true];
        };

        if (_unit == ACE_player) then {
            [true, GET_DUST_INJURY(_unit)] call FUNC(effectEyeInjury);
        };

        if (GET_DUST_INJURY(_unit) > 5) then {
            private _eyeInjuries = _unit getVariable [QGVAR(eyeInjuries), [1, 1]];

            private _injuredEye = floor random 2;

            _eyeInjuries set [_injuredEye, 0];

            if (({_x == 0} count _eyeInjuries) > 1) then {
                _unit setVariable [QGVAR(eyeInjurySevere), true, true];
            };

            _unit setVariable [QGVAR(eyeInjuries), _eyeInjuries, true];

            if (_unit == ACE_player) then {
                [true, _eyeInjuries] call FUNC(effectHurtEye);
            };
        };
    };
};
