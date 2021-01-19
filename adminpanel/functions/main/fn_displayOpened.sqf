/*
	Author: TheTimidShade

	Description:
		Is executed when admin panel interface is opened. Starts update process for controls.

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

disableSerialization;

// update player list first so refresh can use selected unit
[] call admp_fnc_updatePlayerList;

// start refresh process
[] spawn admp_fnc_refresh;

[] call admp_fnc_populateEndingList;

[] spawn admp_fnc_refreshPIPcam; // start updating PIP cam (requires higher update rate than other UI for smooth first person cam)