/*
	Author: TheTimidShade

	Description:
		Updates the marker showing the selected player

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825

// get admin panel display
private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

// set up selected marker
if (isNull _player) then { // if the selected player doesn't exist, set position to origin and hide marker
	admp_map_selectedMarker setMarkerPosLocal [0,0];
	admp_map_selectedMarker setMarkerAlphaLocal 0;
} else {
	admp_map_selectedMarker setMarkerAlphaLocal 1;
	if (vehicle _player == _player) then {
		admp_map_selectedMarker setMarkerPosLocal (getPos _player);
		admp_map_selectedMarker setMarkerSizeLocal [0.88,0.88];
	} else {
		admp_map_selectedMarker setMarkerPosLocal (getPos vehicle _player);
		admp_map_selectedMarker setMarkerSizeLocal [1.2,1.2];
	};
};