#include "..\script_component.hpp"
/*
 * Author: MiszczuZPolski, Inferno
 * Apply the persistent single-eye or full-blind injury overlay.
 *
 * Arguments:
 * 0: Enable <BOOL>
 * 1: Eye state <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_enable", ["_eyeArray", [1, 1]]];

if (isNull findDisplay 46) exitWith {};

private _controls = uiNamespace getVariable [QGVAR(eyeControls), [controlNull, controlNull, controlNull]];
_controls params ["_rightEyeControl", "_leftEyeControl", "_wholeInjuryControl"];

if (isNull _rightEyeControl) then {
    _rightEyeControl = findDisplay 46 ctrlCreate ["RscPicture", -1];
    _leftEyeControl = findDisplay 46 ctrlCreate ["RscPicture", -1];
    _wholeInjuryControl = findDisplay 46 ctrlCreate ["RscPicture", -1];

    _rightEyeControl ctrlSetText QPATHTOF(ui\RightEyeEffect.paa);
    _leftEyeControl ctrlSetText QPATHTOF(ui\LeftEyeEffect.paa);
    _wholeInjuryControl ctrlSetText QPATHTOF(ui\BlindEffect.paa);

    private _position = [safeZoneXAbs, safeZoneY, safeZoneWAbs, safeZoneH];
    _rightEyeControl ctrlSetPosition _position;
    _leftEyeControl ctrlSetPosition _position;
    _wholeInjuryControl ctrlSetPosition _position;

    _rightEyeControl ctrlSetFade 1;
    _leftEyeControl ctrlSetFade 1;
    _wholeInjuryControl ctrlSetFade 1;

    _rightEyeControl ctrlCommit 0;
    _leftEyeControl ctrlCommit 0;
    _wholeInjuryControl ctrlCommit 0;

    uiNamespace setVariable [QGVAR(eyeControls), [_rightEyeControl, _leftEyeControl, _wholeInjuryControl]];
};

if (!_enable) exitWith {
    _rightEyeControl ctrlSetFade 1;
    _leftEyeControl ctrlSetFade 1;
    _wholeInjuryControl ctrlSetFade 1;

    _rightEyeControl ctrlCommit 0;
    _leftEyeControl ctrlCommit 0;
    _wholeInjuryControl ctrlCommit 0;
};

_eyeArray params [["_rightEye", 1], ["_leftEye", 1]];

if (_rightEye <= 0 && {_leftEye <= 0}) exitWith {
    _rightEyeControl ctrlSetFade 1;
    _leftEyeControl ctrlSetFade 1;
    _wholeInjuryControl ctrlSetFade 0;

    _rightEyeControl ctrlCommit 0;
    _leftEyeControl ctrlCommit 0;
    _wholeInjuryControl ctrlCommit 0;
};

_rightEyeControl ctrlSetFade _rightEye;
_leftEyeControl ctrlSetFade _leftEye;
_wholeInjuryControl ctrlSetFade 1;

_rightEyeControl ctrlCommit 0;
_leftEyeControl ctrlCommit 0;
_wholeInjuryControl ctrlCommit 0;
