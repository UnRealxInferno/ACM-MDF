#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#define CBA_SETTINGS_EFAK "MedMash - First Aid Kits"

// Remove IFAK when empty
[
    QGVAR(IFAK_RemoveWhenEmpty),
    "CHECKBOX",
    LLSTRING(SETTING_FAK_RemoveWhenEmpty),
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_IFAK)],
    [true],
    0
] call CBA_fnc_addSetting;

//IFAK Container
[
    QGVAR(IFAK_Container),
    "LIST",
    [LLSTRING(SETTING_FAK_Container), LLSTRING(SETTING_FAK_Container_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_IFAK)],
    [[0, 1, 2, 3], [LLSTRING(SETTING_Container_Default), LLSTRING(SETTING_Container_Uniform), LLSTRING(SETTING_Container_Vest), LLSTRING(SETTING_Container_Backpack)], 0],
    0
] call CBA_fnc_addSetting;

//IFAK Slot Color
[
    QGVAR(IFAK_Slot_Color),
    "COLOR",
    [LLSTRING(SETTING_FAK_SlotColor), LLSTRING(SETTING_FAK_SlotColor_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_IFAK)],
    [1, 0.30, 0.30],
    0
] call CBA_fnc_addSetting;

//IFAK Item Color
[
    QGVAR(IFAK_Item_Color),
    "COLOR",
    [LLSTRING(SETTING_FAK_ItemColor), LLSTRING(SETTING_FAK_ItemColor_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_IFAK)],
    [0.67, 0.84, 0.90],
    0
] call CBA_fnc_addSetting;

//IFAK First Slot Item
[
    QGVAR(IFAKFirstSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_FirstSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_IFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(IFAKFirstSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(IFAKFirstSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//IFAK Second Slot Item
[
    QGVAR(IFAKSecondSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_SecondSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_IFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(IFAKSecondSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(IFAKSecondSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//IFAK Third Slot Item
[
    QGVAR(IFAKThirdSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_ThirdSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_IFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(IFAKThirdSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(IFAKThirdSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//IFAK Fourth Item
[
    QGVAR(IFAKFourthSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_FourthSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_IFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(IFAKFourthSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(IFAKFourthSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

// Remove AFAK when empty
[
    QGVAR(AFAK_RemoveWhenEmpty),
    "CHECKBOX",
    LLSTRING(SETTING_FAK_RemoveWhenEmpty),
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_AFAK)],
    [true],
    0
] call CBA_fnc_addSetting;

//AFAK Container
[
    QGVAR(AFAK_Container),
    "LIST",
    [LLSTRING(SETTING_FAK_Container), LLSTRING(SETTING_FAK_Container_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_AFAK)],
    [[0, 1, 2, 3], [LLSTRING(SETTING_Container_Default), LLSTRING(SETTING_Container_Uniform), LLSTRING(SETTING_Container_Vest), LLSTRING(SETTING_Container_Backpack)], 0],
    0
] call CBA_fnc_addSetting;

//AFAK Slot Color
[
    QGVAR(AFAK_Slot_Color),
    "COLOR",
    [LLSTRING(SETTING_FAK_SlotColor), LLSTRING(SETTING_FAK_SlotColor_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_AFAK)],
    [1, 0.96, 0.32],
    0
] call CBA_fnc_addSetting;

//AFAK Item Color
[
    QGVAR(AFAK_Item_Color),
    "COLOR",
    [LLSTRING(SETTING_FAK_ItemColor), LLSTRING(SETTING_FAK_ItemColor_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_AFAK)],
    [0.67, 0.84, 0.90],
    0
] call CBA_fnc_addSetting;

//AFAK First Slot Item
[
    QGVAR(AFAKFirstSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_FirstSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_AFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(AFAKFirstSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(AFAKFirstSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//AFAK Second Slot Item
[
    QGVAR(AFAKSecondSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_SecondSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_AFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(AFAKSecondSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(AFAKSecondSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//AFAK Third Slot Item
[
    QGVAR(AFAKThirdSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_ThirdSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_AFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(AFAKThirdSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(AFAKThirdSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//AFAK Fourth Item
[
    QGVAR(AFAKFourthSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_FourthSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_AFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(AFAKFourthSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(AFAKFourthSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//AFAK Fifth Item
[
    QGVAR(AFAKFifthSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_FifthSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_AFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(AFAKFifthSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(AFAKFifthSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//AFAK Sixth Item
[
    QGVAR(AFAKSixthSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_SixthSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_AFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(AFAKSixthSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(AFAKSixthSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

// Remove MFAK when empty
[
    QGVAR(MFAK_RemoveWhenEmpty),
    "CHECKBOX",
    LLSTRING(SETTING_FAK_RemoveWhenEmpty),
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    [true],
    0
] call CBA_fnc_addSetting;

//MFAK Container
[
    QGVAR(MFAK_Container),
    "LIST",
    [LLSTRING(SETTING_FAK_Container), LLSTRING(SETTING_FAK_Container_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    [[0, 1, 2, 3], [LLSTRING(SETTING_Container_Default), LLSTRING(SETTING_Container_Uniform), LLSTRING(SETTING_Container_Vest), LLSTRING(SETTING_Container_Backpack)], 0],
    0
] call CBA_fnc_addSetting;

//MFAK Slot Color
[
    QGVAR(MFAK_Slot_Color),
    "COLOR",
    [LLSTRING(SETTING_FAK_SlotColor), LLSTRING(SETTING_FAK_SlotColor_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    [0.56, 0.93, 0.56],
    0
] call CBA_fnc_addSetting;

//MFAK Item Color
[
    QGVAR(MFAK_Item_Color),
    "COLOR",
    [LLSTRING(SETTING_FAK_ItemColor), LLSTRING(SETTING_FAK_ItemColor_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    [0.67, 0.84, 0.90],
    0
] call CBA_fnc_addSetting;

//MFAK First Slot Item
[
    QGVAR(MFAKFirstSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_FirstSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(MFAKFirstSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(MFAKFirstSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//MFAK Second Slot Item
[
    QGVAR(MFAKSecondSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_SecondSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(MFAKSecondSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(MFAKSecondSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//MFAK Third Slot Item
[
    QGVAR(MFAKThirdSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_ThirdSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(MFAKThirdSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(MFAKThirdSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//MFAK Fourth Item
[
    QGVAR(MFAKFourthSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_FourthSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(MFAKFourthSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(MFAKFourthSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//MFAK Fifth Item
[
    QGVAR(MFAKFifthSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_FifthSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(MFAKFifthSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(MFAKFifthSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//MFAK Sixth Item
[
    QGVAR(MFAKSixthSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_SixthSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(MFAKSixthSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(MFAKSixthSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//MFAK Seventh Item
[
    QGVAR(MFAKSeventhSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_SeventhSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(MFAKSeventhSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(MFAKSeventhSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

//MFAK Eighth Item
[
    QGVAR(MFAKEighthSlotItem),
    "EDITBOX",
    [LLSTRING(SETTING_EighthSlot_Item), LLSTRING(SETTING_ItemSlot_DESC)],
    [CBA_SETTINGS_EFAK, LSTRING(SubCategory_MFAK)],
    "[['ACE_Banana', 1]]",
    0,
    {
        private _string = missionNamespace getVariable [QGVAR(MFAKEighthSlotItem), []];
        private _array = parseSimpleArray _string;
        missionNamespace setVariable [QGVAR(MFAKEighthSlotItem), _array, true];
        call FUNC(FAK_updateContents);
    }
] call CBA_Settings_fnc_init;

ADDON = true;
