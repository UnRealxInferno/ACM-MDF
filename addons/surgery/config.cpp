#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {"kat_vacuum", "kat_scalpel", "kat_retractor", "kat_clamp", "kat_plate"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main",
            "ace_main",
            "ace_medical_treatment",
            "ace_medical_status",
            "ace_medical_engine",
            "ACM_core"
        };
        author = AUTHOR;
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
