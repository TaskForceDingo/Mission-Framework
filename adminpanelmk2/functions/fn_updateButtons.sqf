disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_0		7120
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_1		7121
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_2		7122
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_3		7123
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_4		7124
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_6		7126

_buttonVarArray = [
	[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_0, "jsh_adminGodMode"],
	[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_1, "jsh_adminTeleport"],
	[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_2, "jsh_adminAmmo"],
	[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_3, "jsh_adminGhosting"],
	[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_4, "jsh_adminSpectator"],
	[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_6, "jsh_adminZeus"]
];

{
	_ctrl = (findDisplay 6969) displayCtrl (_x select 0);
	_check = player getVariable [(_x select 1), false];
	

	if (_check) then {
		_ctrl ctrlSetTextColor [1,1,0,1];
	} else {
		_ctrl ctrlSetTextColor [1,1,1,1];
	};
} forEach _buttonVarArray;