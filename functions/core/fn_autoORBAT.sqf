/*
	Author: TheTimidShade

	Description:
		Automatically prompts the player to generate the TFD_ORBAT if it is empty when playing in singleplayer

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!hasInterface) exitWith {};
if (isMultiplayer) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

	waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
	if (missionNamespace getVariable ["ENABLE_INTRO", false]) then { waitUntil {missionNamespace getVariable ["INTRO_DONE", false]}; }; // Wait until intro is completed
	sleep 10;

	// Only prompt 
	if ( count (missionNamespace getVariable ["TFD_ORBAT", []]) == 0 ) then {
		private _confirmed = ["The 'TFD_ORBAT' array in 'init.sqf' is empty, would you like to copy the ORBAT generated from your current player configuration to your clipboard?", "GENERATE ORBAT", "COPY", "SKIP"] call BIS_fnc_guiMessage;
		if (_confirmed) then {
			[] call TFD_fnc_generateORBAT;
		} else {
			hint "WARNING: Many TFD framework scripts will fail to function without the TFD_ORBAT configured correctly. Make sure to set it in 'init.sqf' once your player slots are ready.";
		}
	};

};