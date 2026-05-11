#include "..\ui\idc_macros.hpp"
params ["_display", ["_config", configNull]];
switch (uiNamespace getVariable ["TCCC_Card", 0]) do {
	case (1): {
		(_display displayCtrl IDC_DD1380_PATIENT_NAME) ctrlSetText ([ace_medical_gui_target] call ace_common_fnc_getName);
		(_display displayCtrl IDC_DD1380_PATIENT_LAST4) ctrlSetText (((name ace_medical_gui_target) call ace_dogtags_fnc_ssn) select [7,4]);
		(_display displayCtrl IDC_DD1380_PATIENT_DATE) ctrlSetText ([date] call DD1380_card_fnc_getDate);
		
		if ([ace_medical_gui_target, "leftarm"] call ace_medical_treatment_fnc_hasTourniquetAppliedTo) then {
			(_display displayCtrl IDC_DD1380_L_ARM_TYPE) ctrlSetText "CAT";
			(_display displayCtrl IDC_DD1380_L_ARM_TIME) ctrlSetText (ace_medical_gui_target getVariable ["ACM_disability_Tourniquet_Time", [0,0,0,0,0,0]] select 2);
		} else {
			(_display displayCtrl IDC_DD1380_L_ARM_TYPE) ctrlSetText "";
			(_display displayCtrl IDC_DD1380_L_ARM_TIME) ctrlSetText "";
		};
		if ([ace_medical_gui_target, "rightarm"] call ace_medical_treatment_fnc_hasTourniquetAppliedTo) then {
			(_display displayCtrl IDC_DD1380_R_ARM_TYPE) ctrlSetText "CAT";
			(_display displayCtrl IDC_DD1380_R_ARM_TIME) ctrlSetText (ace_medical_gui_target getVariable ["ACM_disability_Tourniquet_Time", [0,0,0,0,0,0]] select 3);
		} else {
			(_display displayCtrl IDC_DD1380_R_ARM_TYPE) ctrlSetText "";
			(_display displayCtrl IDC_DD1380_R_ARM_TIME) ctrlSetText "";
		};
		if ([ace_medical_gui_target, "leftleg"] call ace_medical_treatment_fnc_hasTourniquetAppliedTo) then {
			(_display displayCtrl IDC_DD1380_L_LEG_TYPE) ctrlSetText "CAT";
			(_display displayCtrl IDC_DD1380_L_LEG_TIME) ctrlSetText (ace_medical_gui_target getVariable ["ACM_disability_Tourniquet_Time", [0,0,0,0,0,0]] select 4);
		} else {
			(_display displayCtrl IDC_DD1380_L_LEG_TYPE) ctrlSetText "";
			(_display displayCtrl IDC_DD1380_L_LEG_TIME) ctrlSetText "";
		};
		if ([ace_medical_gui_target, "rightleg"] call ace_medical_treatment_fnc_hasTourniquetAppliedTo) then {
			(_display displayCtrl IDC_DD1380_R_LEG_TYPE) ctrlSetText "CAT";
			(_display displayCtrl IDC_DD1380_R_LEG_TIME) ctrlSetText (ace_medical_gui_target getVariable ["ACM_disability_Tourniquet_Time", [0,0,0,0,0,0]] select 5);
		} else {
			(_display displayCtrl IDC_DD1380_R_LEG_TYPE) ctrlSetText "";
			(_display displayCtrl IDC_DD1380_R_LEG_TIME) ctrlSetText "";
		};

		_priority = ace_medical_gui_target getVariable ["DD1380_Priority", createHashMap];
		{
			(_display displayCtrl _x) cbSetChecked _y;
		} forEach _priority;

		_cb = ace_medical_gui_target getVariable ["DD1380_Checkboxes", createHashMap];
		{
			(_display displayCtrl _x) cbSetChecked _y;
		} forEach _cb;

		_text = ace_medical_gui_target getVariable ["DD1380_Text", createHashMap];
		{
			(_display displayCtrl _x) ctrlSetText _y;
		} forEach _text;
	};
	case (2): {
		_priority = ace_medical_gui_target getVariable ["DD1380_Priority", createHashMap];
		{
			(_display displayCtrl _x) cbSetChecked _y;
		} forEach _priority;
		
		_cb = ace_medical_gui_target getVariable ["DD1380_Back_Checkboxes", createHashMap];
		{
			(_display displayCtrl _x) cbSetChecked _y;
		} forEach _cb;

		_text = ace_medical_gui_target getVariable ["DD1380_Back_Text", createHashMap];
		{
			(_display displayCtrl _x) ctrlSetText _y;
		} forEach _text;
	};
	default {};
};
