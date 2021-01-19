/*
	Author: TheTimidShade

	Description:
		Centres the map on the selected player
		Called when player is double clicked in player list

	Parameters:
		NONE

	Returns:
		NONE
*/

disableSerialization;

if (admp_playerlist_playerCount == 0) exitWith {}; // if there are no selectable players, ignore map click

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825
#define IDC_ADMINPANEL_MAP					4525

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _map_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_MAP;

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

private _zoomLevel = ctrlMapScale _map_ctrl;
_map_ctrl ctrlMapAnimAdd [0.3, _zoomLevel, getPos _player];
ctrlMapAnimCommit _map_ctrl;