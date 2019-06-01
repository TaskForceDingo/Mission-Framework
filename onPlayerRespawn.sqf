//Below prevents any scripts from spawning until after the intro.sqf rotating intro shot has finished.  Comment this out if you removed intro.sqf
 waitUntil {!isNil "BIS_fnc_establishingShot_playing" && !BIS_fnc_establishingShot_playing}; // Wait until establishing shot has stopped playing

// Setup Group Identity
_handle = [] execVM "scripts\assignGroup.sqf"; 
waitUntil { scriptDone _handle };

// Roster
_handle = [] execVM "scripts\unitRoster.sqf";
waitUntil { scriptDone _handle };

//Execute Player Setup sqf
_handle = [] execVM "scripts\playerSetup.sqf";
waitUntil { scriptDone _handle };

//Close the spectator if the player respawned during the mission
["Terminate"] call BIS_fnc_EGSpectator;

