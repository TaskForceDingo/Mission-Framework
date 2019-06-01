disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020

_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
_target = _ctrl lbValue lbCurSel _ctrl;


/** TODO: Make this function from scratch and fix it

if (_target != clientOwner) then {
	[[(format ["#ban %1",name _target])],{TFD_SERVER_PASSWORD serverCommand (_this select 0)}] remoteExec ["call", 2];
};

*/