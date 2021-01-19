/*
	Author: TheTimidShade

	Description:
		Wakes up the selected unit if they have stable enough vitals

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

if (!admp_aceEnabled) exitWith {};

if (!(_player getVariable ["ACE_isUnconscious", false])) exitWith {systemChat format ["%1 is already conscious!", name _player]; playSound "addItemFailed";};

[_player, false] remoteExec ["ace_medical_fnc_setUnconscious", _player, false];

sleep 0.1; // small sleep to let state update

if (_player getVariable ["ACE_isUnconscious", false]) then {
	systemChat format ["Failed to wake %1!", name _player];
	playSound "addItemFailed";
} else {
	systemChat format ["Successfully woke %1!", name _player];
	playSound "3DEN_notificationDefault";
};
