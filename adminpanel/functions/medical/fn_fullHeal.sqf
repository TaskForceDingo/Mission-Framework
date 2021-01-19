/*
	Author: TheTimidShade

	Description:
		Fully heals the selected unit

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

if (admp_aceEnabled) then {
	[_player] remoteExec ["ace_medical_treatment_fnc_fullHealLocal", _player, false];
} else {
	_player setDamage 0;
};

systemChat format ["Healed %1!", name _player];
playSound "3DEN_notificationDefault";

if (_player != player) then { // show healed player a message
	_message = format ["%1 healed you!", name player];
	[_message] remoteExec ["systemChat", _player, false];
};