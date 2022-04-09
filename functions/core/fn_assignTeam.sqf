/*
	Author: TheTimidShade

	Description:
		Assigns team colour to player based on team colour arrays in init.sqf

	Parameters:
		NONE
		
	Returns:
		NONE

*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};

private _name = vehicleVarName player;

if (_name in TFD_RED_TEAM) then {
	player assignTeam "RED";
};
if (_name in TFD_BLUE_TEAM) then {
	player assignTeam "BLUE";
};
if (_name in TFD_YELLOW_TEAM) then {
	player assignTeam "YELLOW";
};
if (_name in TFD_GREEN_TEAM) then {
	player assignTeam "GREEN";
};

TFD_DEBUG_ASSIGN_TEAM_COMPLETE = true;

};