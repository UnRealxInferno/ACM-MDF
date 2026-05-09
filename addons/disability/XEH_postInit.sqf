#include "script_component.hpp"

[QGVAR(shakeAwakeLocal), LINKFUNC(shakeAwakeLocal)] call CBA_fnc_addEventHandler;
[QGVAR(slapAwakeLocal), LINKFUNC(slapAwakeLocal)] call CBA_fnc_addEventHandler;

[QACEGVAR(medical_treatment,tourniquetLocal), LINKFUNC(setTourniquetTime)] call CBA_fnc_addEventHandler;
[QACEGVAR(medical_treatment,tourniquetLocal), LINKFUNC(handleTourniquetEffects)] call CBA_fnc_addEventHandler;

["multiplier", {
    (GET_TOURNIQUET_NECROSIS(ACE_player)) params ["_leftArm", "_rightArm"];
    1 + ((_leftArm + _rightArm) * 2)
}, QUOTE(ADDON)] call ACEFUNC(common,addSwayFactor);