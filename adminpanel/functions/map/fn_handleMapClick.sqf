/*
	Author: TheTimidShade

	Description:
		Handles behaviour for clicks on the admin panel map display

	Parameters:
		0: ARRAY - Map click position [_xPos, _yPos] (map coordinates not world position)
		1: BOOL - Shift key pressed
		2: BOOL - Ctrl key pressed
		3: BOOL - Alt key pressed

	Returns:
		NONE
*/

params ["_clickPos", "_shift", "_ctrl", "_alt", "_button"];

disableSerialization;

if (_button == 1) exitWith {}; // ignore rmb press (interferes with map drag)
if (admp_playerlist_playerCount == 0) exitWith {}; // if there are no selectable players, ignore map click

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825
#define IDC_ADMINPANEL_MAP					4525

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _map_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_MAP;

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

_worldPos = _map_ctrl ctrlMapScreenToWorld _clickPos; // convert to world coordinates

// LMB ONLY ///////////////////////////////////////////////////////////////////////////////////////

if (!_shift && !_ctrl && !_alt) then { // if no keys are pressed try to find the nearest unit to map click and select them
	[_clickPos] call admp_fnc_playerFromMapClick;
};

// LMB + SHIFT ////////////////////////////////////////////////////////////////////////////////////

if (isNull _player) exitWith {systemChat "No target found!"; playSound "addItemFailed";}; // The next command combinations must have a target to function

// if only the shift key is pressed, teleport the selected unit to the map pos
if (_shift && !_ctrl && !_alt) then { 
	private _vehicle = vehicle _player;
	private _safePos = [];

	if (_vehicle == _player || driver _vehicle != _player) then { // if the player is not in a vehicle or isn't the driver tp just them
		_safePos = [_worldPos, 0, 10, 0.5, 1] call BIS_fnc_findSafePos; // find safe position within 10 meters
		[_player, _safePos] remoteExec ["setPos", _player, false];
		[_player, [0,0,0]] remoteExec ["setVelocity", _player, false];
		systemChat format ["Teleported %1 to grid %2!", name _player, mapGridPosition _safePos];
		playSound "3DEN_notificationDefault";
	} else {
		if (_vehicle isKindOf "AIR" && isEngineOn _vehicle) exitWith {systemChat format ["Engine must be off to teleport aircraft!"]; playSound "addItemFailed";};
		
		// find safe position and teleport player there if it can be found
		_safePos = _worldPos findEmptyPosition [0,30, typeOf _vehicle];
		if (_safePos isEqualTo []) exitWith {systemChat format ["Unable to find safe teleport location!"]; playSound "addItemFailed";};
		[_vehicle, _safePos] remoteExec ["setPos", _vehicle, false];
		[_vehicle, [0,0,0]] remoteExec ["setVelocity", _vehicle, false];
		systemChat format ["Teleported %1 to grid %2!", name _player, mapGridPosition _safePos];
		playSound "3DEN_notificationDefault";
	};
	
	if (!(_safePos isEqualTo [])) then { // if position was found centre map on it
		private _zoomLevel = ctrlMapScale _map_ctrl;
		_map_ctrl ctrlMapAnimAdd [0.1, _zoomLevel, _safePos];
		ctrlMapAnimCommit _map_ctrl;
	};
};

// LMB + ALT //////////////////////////////////////////////////////////////////////////////////////

