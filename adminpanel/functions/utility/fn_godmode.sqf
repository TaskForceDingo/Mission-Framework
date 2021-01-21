/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Enables god mode on selected unit (disables damage)

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825

#define IDC_ADMINPANEL_UTILITIES_GODMODE_BACK	4354
#define IDC_ADMINPANEL_UTILITIES_GODMODE		4932

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

private _godmode_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_UTILITIES_GODMODE;
private _godmode_back = _admp_display displayCtrl IDC_ADMINPANEL_UTILITIES_GODMODE_BACK;

//private _godmode = !(_player getVariable ["admp_damageEnabled", false]);
private _godmode = _player in admp_utilities_godmode_enabledUnits;

if (!_godmode) then {
	[_player, false] remoteExec ["allowDamage", 0, false];
	admp_utilities_godmode_enabledUnits pushBackUnique _player;
	
	systemChat format ["Made %1 invulnerable!", name _player];
	playSound "3DEN_notificationDefault";
	
	_godmode_ctrl ctrlSetTextColor COL_BUTTON_TEXT_ACTIVE;
	_godmode_back ctrlSetBackgroundColor COL_BUTTON_ACTIVE;

	if (_player != player) then { // show selected player a message
		_message = format ["%1 enabled godmode on you!", name player];
		[_message] remoteExec ["systemChat", _player, false];
	};
} else {
	[_player, true] remoteExec ["allowDamage", 0, false];
	admp_utilities_godmode_enabledUnits deleteAt (admp_utilities_godmode_enabledUnits find _player);
	
	systemChat format ["Disabled invulnerability for %1!", name _player];
	playSound "3DEN_notificationDefault";
	
	_godmode_ctrl ctrlSetTextColor COL_BUTTON_TEXT_INACTIVE;
	_godmode_back ctrlSetBackgroundColor COL_BUTTON_INACTIVE;

	if (_player != player) then { // show selected player a message
		_message = format ["%1 disabled godmode on you!", name player];
		[_message] remoteExec ["systemChat", _player, false];
	};
};

publicVariable "admp_utilities_godmode_enabledUnits";