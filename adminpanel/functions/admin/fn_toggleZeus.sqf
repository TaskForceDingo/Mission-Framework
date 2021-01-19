/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Creates a zeus module for the selected player unit or deletes it if player already has one

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825

#define IDC_ADMINPANEL_ADMIN_ZEUS_BACK		4353
#define IDC_ADMINPANEL_ADMIN_ZEUS			4942

// colour macros // [0.98,0.69,0.25,1]
#define COL_BUTTON_TEXT_ACTIVE [1,1,1,1]
#define COL_BUTTON_TEXT_INACTIVE [1,1,1,1]
#define COL_BUTTON_ACTIVE [0.98,0.69,0.25,1]
#define COL_BUTTON_INACTIVE [0,0,0,0]

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

if (isNull _player) exitWith {systemChat "No target found!"; playSound "addItemFailed";}; // if there is no selected target exit

private _zeus_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_ZEUS;
private _zeus_back = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_ZEUS_BACK;

private _hasZeus = !isNull(getAssignedCuratorLogic _player);

if (!_hasZeus) then { // player doesn't have zeus, create zeus module
	[_player] remoteExec ["admp_fnc_createZeusModule", 2, false];

	systemChat format ["Promoted %1 to Zeus!", name _player];
	playSound "3DEN_notificationDefault";

	if (_player != player) then { // show promoted player a message
		_message = format ["%1 promoted you to Zeus!", name player];
		[_message] remoteExec ["systemChat", _player, false];
	};
	
	_zeus_ctrl ctrlSetTextColor COL_BUTTON_TEXT_ACTIVE;
	_zeus_back ctrlSetBackgroundColor COL_BUTTON_ACTIVE;
} else {
	deleteVehicle (getAssignedCuratorLogic _player);

	systemChat format ["Removed %1's Zeus access!", name _player];
	playSound "3DEN_notificationDefault";

	if (_player != player) then { // show promoted player a message
		_message = format ["%1 removed your Zeus access!", name player];
		[_message] remoteExec ["systemChat", _player, false];
	};

	_zeus_ctrl ctrlSetTextColor COL_BUTTON_TEXT_INACTIVE;
	_zeus_back ctrlSetBackgroundColor COL_BUTTON_INACTIVE;
};