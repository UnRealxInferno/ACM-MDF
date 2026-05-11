params["_control"];
[ctrlParent _control] call DD1380_card_fnc_setData;
["LNX_DD1380_Flip", [player, ace_medical_gui_target], player] call CBA_fnc_targetEvent;
