#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#define CBA_SETTINGS_CAT LSTRING(cba_name)
#include "initSettings.inc.sqf"

// Ensure surgery event handlers are present even if postInit ordering gets skipped/misaligned.
if !(missionNamespace getVariable [QGVAR(eventHandlersRegistered), false]) then {
    [QGVAR(fractureSelect), LINKFUNC(fractureSelectLocal)] call CBA_fnc_addEventHandler;
    [QGVAR(closedReduction), LINKFUNC(closedReductionLocal)] call CBA_fnc_addEventHandler;
    [QGVAR(openReduction), LINKFUNC(openReductionLocal)] call CBA_fnc_addEventHandler;
    [QGVAR(incision), LINKFUNC(incisionLocal)] call CBA_fnc_addEventHandler;
    [QGVAR(openReductionProgress), LINKFUNC(openReductionProgressLocal)] call CBA_fnc_addEventHandler;

    [QACEGVAR(medical_gui,updateInjuryListPart), LINKFUNC(gui_updateInjuryListPart)] call CBA_fnc_addEventHandler;
    [QACEGVAR(medical_treatment,fullHealLocalMod), LINKFUNC(fullHealLocal)] call CBA_fnc_addEventHandler;

    missionNamespace setVariable [QGVAR(eventHandlersRegistered), true];
};

ADDON = true;
