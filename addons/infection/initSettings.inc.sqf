[
    QGVAR(infectionEnabled),
    "CHECKBOX",
    [LLSTRING(SETTING_Enable), LLSTRING(SETTING_Enable_Desc)],
    [CBA_SETTINGS_CAT, ""],
    [true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(infectionStageTime),
    "SLIDER",
    [LLSTRING(SETTING_StageTime), LLSTRING(SETTING_StageTime_Desc)],
    [CBA_SETTINGS_CAT, ""],
    [5, 60, 30, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(infectionRiskMultiplier),
    "SLIDER",
    [LLSTRING(SETTING_RiskMultiplier), LLSTRING(SETTING_RiskMultiplier_Desc)],
    [CBA_SETTINGS_CAT, ""],
    [0.1, 3, 1, 1],
    true
] call CBA_fnc_addSetting;
