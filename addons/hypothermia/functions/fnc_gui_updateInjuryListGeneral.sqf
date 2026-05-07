#include "..\script_component.hpp"
/*
 * Author: Inferno
 * Adds hypothermia status entries to the ACE medical overview list.
 *
 * Arguments:
 * 0: Injury list control <CONTROL>
 * 1: Target <OBJECT>
 * 2: Body part index <NUMBER>
 * 3: Existing entries <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ctrl, _target, -1, _entries] call ACM_hypothermia_fnc_gui_updateInjuryListGeneral
 *
 * Public: No
 */

params ["_ctrl", "_target", "_selectionN", "_entries"];

// Warmers are intentionally not displayed in overview.
