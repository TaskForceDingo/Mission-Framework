/*
	Author: TheTimidShade

	Description:
		Handles killed/respawn events for TFD Framework

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

player addEventHandler ["Killed", {
	_this spawn TFD_fnc_killedEH;
}];

player addEventHandler ["Respawn", {
	_this spawn TFD_fnc_respawnedEH;
}];

};