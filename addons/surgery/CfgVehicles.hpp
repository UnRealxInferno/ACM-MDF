class CfgVehicles {
    class ACE_medicalSupplyCrate;

    class ACE_medicalSupplyCrate_advanced: ACE_medicalSupplyCrate {
        class TransportItems {
            class kat_scalpel {
                name = "kat_scalpel";
                count = 5;
            };
            class kat_retractor {
                name = "kat_retractor";
                count = 5;
            };
            class kat_clamp {
                name = "kat_clamp";
                count = 5;
            };
            class kat_plate {
                name = "kat_plate";
                count = 15;
            };
            class kat_vacuum {
                name = "kat_vacuum";
                count = 15;
            };
            class kat_etomidate {
                name = "kat_etomidate";
                count = 10;
            };
            class kat_lorazepam {
                name = "kat_lorazepam";
                count = 10;
            };
            class kat_flumazenil {
                name = "kat_flumazenil";
                count = 10;
            };
        };
    };

    class kat_surgerySupplyCrate: ACE_medicalSupplyCrate {
        displayName = CSTRING(surgeryToolbox);
        class TransportItems {
            class kat_etomidate {
                name = "kat_etomidate";
                count = 15;
            };
            class kat_flumazenil {
                name = "kat_flumazenil";
                count = 15;
            };
            class kat_lorazepam {
                name = "kat_lorazepam";
                count = 15;
            };
            class kat_clamp {
                name = "kat_clamp";
                count = 5;
            };
            class kat_plate {
                name = "kat_plate";
                count = 15;
            };
            class kat_retractor {
                name = "kat_retractor";
                count = 5;
            };
            class kat_scalpel {
                name = "kat_scalpel";
                count = 5;
            };
            class kat_vacuum {
                name = "kat_vacuum";
                count = 15;
            };
        };
    };
};
