class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {   
                class EFAK_IFAK_Item {
                    displayName = CSTRING(IFAK_Unpack);
                    condition = QUOTE([ARR_4(_target,'efak_IFAK',0,0)] call FUNC(FAK_checkSlot) && !([_target] call ACEFUNC(common,isAwake)));
                    statement = QUOTE([ARR_4(_target,'efak_IFAK',0,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\IFAK.paa);

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_target,'efak_IFAK',0,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_IFAK',0,1)] call FUNC(FAK_unpack));
                        showDisabled = 0;
                        icon = QPATHTOF(ui\IFAK.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_target,'efak_IFAK',0,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_IFAK',0,2)] call FUNC(FAK_unpack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_target,'efak_IFAK',0,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_IFAK',0,3)] call FUNC(FAK_unpack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_target,'efak_IFAK',0,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_IFAK',0,4)] call FUNC(FAK_unpack));
                    };
                };

                class EFAK_IFAK_Mag {
                    displayName = CSTRING(IFAK_Unpack);
                    condition = QUOTE([ARR_4(_target,'efak_IFAK_Magazine',0,0)] call FUNC(FAK_checkSlot) && !([_target] call ACEFUNC(common,isAwake)));
                    statement = QUOTE([ARR_4(_target,'efak_IFAK_Magazine',0,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\IFAK.paa);

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_target,'efak_IFAK_Magazine',0,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_IFAK_Magazine',0,1)] call FUNC(FAK_unpack));
                        showDisabled = 0;
                        icon = QPATHTOF(ui\IFAK.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_target,'efak_IFAK_Magazine',0,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_IFAK_Magazine',0,2)] call FUNC(FAK_unpack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_target,'efak_IFAK_Magazine',0,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_IFAK_Magazine',0,3)] call FUNC(FAK_unpack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_target,'efak_IFAK_Magazine',0,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_IFAK_Magazine',0,4)] call FUNC(FAK_unpack));
                    };

                };

