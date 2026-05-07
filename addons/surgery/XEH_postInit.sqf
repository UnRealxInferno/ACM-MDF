#include "script_component.hpp"

if (missionNamespace getVariable [QGVAR(eventHandlersRegistered), false]) exitWith {};

[QGVAR(fractureSelect), LINKFUNC(fractureSelectLocal)] call CBA_fnc_addEventHandler;
[QGVAR(closedReduction), LINKFUNC(closedReductionLocal)] call CBA_fnc_addEventHandler;
[QGVAR(openReduction), LINKFUNC(openReductionLocal)] call CBA_fnc_addEventHandler;
[QGVAR(incision), LINKFUNC(incisionLocal)] call CBA_fnc_addEventHandler;
[QGVAR(openReductionProgress), LINKFUNC(openReductionProgressLocal)] call CBA_fnc_addEventHandler;

[QACEGVAR(medical_gui,updateInjuryListPart), LINKFUNC(gui_updateInjuryListPart)] call CBA_fnc_addEventHandler;
[QACEGVAR(medical_treatment,fullHealLocalMod), LINKFUNC(fullHealLocal)] call CBA_fnc_addEventHandler;

missionNamespace setVariable [QGVAR(eventHandlersRegistered), true];
