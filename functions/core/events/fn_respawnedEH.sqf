/*
	Author: TheTimidShade

	Description:
		Executes TFD Framework scripts when the player respawns
		This function is also executed once on mission initialisation

	Parameters:
		Parameters passed from Respawn EH
		https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Respawn
		
	Returns:
		NONE
*/

if (!hasInterface) exitWith {};

_this spawn { // To prevent suspension from blocking mission initialisation

params ["_unit", "_corpse"];

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};

// Place player's weapon on back
player action ["SWITCHWEAPON", player, player, -1];

// Assign group identity
[] spawn TFD_fnc_assignGroup; 

// Assign patch
if (missionNamespace getVariable ["ENABLE_PATCHES", false]) then {[] spawn TFD_fnc_setPatch;};

// Apply loadout randomisation
if (missionNamespace getVariable ["ENABLE_LOADOUT_RANDOMISATION", false]) then {[] spawn TFD_fnc_unitVariation;};

// If forced uniform is enabled, reapply the script
if (missionNamespace getVariable ["ENABLE_GEAR_RESTRICTION", false]) then {[] spawn TFD_fnc_forceUniform;};

// Reassign/program radios
[] spawn TFD_fnc_handleRadioSetup;

// Execute player setup script
_handle = [] execVM "scripts\playerSetup.sqf";
waitUntil {scriptDone _handle};

};