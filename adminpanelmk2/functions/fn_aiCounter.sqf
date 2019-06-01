disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_ACTIVEAI_COUNTER	6523
_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_ACTIVEAI_COUNTER;

while {dialog} do {
	_ctrl ctrlSetText str ({!isPlayer _x} count allUnits);
	sleep 1;
};