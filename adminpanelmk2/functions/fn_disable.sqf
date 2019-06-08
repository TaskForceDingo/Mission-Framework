disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020

_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
_name = _ctrl lbData lbCurSel _ctrl;
_target = _ctrl lbValue lbCurSel _ctrl;
if (_target == (clientOwner)) exitWith {hint "You cant disable yourself"};



hint format ["user %1 disabled", _name];

[[name player],{
	if (!userInputDisabled) then
	{
		disableUserInput true;
		player setVariable ["jsh_adminDisabled", true, true];
		hint format ["You have had your keyboard & mouse input locked out by %1", (_this select 0)];
	}
	else
	{
		disableUserInput false;
		player setVariable ["jsh_adminDisabled", false, true];
		hint format ["Your keyboard & mouse input has been restored by %1", (_this select 0)];
	};
}] remoteExec ["call", _target];
