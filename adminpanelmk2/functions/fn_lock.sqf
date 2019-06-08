disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_8	7128

_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_8;

if !(SERVER_IS_LOCKED) then {
	[[],{TFD_SERVER_PASSWORD serverCommand "#lock"}] remoteExec ["call", 2];
	systemChat "Server LOCKED";
	_ctrl ctrlSetText "UNLOCK SERVER";
	SERVER_IS_LOCKED = true; publicVariable "SERVER_IS_LOCKED";
} else {
	[[],{TFD_SERVER_PASSWORD serverCommand "#unlock"}] remoteExec ["call", 2];
	systemChat "Server UNLOCKED";
	_ctrl ctrlSetText "LOCK SERVER";
	SERVER_IS_LOCKED = false; publicVariable "SERVER_IS_LOCKED";
};