#include "script_component.hpp"

["LNX_DD1380_Open", {_this call DD1380_card_fnc_openCardLocal}] call CBA_fnc_addEventHandler;
["LNX_DD1380_Flip", {_this call DD1380_card_fnc_flipPageLocal}] call CBA_fnc_addEventHandler;
