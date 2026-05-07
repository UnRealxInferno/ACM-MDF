class CfgVehicles {
    class ACE_medicalSupplyCrate;
    class ACE_medicalSupplyCrate_advanced: ACE_medicalSupplyCrate {
        class TransportItems {
            class _xx_kat_fluidWarmer {
                name = "kat_fluidWarmer";
                count = 5;
            };
            class _xx_kat_handWarmer {
                name = "kat_handWarmer";
                count = 15;
            };
        };
    };

    class Man;

    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class ACM_CheckHandWarmers {
                    displayName = CSTRING(Check_Hand_Warmers);
                    condition = QUOTE(GVAR(hypothermiaActive));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(checkHandWarmers));
                    icon = QACEPATHTOF(medical_gui,ui\cross.paa);
                };
            };
        };

        class ACE_SelfActions {
            class ACM_Equipment {
                class ACM_CheckHandWarmersSelf {
                    displayName = CSTRING(Check_Hand_Warmers);
                    condition = QUOTE(GVAR(hypothermiaActive));
                    statement = QUOTE([ARR_2(_player,_player)] call FUNC(checkHandWarmers));
                    icon = QACEPATHTOF(medical_gui,ui\cross.paa);
                };
            };
        };
    };
};
