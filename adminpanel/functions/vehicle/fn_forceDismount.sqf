/*
	Author: TheTimidShade

	Description:
		Forces the selected player out of their vehicle

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

if (vehicle _player == _player) exitWith {systemChat format ["%1 is not in a vehicle!", name _player]; playSound "addItemFailed";};

moveOut _player;

systemChat format ["Dismounted %1!", name _player];
playSound "3DEN_notificationDefault";

if (_player != player) then { // show selected player a message
	_message = format ["%1 dismounted you!", name player];
	[_message] remoteExec ["systemChat", _player, false];
};