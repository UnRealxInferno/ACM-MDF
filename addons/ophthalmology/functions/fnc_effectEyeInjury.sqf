#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Apply the persistent dust eye injury shutter effect.
 *
 * Arguments:
 * 0: Enable <BOOL>
 * 1: Injury severity <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_enable", ["_injurySeverity", 0]];

if (isNull findDisplay 46) exitWith {};

private _controls = uiNamespace getVariable [QGVAR(eyeInjuryControls), [controlNull, controlNull]];
_controls params ["_upperLidShutter", "_lowerLidShutter"];

if (isNull _upperLidShutter) then {
    _upperLidShutter = findDisplay 46 ctrlCreate ["RscPicture", -1];
    _lowerLidShutter = findDisplay 46 ctrlCreate ["RscPicture", -1];

    _upperLidShutter ctrlSetText QPATHTOF(ui\UpperBlink.paa);
    _lowerLidShutter ctrlSetText QPATHTOF(ui\LowerBlink.paa);

    _upperLidShutter ctrlSetPosition [safeZoneXAbs, (safeZoneY - safeZoneH), safeZoneWAbs, safeZoneH];
    _lowerLidShutter ctrlSetPosition [safeZoneXAbs, (safeZoneY + safeZoneH), safeZoneWAbs, safeZoneH];

    _upperLidShutter ctrlSetFade 0;
    _lowerLidShutter ctrlSetFade 0;

    _upperLidShutter ctrlCommit 0;
    _lowerLidShutter ctrlCommit 0;

    uiNamespace setVariable [QGVAR(eyeInjuryControls), [_upperLidShutter, _lowerLidShutter]];
};

if (_enable && {_injurySeverity > 0}) then {
    private _severity = linearConversion [0, 5, _injurySeverity, 2.5, 5, true];

    _upperLidShutter ctrlSetPosition [safeZoneXAbs, ((safeZoneY - safeZoneH) + ((safeZoneH / 5) * _severity)), safeZoneWAbs, safeZoneH];
    _lowerLidShutter ctrlSetPosition [safeZoneXAbs, ((safeZoneY + safeZoneH) - ((safeZoneH / 5) * _severity)), safeZoneWAbs, safeZoneH];

    _upperLidShutter ctrlCommit 0.05;
    _lowerLidShutter ctrlCommit 0.05;
} else {
    _upperLidShutter ctrlSetPosition [safeZoneXAbs, (safeZoneY - safeZoneH), safeZoneWAbs, safeZoneH];
    _lowerLidShutter ctrlSetPosition [safeZoneXAbs, (safeZoneY + safeZoneH), safeZoneWAbs, safeZoneH];

    _upperLidShutter ctrlCommit 0;
    _lowerLidShutter ctrlCommit 0;
};
