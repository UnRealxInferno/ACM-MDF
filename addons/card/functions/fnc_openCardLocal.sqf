params["_medic","_patient"];
ace_medical_gui_target = _patient;
ace_medical_gui_pendingReopen = false;
if (dialog) then {
	closeDialog 0;
};
createDialog "DD1380_Card1_dlg";
