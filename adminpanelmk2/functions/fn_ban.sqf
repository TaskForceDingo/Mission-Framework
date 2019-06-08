disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020

_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
_target = _ctrl lbData lbCurSel _ctrl;

BAN_TARGET = _target; publicVariable "BAN_TARGET";

remoteExec ["APMK2_fnc_banServer", 2];