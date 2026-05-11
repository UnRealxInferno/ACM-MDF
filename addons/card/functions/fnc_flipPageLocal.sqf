params["_medic","_patient"];
switch (uiNamespace getVariable ["TCCC_Card", 0]) do {
	case (1): {
		if (dialog) then {closeDialog 0};
		createDialog "DD1380_Card2_dlg";
	};
	case (2): {
		if (dialog) then {closeDialog 0};
		createDialog "DD1380_Card1_dlg";
	};
};
