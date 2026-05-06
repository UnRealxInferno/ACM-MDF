#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        units[] = {};
        weapons[] = {
            "kat_eyecovers_right",
            "kat_eyecovers_left",
            "kat_eyecovers"
        };
        magazines[] = {
            "KAT_Eyewasher"
        };
        requiredAddons[] = {
            "cba_main",
            "ace_main",
            "ace_goggles",
            "ace_medical_gui",
            "ace_medical_treatment",
            "cba_settings",
            "ACM_main",
            "ACM_core",
            "ACM_gui",
            "ACM_cbrn"
        };
        author = AUTHOR;
        authors[] = {"Katalam", "MiszczuZPolski", "Mazinski", "Inferno"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#include "RscTitles.hpp"
