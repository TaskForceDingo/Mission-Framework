disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020
_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
_data = _ctrl lbValue lbCurSel _ctrl;
_name = _ctrl lbData lbCurSel _ctrl;
_arsenalParams = ["Open", true];

_shiftKey = _this select 4;
_ctrlKey = _this select 5;
_altKey = _this select 6;

if (_ctrlKey) then {
	closeDialog 0;
	_arsenalParams remoteExec ["BIS_fnc_arsenal", _data];
} else {
	closeDialog 0;
	_arsenalParams spawn BIS_fnc_arsenal;
};