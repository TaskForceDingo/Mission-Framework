/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Opens BI/ACE arsenal on selected unit

	Parameters:
		0: BOOL - Whether shift button was held when clicking
		
	Returns:
		NONE
*/

disableSerialization;

params ["_shift"];

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

if (isNull _player) exitWith {systemChat "No target found!"; playSound "addItemFailed";}; // if there is no selected target exit

if (_shift && admp_aceEnabled) then { // check which arsenal to open
	[2] remoteExec ["closeDialog", _player, false]; // if the player has dialog open close it
	[_player, _player, true] remoteExec ["ace_arsenal_fnc_openBox", _player, false];
	systemChat format ["Opened ACE arsenal on %1!", name _player];
	playSound "3DEN_notificationDefault";
} else {
	[2] remoteExec ["closeDialog", _player, false];
	["Open", [true]] remoteExec ["BIS_fnc_arsenal", _player, false];
	systemChat format ["Opened BI arsenal on %1!", name _player];
	playSound "3DEN_notificationDefault";
};

if (_player != player) then { // show selected player a message
	_message = format ["%1 opened arsenal for you!", name player];
	[_message] remoteExec ["systemChat", _player, false];
};

if (_player == player) then {closeDialog 2;}; // close the admin panel if arsenal was opened on local client