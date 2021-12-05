/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Updates admin panel player list and group assignment combo box and reselects selected unit

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825
//#define IDC_ADMINPANEL_PLAYER_GROUP_COMBO	5425

// get admin panel display
private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

// get player list listbox and group assignment combo box and populate
private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
//private _admp_player_groupcombo = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_GROUP_COMBO;
admp_playerlist_playerArray = [] call admp_fnc_getPlayerList;
admp_playerlist_playerCount = count admp_playerlist_playerArray; // save player count to check if playerlist update is necessary

lbClear _admp_playerlist_listbox;
//lbClear _admp_player_groupcombo;
{
	_name = name _x;
	_displayName = name _x;
	_playerArrayIndex = _forEachIndex;

	if (_x call admp_fnc_isAdmin) then {_displayName = _displayName + "*"};

	_entryIndex = _admp_playerlist_listbox lbAdd _displayName;
	_admp_playerlist_listbox lbSetData [_entryIndex, _name];
	_admp_playerlist_listbox lbSetValue [_entryIndex, _playerArrayIndex]; // set value to index from player array so unit can be referenced

	/*
	_entryIndex = _admp_player_groupcombo lbAdd _name;
	_admp_player_groupcombo lbSetData [_entryIndex, _name];
	_admp_player_groupcombo lbSetValue [_entryIndex, _playerArrayIndex];
	*/

} forEach (admp_playerlist_playerArray);
lbSort _admp_playerlist_listbox;
//lbSort _admp_player_groupcombo;

private _foundUnitPlayer = false;
//private _foundUnitGroup = false;
// if the previosly selected unit can be found in the list, select them
for "_i" from 0 to (admp_playerlist_playerCount - 1) do {
	if (_admp_playerlist_listbox lbData (_i) == admp_playerlist_selectedPlayer) then {
		_admp_playerlist_listbox lbSetCurSel _i; // select the player
		_foundUnitPlayer = true;
	};
	/*
	if (_admp_player_groupcombo lbData (_i) == admp_groupcombo_selectedPlayer) then {
		_admp_player_groupcombo lbSetCurSel _i; // select the player
		_foundUnitGroup = true;
	};
	*/
};

if (!_foundUnitPlayer) then {_admp_playerlist_listbox lbSetCurSel 0;}; // if can't find the unit, set to first in list
//if (!_foundUnitGroup) then {_admp_player_groupcombo lbSetCurSel 0;}; // if can't find the unit, set to first in list

// set map_markersActive variable to false to tell admp_fnc_updateMapMarkers to reload markers
admp_map_markersActive = false;