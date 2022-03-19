/*
	Author: TheTimidShade

	Description:
		Executed from playerSetup.sqf, handles assignment of radio items and channels

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (TFD_CLEAR_RADIOS) then {TFD_RADIO_CLEAR_COMPLETED = false; [] spawn TFD_fnc_clearRadios;} else {TFD_RADIO_CLEAR_COMPLETED = true;};
waitUntil {TFD_RADIO_CLEAR_COMPLETED};
if (TFD_AUTOASSIGN_RADIOS) then {TFD_RADIO_ASSIGNMENT_COMPLETED = false; [] spawn TFD_fnc_giveRadios;} else {TFD_RADIO_ASSIGNMENT_COMPLETED = true;};
waitUntil {TFD_RADIO_ASSIGNMENT_COMPLETED};
[] spawn TFD_fnc_assignChannels;