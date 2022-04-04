/*
	Author: TheTimidShade

	Description:
		Executed from playerSetup.sqf, handles assignment of radio items and channels

	Parameters:
		NONE
		
	Returns:
		NONE
*/

// Check to make sure variables exist
if (isNil "TFD_CLEAR_RADIOS") then {TFD_CLEAR_RADIOS = true;};
if (isNil "TFD_AUTOASSIGN_RADIOS") then {TFD_AUTOASSIGN_RADIOS = true;};

if (isNil "TFD_SRRADIOS") then {TFD_SRRADIOS = ["ACRE_PRC343", "ACRE_PRC148"];};
if (isNil "TFD_LRRADIOS") then {TFD_LRRADIOS = ["ACRE_PRC152", "ACRE_SEM52SL", "ACRE_PRC117F"];};

if (isNil "TFD_RADIO_ASSIGNMENT") then {TFD_RADIO_ASSIGNMENT = [];};

if (isNil "TFD_ALTERNATE_CHANNEL_ASSIGNMENT") then {TFD_ALTERNATE_CHANNEL_ASSIGNMENT = [];};

if (TFD_CLEAR_RADIOS) then {TFD_RADIO_CLEAR_COMPLETED = false; [] spawn TFD_fnc_clearRadios;} else {TFD_RADIO_CLEAR_COMPLETED = true;};
waitUntil {TFD_RADIO_CLEAR_COMPLETED};
if (TFD_AUTOASSIGN_RADIOS) then {TFD_RADIO_ASSIGNMENT_COMPLETED = false; [] spawn TFD_fnc_giveRadios;} else {TFD_RADIO_ASSIGNMENT_COMPLETED = true;};
waitUntil {TFD_RADIO_ASSIGNMENT_COMPLETED};
[] spawn TFD_fnc_assignChannels;