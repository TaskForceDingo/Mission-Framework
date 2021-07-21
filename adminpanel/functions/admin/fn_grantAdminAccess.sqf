/*
	Author: TheTimidShade

	Description:
		Toggle's the selected player's access to the admin panel

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX		4825

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

if (isNull _player) exitWith {systemChat "No target found!"; playSound "addItemFailed";}; // if there is no selected target exit

if (call BIS_fnc_admin != 2) exitWith {systemChat "You must be the currently logged in admin to perform this action!"; playSound "addItemFailed";};

if ((getPlayerUID _player) in admp_authorisedIDs) then {
	// make sure the player cannot un-admin themselves
	if (_player == player) exitWith {systemChat "You cannot remove access from yourself!"; playSound "addItemFailed";};

	private _message = format ["Are you sure you want to remove admin panel access from %1?", name _player];
	private _confirm = [_message, "CONFIRM REMOVE ACCESS", "CONFIRM", "CANCEL", _admp_display] call BIS_fnc_guiMessage;

	if (_confirm) then {
		admp_authorisedIDs deleteAt (admp_authorisedIDs find (getPlayerUID _player));
		publicVariable "admp_authorisedIDs";
		
		systemChat format ["Removed %1's admin access!", name _player];
		playSound "3DEN_notificationDefault";

		if (_player != player) then { // show selected player a message
			_message = format ["%1 revoked your admin access!", name player];
			[_message] remoteExec ["systemChat", _player, false];
		};
	};
} else {
	private _message = format ["Are you sure you want to give admin panel access to %1?", name _player];
	private _confirm = [_message, "CONFIRM ADMIN ACCESS", "CONFIRM", "CANCEL", _admp_display] call BIS_fnc_guiMessage;

	if (_confirm) then {
		admp_authorisedIDs pushBackUnique (getPlayerUID _player);
		publicVariable "admp_authorisedIDs";

		systemChat format ["Granted %1 admin access!", name _player];
		playSound "3DEN_notificationDefault";

		if (_player != player) then { // show selected player a message
			_message = format ["%1 granted you admin access!", name player];
			[_message] remoteExec ["systemChat", _player, false];
		};
	};
};
