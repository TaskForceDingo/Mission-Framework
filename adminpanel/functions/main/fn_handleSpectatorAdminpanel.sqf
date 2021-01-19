/*
	Author: TheTimidShade

	Description:
		Continously checks for spectator display so that adminpanel EH can be added

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

while {true} do { // scary infinite loop of doom
	waitUntil {sleep 1; !isNull (findDisplay 60492)}; // wait until spectator display exists
	
	(findDisplay 60492) displayAddEventHandler ["keyDown",{
		params ["_disp", "_key", "_shift", "_ctrl", "_alt"];
		_yourKey = 0xC5; // Pause Break -- https://community.bistudio.com/wiki/DIK_KeyCodes

		_uid = getPlayerUID player;

		if (_key == _yourKey && (_uid in admp_authorisedIDs)) then {
			createDialog "TFD_AdminPanel";
			true
		};
	}];

	waitUntil {sleep 1; isNull (findDisplay 60492)}; // wait until spectator display is closed as to not add more EHs
};