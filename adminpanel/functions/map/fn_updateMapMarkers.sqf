/*
	Author: TheTimidShade

	Description:
		Handles the creation and updates of markers on players for the admin panel map

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

// if not active already, create markers for each unit from the player array
if (!admp_map_markersActive) then {
	
	{deleteMarkerLocal (_x#0)} forEach admp_map_markerArray; // clear markers from array if they exist
	admp_map_markerArray = [];
	admp_map_markersActive = true;

	{
		// assign marker name based on player name (must be unique)
		private _marker = "admp_tracker_" + name _x;

		// create markers, one for player and direction and one to show selection status
		createMarkerLocal [_marker, getPos _x];
		_marker setMarkerShapeLocal "ICON";
		
		_data = [_x] call admp_fnc_getMarkerInfo;
		[_marker, _data] call admp_fnc_updateMarker;

		// add marker to marker array
		admp_map_markerArray pushBackUnique [_marker, _x]; // include attached unit for easy reference
	} forEach admp_playerlist_playerArray;

	
} else { // if map markers are active, update existing markers
	{
		private _marker = _x#0;
		private _player = _x#1;

		// get updated data
		private _data = [_player] call admp_fnc_getMarkerInfo;
		[_marker, _data] call admp_fnc_updateMarker;
	} forEach admp_map_markerArray;
};

[] call admp_fnc_updateSelectedMarker;