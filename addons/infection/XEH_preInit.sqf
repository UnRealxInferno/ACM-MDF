#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#define ACM_SETTINGS_CATEGORY LLSTRING(cba_name)

// Basic

[
    QGVAR(infectionEnabled),
    "CHECKBOX",
    [LLSTRING(SETTING_Enable), LLSTRING(SETTING_Enable_Desc)],
    [ACM_SETTINGS_CATEGORY, ""],
    [true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(infectionStageTime),
    "SLIDER",
    [LLSTRING(SETTING_StageTime), LLSTRING(SETTING_StageTime_Desc)],
    [ACM_SETTINGS_CATEGORY, ""],
    [5, 60, 30, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(infectionRiskMultiplier),
    "SLIDER",
    [LLSTRING(SETTING_RiskMultiplier), LLSTRING(SETTING_RiskMultiplier_Desc)],
    [ACM_SETTINGS_CATEGORY, ""],
    [0.1, 3, 1, 1],
    true
] call CBA_fnc_addSetting;

ADDON = true;