                class EFAK_AFAK_Item {
                    displayName = CSTRING(AFAK_Unpack);
                    condition = QUOTE([ARR_4(_target,'efak_AFAK',1,0)] call FUNC(FAK_checkSlot) && !([_target] call ACEFUNC(common,isAwake)));
                    statement = QUOTE([ARR_4(_target,'efak_AFAK',1,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\AFAK.paa);

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK',1,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK',1,1)] call FUNC(FAK_unpack));
                        showDisabled = 0;
                        icon = QPATHTOF(ui\AFAK.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK',1,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK',1,2)] call FUNC(FAK_unpack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK',1,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK',1,3)] call FUNC(FAK_unpack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK',1,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK',1,4)] call FUNC(FAK_unpack));
                    };

                    class Slot5: Slot1 {
                        displayName = CSTRING(FAK_Slot_5);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK',1,5)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK',1,5)] call FUNC(FAK_unpack));
                    };

                    class Slot6: Slot1 {
                        displayName = CSTRING(FAK_Slot_6);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK',1,6)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK',1,6)] call FUNC(FAK_unpack));
                    };
                };

                class EFAK_AFAK_Mag {
                    displayName = CSTRING(AFAK_Unpack);
                    condition = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,0)] call FUNC(FAK_checkSlot) && !([_target] call ACEFUNC(common,isAwake)));
                    statement = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\AFAK.paa);

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,1)] call FUNC(FAK_unpack));
                        showDisabled = 0;
                        icon = QPATHTOF(ui\AFAK.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,2)] call FUNC(FAK_unpack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,3)] call FUNC(FAK_unpack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,4)] call FUNC(FAK_unpack));
                    };

                    class Slot5: Slot1 {
                        displayName = CSTRING(FAK_Slot_5);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,5)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,5)] call FUNC(FAK_unpack));
                    };

                    class Slot6: Slot1 {
                        displayName = CSTRING(FAK_Slot_6);
                        condition = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,6)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_AFAK_Magazine',1,6)] call FUNC(FAK_unpack));
                    };
                };

                class EFAK_MFAK_Item {
                    displayName = CSTRING(MFAK_Unpack);
                    condition = QUOTE([ARR_4(_target,'efak_MFAK',2,0)] call FUNC(FAK_checkSlot) && !([_target] call ACEFUNC(common,isAwake)));
                    statement = QUOTE([ARR_4(_target,'efak_MFAK',2,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\MFAK.paa);

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK',2,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK',2,1)] call FUNC(FAK_unpack));
                        showDisabled = 0;
                        icon = QPATHTOF(ui\MFAK.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK',2,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK',2,2)] call FUNC(FAK_unpack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK',2,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK',2,3)] call FUNC(FAK_unpack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK',2,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK',2,4)] call FUNC(FAK_unpack));
                    };

                    class Slot5: Slot1 {
                        displayName = CSTRING(FAK_Slot_5);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK',2,5)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK',2,5)] call FUNC(FAK_unpack));
                    };

                    class Slot6: Slot1 {
                        displayName = CSTRING(FAK_Slot_6);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK',2,6)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK',2,6)] call FUNC(FAK_unpack));
                    };

                    class Slot7: Slot1 {
                        displayName = CSTRING(FAK_Slot_7);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK',2,7)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK',2,7)] call FUNC(FAK_unpack));
                    };

                    class Slot8: Slot1 {
                        displayName = CSTRING(FAK_Slot_8);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK',2,8)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK',2,8)] call FUNC(FAK_unpack));
                    };
                };

                class EFAK_MFAK_Mag {
                    displayName = CSTRING(MFAK_Unpack);
                    condition = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,0)] call FUNC(FAK_checkSlot) && !([_target] call ACEFUNC(common,isAwake)));
                    statement = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\MFAK.paa);

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,1)] call FUNC(FAK_unpack));
                        showDisabled = 0;
                        icon = QPATHTOF(ui\MFAK.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,2)] call FUNC(FAK_unpack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,3)] call FUNC(FAK_unpack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,4)] call FUNC(FAK_unpack));
                    };

                    class Slot5: Slot1 {
                        displayName = CSTRING(FAK_Slot_5);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,5)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,5)] call FUNC(FAK_unpack));
                    };

                    class Slot6: Slot1 {
                        displayName = CSTRING(FAK_Slot_6);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,6)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,6)] call FUNC(FAK_unpack));
                    };

                    class Slot7: Slot1 {
                        displayName = CSTRING(FAK_Slot_7);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,7)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,7)] call FUNC(FAK_unpack));
                    };

                    class Slot8: Slot1 {
                        displayName = CSTRING(FAK_Slot_8);
                        condition = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,8)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_target,'efak_MFAK_Magazine',2,8)] call FUNC(FAK_unpack));
                    };
                };
            };
        };
        class ACE_SelfActions {
            class ACM_Equipment {
                class EFAK_IFAK_Item {
                    displayName = CSTRING(IFAK_Unpack);
                    condition = QUOTE([ARR_4(_player,'efak_IFAK',0,0)] call FUNC(FAK_checkSlot));
                    statement = QUOTE([ARR_4(_player,'efak_IFAK',0,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\IFAK.paa);

                    class IFAKInfo {
                        displayName = CSTRING(FAK_DisplayItems);
                        condition = QUOTE([ARR_2(_player,'efak_IFAK')] call ACEFUNC(common,hasItem));
                        statement = QUOTE([ARR_2(_player,0)] call FUNC(FAK_displayContent));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\IFAK_DisplayItems.paa);
                    };

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_player,'efak_IFAK',0,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK',0,1)] call FUNC(FAK_unpack));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\IFAK.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_player,'efak_IFAK',0,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK',0,2)] call FUNC(FAK_unpack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_player,'efak_IFAK',0,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK',0,3)] call FUNC(FAK_unpack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_player,'efak_IFAK',0,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK',0,4)] call FUNC(FAK_unpack));
                    };
                };

                class EFAK_IFAK_Mag {
                    displayName = CSTRING(IFAK_Unpack);
                    condition = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,0)] call FUNC(FAK_checkSlot));
                    statement = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\IFAK.paa);

                    class IFAKInfo {
                        displayName = CSTRING(FAK_DisplayItems);
                        condition = QUOTE([ARR_2(_player,'efak_IFAK_Magazine')] call ACEFUNC(common,hasMagazine));
                        statement = QUOTE([ARR_2(_player,0)] call FUNC(FAK_displayContent));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\IFAK_DisplayItems.paa);
                    };
                    
                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,1)] call FUNC(FAK_unpack));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\IFAK.paa);
                    };

                    class Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_1_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_IFAK_Magazine',0,1)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_IFAK_Magazine',0,1)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,1)] call FUNC(FAK_repack));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\IFAK_Repack.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,2)] call FUNC(FAK_unpack));
                    };

                    class Slot2_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_2_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_IFAK_Magazine',0,2)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_IFAK_Magazine',0,2)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,2)] call FUNC(FAK_repack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,3)] call FUNC(FAK_unpack));
                    };

                    class Slot3_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_3_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_IFAK_Magazine',0,3)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_IFAK_Magazine',0,3)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,3)] call FUNC(FAK_repack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,4)] call FUNC(FAK_unpack));
                    };

                    class Slot4_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_4_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_IFAK_Magazine',0,4)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_IFAK_Magazine',0,4)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_IFAK_Magazine',0,4)] call FUNC(FAK_repack));
                    };
                };

                class EFAK_AFAK_Item {
                    displayName = CSTRING(AFAK_Unpack);
                    condition = QUOTE([ARR_4(_player,'efak_AFAK',1,0)] call FUNC(FAK_checkSlot));
                    statement = QUOTE([ARR_4(_player,'efak_AFAK',1,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\AFAK.paa);

                    class AFAKInfo {
                        displayName = CSTRING(FAK_DisplayItems);
                        condition = QUOTE([ARR_2(_player,'efak_AFAK')] call ACEFUNC(common,hasItem));
                        statement = QUOTE([ARR_2(_player,1)] call FUNC(FAK_displayContent));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\AFAK_DisplayItems.paa);
                    };

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK',1,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK',1,1)] call FUNC(FAK_unpack));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\AFAK.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK',1,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK',1,2)] call FUNC(FAK_unpack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK',1,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK',1,3)] call FUNC(FAK_unpack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK',1,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK',1,4)] call FUNC(FAK_unpack));
                    };

                    class Slot5: Slot1 {
                        displayName = CSTRING(FAK_Slot_5);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK',1,5)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK',1,5)] call FUNC(FAK_unpack));
                    };

                    class Slot6: Slot1 {
                        displayName = CSTRING(FAK_Slot_6);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK',1,6)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK',1,6)] call FUNC(FAK_unpack));
                    };
                };

                class EFAK_AFAK_Mag {
                    displayName = CSTRING(AFAK_Unpack);
                    condition = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,0)] call FUNC(FAK_checkSlot));
                    statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\AFAK.paa);

                    class AFAKInfo {
                        displayName = CSTRING(FAK_DisplayItems);
                        condition = QUOTE([ARR_2(_player,'efak_AFAK_Magazine')] call ACEFUNC(common,hasMagazine));
                        statement = QUOTE([ARR_2(_player,1)] call FUNC(FAK_displayContent));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\AFAK_DisplayItems.paa);
                    };

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,1)] call FUNC(FAK_unpack));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\AFAK.paa);
                    };

                    class Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_1_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_AFAK_Magazine',1,1)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_AFAK_Magazine',1,1)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,1)] call FUNC(FAK_repack));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\AFAK_Repack.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,2)] call FUNC(FAK_unpack));
                    };

                    class Slot2_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_2_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_AFAK_Magazine',1,2)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_AFAK_Magazine',1,2)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,2)] call FUNC(FAK_repack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,3)] call FUNC(FAK_unpack));
                    };
                    
                    class Slot3_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_3_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_AFAK_Magazine',1,3)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_AFAK_Magazine',1,3)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,3)] call FUNC(FAK_repack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,4)] call FUNC(FAK_unpack));
                    };

                    class Slot4_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_4_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_AFAK_Magazine',1,4)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_AFAK_Magazine',1,4)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,4)] call FUNC(FAK_repack));
                    };

                    class Slot5: Slot1 {
                        displayName = CSTRING(FAK_Slot_5);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,5)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,5)] call FUNC(FAK_unpack));
                    };

                    class Slot5_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_5_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_AFAK_Magazine',1,5)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_AFAK_Magazine',1,5)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,5)] call FUNC(FAK_repack));
                    };

                    class Slot6: Slot1 {
                        displayName = CSTRING(FAK_Slot_6);
                        condition = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,6)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,6)] call FUNC(FAK_unpack));
                    };

                    class Slot6_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_6_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_AFAK_Magazine',1,6)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_AFAK_Magazine',1,6)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_AFAK_Magazine',1,6)] call FUNC(FAK_repack));
                    };
                };

                class EFAK_MFAK_Item {
                    displayName = CSTRING(MFAK_Unpack);
                    condition = QUOTE([ARR_4(_player,'efak_MFAK',2,0)] call FUNC(FAK_checkSlot));
                    statement = QUOTE([ARR_4(_player,'efak_MFAK',2,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\MFAK.paa);

                    class MFAKInfo {
                        displayName = CSTRING(FAK_DisplayItems);
                        condition = QUOTE([ARR_2(_player,'efak_MFAK')] call ACEFUNC(common,hasItem));
                        statement = QUOTE([ARR_2(_player,2)] call FUNC(FAK_displayContent));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\MFAK_DisplayItems.paa);
                    };

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK',2,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK',2,1)] call FUNC(FAK_unpack));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\MFAK.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK',2,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK',2,2)] call FUNC(FAK_unpack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK',2,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK',2,3)] call FUNC(FAK_unpack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK',2,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK',2,4)] call FUNC(FAK_unpack));
                    };

                    class Slot5: Slot1 {
                        displayName = CSTRING(FAK_Slot_5);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK',2,5)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK',2,5)] call FUNC(FAK_unpack));
                    };

                    class Slot6: Slot1 {
                        displayName = CSTRING(FAK_Slot_6);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK',2,6)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK',2,6)] call FUNC(FAK_unpack));
                    };

                    class Slot7: Slot1 {
                        displayName = CSTRING(FAK_Slot_7);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK',2,7)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK',2,7)] call FUNC(FAK_unpack));
                    };

                    class Slot8: Slot1 {
                        displayName = CSTRING(FAK_Slot_8);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK',2,8)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK',2,8)] call FUNC(FAK_unpack));
                    };
                };

                class EFAK_MFAK_Mag {
                    displayName = CSTRING(MFAK_Unpack);
                    condition = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,0)] call FUNC(FAK_checkSlot));
                    statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,0)] call FUNC(FAK_unpack));
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    showDisabled = 0;
                    icon = QPATHTOF(ui\MFAK.paa);

                    class MFAKInfo {
                        displayName = CSTRING(FAK_DisplayItems);
                        condition = QUOTE([ARR_2(_player,'efak_MFAK_Magazine')] call ACEFUNC(common,hasMagazine));
                        statement = QUOTE([ARR_2(_player,2)] call FUNC(FAK_displayContent));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\MFAK_DisplayItems.paa);
                    };

                    class Slot1 {
                        displayName = CSTRING(FAK_Slot_1);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,1)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,1)] call FUNC(FAK_unpack));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\MFAK.paa);
                    };

                    class Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_1_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_MFAK_Magazine',2,1)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_MFAK_Magazine',2,1)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,1)] call FUNC(FAK_repack));
                        exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                        showDisabled = 0;
                        icon = QPATHTOF(ui\MFAK_Repack.paa);
                    };

                    class Slot2: Slot1 {
                        displayName = CSTRING(FAK_Slot_2);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,2)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,2)] call FUNC(FAK_unpack));
                    };

                    class Slot2_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_2_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_MFAK_Magazine',2,2)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_MFAK_Magazine',2,2)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,2)] call FUNC(FAK_repack));
                    };

                    class Slot3: Slot1 {
                        displayName = CSTRING(FAK_Slot_3);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,3)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,3)] call FUNC(FAK_unpack));
                    };

                    class Slot3_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_3_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_MFAK_Magazine',2,3)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_MFAK_Magazine',2,3)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,3)] call FUNC(FAK_repack));
                    };

                    class Slot4: Slot1 {
                        displayName = CSTRING(FAK_Slot_4);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,4)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,4)] call FUNC(FAK_unpack));
                    };

                    class Slot4_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_4_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_MFAK_Magazine',2,4)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_MFAK_Magazine',2,4)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,4)] call FUNC(FAK_repack));
                    };

                    class Slot5: Slot1 {
                        displayName = CSTRING(FAK_Slot_5);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,5)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,5)] call FUNC(FAK_unpack));
                    };

                    class Slot5_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_5_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_MFAK_Magazine',2,5)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_MFAK_Magazine',2,5)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,5)] call FUNC(FAK_repack));
                    };

                    class Slot6: Slot1 {
                        displayName = CSTRING(FAK_Slot_6);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,6)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,6)] call FUNC(FAK_unpack));
                    };

                    class Slot6_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_6_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_MFAK_Magazine',2,6)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_MFAK_Magazine',2,6)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,6)] call FUNC(FAK_repack));
                    };

                    class Slot7: Slot1 {
                        displayName = CSTRING(FAK_Slot_7);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,7)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,7)] call FUNC(FAK_unpack));
                    };

                    class Slot7_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_7_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_MFAK_Magazine',2,7)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_MFAK_Magazine',2,7)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,7)] call FUNC(FAK_repack));
                    };

                    class Slot8: Slot1 {
                        displayName = CSTRING(FAK_Slot_8);
                        condition = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,8)] call FUNC(FAK_checkSlot));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,8)] call FUNC(FAK_unpack));
                    };

                    class Slot8_Repack: Slot1_Repack {
                        displayName = CSTRING(FAK_Slot_8_Repack);
                        condition = QUOTE(!([ARR_4(_player,'efak_MFAK_Magazine',2,8)] call FUNC(FAK_checkSlot)) && [ARR_4(_player,'efak_MFAK_Magazine',2,8)] call FUNC(FAK_checkRepack));
                        statement = QUOTE([ARR_4(_player,'efak_MFAK_Magazine',2,8)] call FUNC(FAK_repack));
                    };
                };
            };
        };
    };
};