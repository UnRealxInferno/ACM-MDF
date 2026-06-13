#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#define ACM_SETTINGS_CATEGORY LLSTRING(cba_name)

[
    QGVAR(burnsEnabled),
    "CHECKBOX",
    [LLSTRING(SETTING_Enable), LLSTRING(SETTING_Enable_Desc)],
    [ACM_SETTINGS_CATEGORY, ""],
    [true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(sourcesEnabled),
    "CHECKBOX",
    [LLSTRING(SETTING_Sources), LLSTRING(SETTING_Sources_Desc)],
    [ACM_SETTINGS_CATEGORY, ""],
    [true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(igniteChanceMul),
    "SLIDER",
    [LLSTRING(SETTING_IgniteChance), LLSTRING(SETTING_IgniteChance_Desc)],
    [ACM_SETTINGS_CATEGORY, ""],
    [0, 3, 1, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(burn3PainlessChance),
    "SLIDER",
    [LLSTRING(SETTING_Burn3Painless), LLSTRING(SETTING_Burn3Painless_Desc)],
    [ACM_SETTINGS_CATEGORY, ""],
    [0, 1, 0.5, 2],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(headBurnAirwayChance),
    "SLIDER",
    [LLSTRING(SETTING_AirwayChance), LLSTRING(SETTING_AirwayChance_Desc)],
    [ACM_SETTINGS_CATEGORY, ""],
    [0, 1, 0.3, 2],
    true
] call CBA_fnc_addSetting;

ADDON = true;