// if only the alt key is pressed, teleport the local player to the closest unit to click or selected unit if no unit found near click
if (_alt && !_shift && !_ctrl) then { 
	if (!alive player) exitWith {}; // if the local player is using the panel from spectator, cancel this command
	
	private _playerInfo = [_clickPos] call admp_fnc_playerFromMapClick;
	private _target = objNull;
	if (!isNull (_playerInfo#0)) then { // if player can be found near click, use them as the target and select them
		_target = _playerInfo#0;
	} else { // if not, use currently selected player
		_target = _player;
	};

	if (_target == player) exitWith {systemChat "No need to teleport to yourself!"; playSound "addItemFailed";}; 

	private _vehicle = vehicle _target;
	private _safePos = [];

	if (vehicle player == _vehicle) exitWith {systemChat "Already in target vehicle!"; playSound "addItemFailed";}; // if the player is already in the vehicle they're teleporting to, cancel
	
	if (vehicle player != player) then {moveOut player;}; // if the local player tries to teleport to someone else while in a vehicle, dismount them first
	if (_vehicle == _target) then { // if selected player is not in a vehicle teleport near them
		_safePos = [_target, 0, 10, 1, 1] call BIS_fnc_findSafePos;
		player setPos _safePos;
		player setVelocity [0,0,0];
		
	} else {
		private _boardSucceeded = player moveInAny _vehicle; // if there is space in the player's vehicle, move local player inside
		
		if (!_boardSucceeded) then { // if there is not room in the target player's vehicle, find a safe spot nearby to teleport to
			_safePos = [_target, 5, 15, 0.5, 1] call BIS_fnc_findSafePos; // teleport minimum of 5m from vehicle to reduce risk of being run over
			player setPos _safePos;
		};
	};
	systemChat format ["Teleported to %1!", name _target];
	playSound "3DEN_notificationDefault";
	
	if (!(_safePos isEqualTo [])) then { // if position was found centre map on it
		private _zoomLevel = ctrlMapScale _map_ctrl;
		_map_ctrl ctrlMapAnimAdd [0.1, _zoomLevel, _safePos];
		ctrlMapAnimCommit _map_ctrl;
	};
};

// LMB + CTRL + SHIFT /////////////////////////////////////////////////////////////////////////////

// if the shift and control key is pressed, teleport the selected unit's whole group
if (_shift && _ctrl && !_alt) then { 
	
	private _message = format ["Are you sure you want to teleport %1's group?", name _player];
	private _confirm = [_message, "CONFIRM GROUP TELEPORT", "TELEPORT", "CANCEL"] call BIS_fnc_guiMessage;
	
	if (_confirm) then {
		private _group = group _player;
		private _safePos = [];
		
		{
			_safePos = [_worldPos, 0, 15, 0.5, 1] call BIS_fnc_findSafePos; // find safe position within 15 meters
			[_x, _safePos] remoteExec ["setPos", _x, false];
			[_x, [0,0,0]] remoteExec ["setVelocity", _x, false];
		} forEach (units _group);

		systemChat format ["Teleported %1's group to grid %2!", name _player, mapGridPosition _safePos];
		playSound "3DEN_notificationDefault";
		
		if (!(_safePos isEqualTo [])) then { // if position was found centre map on it
			private _zoomLevel = ctrlMapScale _map_ctrl;
			_map_ctrl ctrlMapAnimAdd [0.1, _zoomLevel, _safePos];
			ctrlMapAnimCommit _map_ctrl;
		};
	};
};

// LMB + SHIFT + ALT //////////////////////////////////////////////////////////////////////////////

// if shift and alt key are pressed, teleport the currently selected player to the local player
if (_shift && _alt && !_ctrl) then { 
	if (!alive player) exitWith {}; // if the local player is using the panel from spectator, cancel this command

	if (_player == player) exitWith {systemChat "No need to teleport to yourself!"; playSound "addItemFailed";}; 

	private _vehicle = vehicle player;
	private _safePos = [];

	if (vehicle _player == _vehicle) exitWith {systemChat "Target is already in the same vehicle!"; playSound "addItemFailed";}; // if the player is already in the vehicle they're teleporting to, cancel
	
	if (vehicle _player != _player) then {moveOut _player;}; // dismount target before bringing them to your position
	if (_vehicle == player) then { // if local player is not in a vehicle, find a safe place nearby to bring the target
		_safePos = [player, 0, 10, 1, 1] call BIS_fnc_findSafePos;
		[_player, _safePos] remoteExec ["setPos", _player, false];
		[_player, [0,0,0]] remoteExec ["setVelocity", _player, false];
	} else { // local player is in a vehicle, bring target into vehicle if possible
		private _boardSucceeded = _player moveInAny _vehicle;
		
		if (!_boardSucceeded) then { // if there is not room in the player's vehicle, find a safe spot nearby to teleport to
			_safePos = [player, 5, 15, 0.5, 1] call BIS_fnc_findSafePos; // teleport minimum of 5m from vehicle to reduce risk of being run over
			[_player, _safePos] remoteExec ["setPos", _player, false];
		};
	};
	systemChat format ["Brought %1 to you!", name _player];
	playSound "3DEN_notificationDefault";
};