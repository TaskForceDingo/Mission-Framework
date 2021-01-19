/*
	Author: TheTimidShade

	Description:
		Refreshes status of admin panel controls

	Parameters:
		NONE
		
	Returns:
		NONE
*/

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825

// get display and controls
private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;

// only update the display while it is open
while {!isNull _admp_display} do {
	// if the number of players has changed, update the player list and reselect selected unit
	if (count ([] call admp_fnc_getPlayerList) != admp_playerlist_playerCount) then {
		[] call admp_fnc_updatePlayerList;
	};
	
	// get selected player from player list
	private _selectedPlayer = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection;
	
	// update map markers
	[] call admp_fnc_updateMapMarkers;

	// update player info
	private _playerInfo = [_selectedPlayer] call admp_fnc_getPlayerInfo;
	[_playerInfo] call admp_fnc_updatePlayerInfo;

	// update medical info
	private _medicalInfo = [_selectedPlayer] call admp_fnc_getPlayerMedicalInfo;
	[_medicalInfo] call admp_fnc_updatePlayerMedicalInfo;

	[_selectedPlayer] call admp_fnc_updateToggleControls;

	[] call admp_fnc_updateServerStats;

	sleep 0.1;
};

// clear get rid of map markers once display is closed
{deleteMarkerLocal (_x#0)} forEach admp_map_markerArray; // clear markers from array if they exist
admp_map_markerArray = [];
admp_map_markersActive = false;

admp_map_selectedMarker setMarkerAlphaLocal 0; // hide selected marker

// reset selected player
admp_playerlist_selectedPlayer = name player;
admp_groupcombo_selectedPlayer = name player;

admp_camera cameraEffect ["terminate","back"];
camDestroy admp_camera;
admp_camera_attachedObject = objNull;