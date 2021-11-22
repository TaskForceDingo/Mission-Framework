/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Adds keydown event handler to player and handles tracking of player variables

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

if (!hasInterface) exitWith {};

[] spawn {

[] spawn admp_fnc_handleClientVars;
[] spawn admp_fnc_handleSpectatorAdminpanel;

while {true} do {
	waitUntil { !isNull findDisplay 46 };

	(findDisplay 46) displayAddEventHandler ["keyDown",{
		params ["_disp", "_key", "_shift", "_ctrl", "_alt"];
		_yourKey = 0xC5; // Pause Break -- https://community.bistudio.com/wiki/DIK_KeyCodes

		_uid = getPlayerUID player;

		if (_key == _yourKey && !dialog && (_uid in admp_authorisedIDs)) then {
			createDialog "TFD_AdminPanel";
			true
		};
	}];

	waitUntil { isNull findDisplay 46 };
};

};