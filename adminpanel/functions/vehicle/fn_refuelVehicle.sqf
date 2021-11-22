/*
	Author: TheTimidShade

	Description:
		Refuels the selected player's vehicle

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

if (isNull _player) exitWith {systemChat "No target found!"; playSound "addItemFailed";}; // if there is no selected target exit

private _playerVehicle = vehicle _player;
if (_playerVehicle == _player) exitWith {systemChat format ["%1 is not in a vehicle!", name _player]; playSound "addItemFailed";};

[_playerVehicle,1] remoteExec ["setFuel", _playerVehicle, false];

systemChat format ["Fully refueled %1's vehicle!", name _player];
playSound "3DEN_notificationDefault";

if (_player != player) then { // show selected player a message
	_message = format ["%1 refueled your vehicle!", name player];
	[_message] remoteExec ["systemChat", _player, false];
};