disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_EDIT_0	6920
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020

_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;

_machineNumber = _ctrl lbValue lbCurSel _ctrl;

_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_EDIT_0;

_inputString = ctrlText _ctrl;
_compiledCodeString = compile _inputString;

[[],_compiledCodeString] remoteExec ["spawn", _machineNumber];