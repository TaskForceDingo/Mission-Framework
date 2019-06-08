disableSerialization;
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020
_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
_data = _ctrl lbValue lbCurSel _ctrl;
_name = _ctrl lbData lbCurSel _ctrl;
_target = objNull;
{
    if (_name == (_x select 0)) then {
        if (_data == (_x select 1)) then {
                _target = (_x select 2);
        };
    };
} forEach JSH_ADMIN_PLAYERLIST_DATA;

systemChat str _target;
_shiftKey = _this select 4;
_ctrlKey = _this select 5;
_altKey = _this select 6;

//systemChat str [_ctrlKey,_shiftKey,_altKey];
if (_ctrlKey) then {
    if (_ctrlKey && _altKey) then {
        //TP them to you
        _safePos = [(getPosWorld vehicle player), 1, 10, 1, 1, 1, 0] call BIS_fnc_findSafePos;

        if (_name != name player) then {
            if ((typeOf vehicle _target) isKindOf "Man") then {
                _target setPosWorld _safePos;
            } else {
                moveOut _target;
                _target setPosWorld _safePos;
            };
        };
    } else {
        //TP you to them
        _safePos = [(getPosWorld vehicle _target), 1, 10, 1, 1, 1, 0] call BIS_fnc_findSafePos;

        if (_name != name player) then {
            player setPosWorld _safePos;
        };
    };
} else {
    _check = player getVariable ["jsh_adminTeleport", false];
    if !(_check) then {
        JSH_ADMIN_TELEPORT_EH = ["adminTeleport", "onMapSingleClick", {if (_alt) then {vehicle player setpos _pos}}] call BIS_fnc_addStackedEventHandler;
        player setVariable ["jsh_adminTeleport", true, true];
        systemChat "Teleport On";
    } else {
        ["adminTeleport", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
        player setVariable ["jsh_adminTeleport", false, true];
        systemChat "Teleport Off";
    };
};