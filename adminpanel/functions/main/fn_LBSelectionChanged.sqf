/*
	Author: TheTimidShade

	Description:
		Executes actions run when selection is changed for the main playerlist

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825
//#define IDC_ADMINPANEL_PLAYER_GROUP_COMBO	5425

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
//private _admp_player_groupcombo = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_GROUP_COMBO;

private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player
//private _groupPlayer = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

// update utility buttons
[] call admp_fnc_updateToggleControls;

// update player skills
[] call admp_fnc_loadPlayerSkills;

if (!isNull _player) then { // update selected player
	admp_playerlist_selectedPlayer = name _player;
} else {
	admp_playerlist_selectedPlayer = "none";
};

/*
if (!isNull _groupPlayer) then { // update selected player
	admp_groupcombo_selectedPlayer = name _player;
} else {
	admp_groupcombo_selectedPlayer = "none";
};
*/

playSound "click";