disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020
_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
_data = _ctrl lbValue lbCurSel _ctrl;
_name = _ctrl lbData lbCurSel _ctrl;
_arsenalParams = ["Open", true];
_getTarget = [_name,_data] call {
    params ["_name","_data"];
    _target = objNull;
    {
        if (_name == (_x select 0)) then {
            if (_data == (_x select 1)) then {
                    _target = (_x select 2);
            };
        };
    } forEach JSH_ADMIN_PLAYERLIST_DATA;
    _target
};

_shiftKey = _this select 4;
_ctrlKey = _this select 5;
_altKey = _this select 6;

if (_ctrlKey) then {
	systemChat str _getTarget;
	_arsenalParams remoteExec ["BIS_fnc_arsenal", _getTarget];
} else {
	closeDialog 0;
	_arsenalParams spawn BIS_fnc_arsenal;
};