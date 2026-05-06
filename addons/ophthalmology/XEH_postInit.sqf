#include "script_component.hpp"

if (hasInterface) then {
    if (isNil QGVAR(visualEffectsPFH)) then {
        GVAR(visualEffectsPFH) = [LINKFUNC(updateVisualEffects), 0.25, []] call CBA_fnc_addPerFrameHandler;
    };

    ["CBA_settingsInitialized", {
        if (!GVAR(enable)) exitWith {};

        [QACEGVAR(goggles,effect), LINKFUNC(handleDustInjury)] call CBA_fnc_addEventHandler;

        ["CAManBase", "explosion", LINKFUNC(handleExplosion)] call CBA_fnc_addClassEventHandler;
    }] call CBA_fnc_addEventHandler;
};

[QACEGVAR(medical_treatment,fullHealLocalMod), LINKFUNC(fullHealLocal)] call CBA_fnc_addEventHandler;
[QACEGVAR(medical_gui,updateInjuryListPart), LINKFUNC(gui_updateInjuryListPart)] call CBA_fnc_addEventHandler;
