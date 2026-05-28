#include "script_component.hpp"

[QACEGVAR(medical_treatment,fullHealLocalMod), LINKFUNC(fullHealLocal)] call CBA_fnc_addEventHandler;
[QACEGVAR(medical_gui,updateInjuryListPart),   LINKFUNC(gui_updateInjuryListPart)] call CBA_fnc_addEventHandler;
