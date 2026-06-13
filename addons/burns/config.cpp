#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        magazines[] = {
            "ACM_SilverNylonDressing",
            "ACM_BurnCream"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ACM_core",
            "ACM_damage",
            "ace_medical",
            "ace_medical_status",
            "ace_medical_treatment",
            "ace_medical_engine",
            "cba_settings"
        };
        author = "INFERNO";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"