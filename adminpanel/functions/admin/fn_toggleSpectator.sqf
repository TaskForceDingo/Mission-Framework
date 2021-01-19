/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Toggles spectator mode on the local client

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// check for spectator display and update state if necessary
private _spectatorActive = !isNull (findDisplay 60492);

if (!alive player) exitWith {systemChat "Cannot close spectator while dead!"; playSound "addItemFailed";}; // disable spectator toggle for dead players

if !(_spectatorActive) then {
	["Initialize", [player,[],false]] spawn BIS_fnc_EGSpectator;
	sleep 0.2; // give time to create display
	(findDisplay 60492) displayAddEventHandler ["keyDown",{ // add event to escape key to close spectator
		params ["_disp", "_key", "_shift", "_ctrl", "_alt"];
		_yourKey = 0x01; // Escape Key -- https://community.bistudio.com/wiki/DIK_KeyCodes

		if (_key == _yourKey) then {
			[] spawn admp_fnc_toggleSpectator;
			true
		};
	}];
} else {
	if (alive player) then {  // only terminate spectator if player is not dead
		["Terminate"] spawn BIS_fnc_EGSpectator;
	};
};

closeDialog 2;