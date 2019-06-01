#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020
_ctrlButton = _this select 0;
_ctrlListbox = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
_name = _ctrlListbox lbData lbCurSel _ctrlListbox;

_ctrlButton ctrlSetTooltip format ["LMB: Toggle map teleport | CTRL+LMB: Teleport to %1 | CTRL+ALT+LMB: Teleport %1 to you",_name];