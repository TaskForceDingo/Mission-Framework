/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Adds keydown event handler to player and handles tracking of player variables

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

sleep 3;

waitUntil {time > 1 && (!isNil "admp_authorisedIDs") && (getClientStateNumber > 9)};

(findDisplay 46) displayAddEventHandler ["keyDown",{
	params ["_disp", "_key", "_shift", "_ctrl", "_alt"];
	_yourKey = 0xC5; // Pause Break -- https://community.bistudio.com/wiki/DIK_KeyCodes

	_uid = getPlayerUID player;

	if (_key == _yourKey && !dialog && (_uid in admp_authorisedIDs)) then {
		createDialog "TFD_AdminPanel";
		true
	};
}];

[] spawn admp_fnc_handleClientVars;
[] spawn admp_fnc_handleSpectatorAdminpanel;