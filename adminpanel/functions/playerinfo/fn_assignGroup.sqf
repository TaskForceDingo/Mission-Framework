/*
	Author: TheTimidShade

	Description:
		Assigns the selected player to the group that the player in the combobox belongs to

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825
#define IDC_ADMINPANEL_PLAYER_GROUP_COMBO	5425

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _admp_player_groupcombo = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_GROUP_COMBO;

private _playerJoining = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection;
private _playerToJoin = [_admp_player_groupcombo] call admp_fnc_playerFromSelection;

if (isNull _playerJoining || isNull _playerToJoin) exitWith {systemChat "No target found!"; playSound "addItemFailed";}; // if there is no selected target exit

if (group _playerJoining != group _playerToJoin) then {
	[_playerJoining] joinSilent (group _playerToJoin);
	systemChat format ["Assigned %1 to %2's group!", name _playerJoining, name _playerToJoin];
	playSound "3DEN_notificationDefault";

	if (_playerJoining != player) then { // show assigned player a message
		_message = format ["%1 assigned you to %2's group!", name player, name _playerToJoin];
		[_message] remoteExec ["systemChat", _playerJoining, false];
	};

	if (_playerToJoin != player) then { // show player asssigned to a message
		_message = format ["%1 assigned %2 to your group!", name player, name _playerJoining];
		[_message] remoteExec ["systemChat", _playerToJoin, false];
	};
} else {
	systemChat format ["%1 is already in %2's group!", name _playerJoining, name _playerToJoin];
	playSound "addItemFailed";
};