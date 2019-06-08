disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_SERVERFPS_COUNTER	6522
_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_SERVERFPS_COUNTER;
waitUntil {!isnil "JSH_ADMIN_SERVERFPS_VALUE"};
while {dialog} do {

	_ctrl ctrlSetText str (floor(JSH_ADMIN_SERVERFPS_VALUE));

	if (JSH_ADMIN_SERVERFPS_VALUE > 20) then {
		if (JSH_ADMIN_SERVERFPS_VALUE > 35) then {
			_ctrl ctrlSetTextColor [0,1,0,0.75]
		} else {_ctrl ctrlSetTextColor [1,1,0,0.75]};
	} else {_ctrl ctrlSetTextColor [1,0,0,0.75]};
};