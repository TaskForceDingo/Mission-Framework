//Setup Group Identity
_handle = [] spawn TFD_fnc_assignGroup; 
waitUntil {scriptDone _handle};

// Roster
_handle = [] spawn TFD_fnc_unitRoster;
waitUntil {scriptDone _handle};

//Execute Player Setup sqf
_handle = [] execVM "scripts\playerSetup.sqf";
waitUntil {scriptDone _handle};
