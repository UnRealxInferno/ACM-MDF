#include "..\script_component.hpp"
/*
 * Author: Mazinski, Inferno
 * Shows the eye shield overlay on the local machine for the given eye control
 *
 * Arguments:
 * 0: Eye display IDC <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_eyeDisplay"];

"ACM_EyeShield" cutRsc ["ACM_EyeShield", "PLAIN", 0, true];

private _display = uiNamespace getVariable ["ACM_EyeShield", displayNull];
private _activeEye = _display displayCtrl _eyeDisplay;
_activeEye ctrlShow true;
_activeEye ctrlCommit 0;
