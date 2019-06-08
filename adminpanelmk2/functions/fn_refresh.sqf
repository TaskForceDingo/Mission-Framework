disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_8	7128
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_MAPBACK 2300

[] call APMK2_fnc_updateButtons;

_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_8;
if (SERVER_IS_LOCKED) then {_ctrl ctrlSetText "UNLOCK SERVER"} else {_ctrl ctrlSetText "LOCK SERVER"};

_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
lbClear _ctrl;

{
	_name = (_x select 0);
	_data = (_x select 1);
	_unit = (_x select 2);

	_ctrl lbAdd _name;
	_ctrl lbSetData [_forEachIndex, _name];
	_ctrl lbSetValue [_forEachIndex, _data];
	_ctrl lbSetColor [_forEachIndex, [1, 1, 1, 1]];
} forEach JSH_ADMIN_PLAYERLIST_DATA;

lbSort _ctrl;
_ctrl lbSetCurSel 0;
ctrlSetFocus _ctrl;