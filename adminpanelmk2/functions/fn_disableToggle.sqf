disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020

_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
_curSel = lbCurSel _ctrl;
_target = _ctrl lbValue _curSel;
if (_target == (clientOwner)) exitWith {hint "You cant disable yourself"};

hint format ["user %1 disabled", _target];

[name player] remoteExec ["APMK2_fnc_doDisable", _target];
