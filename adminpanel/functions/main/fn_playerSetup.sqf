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

		if (_key == _yourKey && !dialog) then {
			if (player call admp_fnc_isAdmin) then {
				if (_shift) then {
					createDialog "TFD_AdminMessage";
					true
				} else {
					createDialog "TFD_AdminPanel";
					true
				};
				
			} else {
				createDialog "TFD_AdminMessage";
					true
			};
		}; 
	}];

	waitUntil { isNull findDisplay 46 };
};

};