/*
	Author: TheTimidShade

	Description:
		Executed locally on client to enable/disable infinite ammo functionality

	Parameters:
		0: NUMBER - ClientID of player who pressed the toggle button (to return state)
		
	Returns:
		NONE
*/

params ["_clientID"];

if (admp_utilities_infammo_EHindex == -1) then { // unit does not have EH added
	admp_utilities_infammo_EHindex = player addEventHandler["Fired", {
		_muzzle = (currentMuzzle player);
		_ammo = player ammo _muzzle;
		player setAmmo [_muzzle, _ammo+1];
		player setVariable ["ace_overheating_" + (primaryWeapon player) + "_temp", 0]; // remove weapon heat
	}];
	[1] remoteExec ["admp_fnc_setReturnValue", _clientID, false]; // return status to client
	admp_utilities_infammo_enabledUnits pushBackUnique player;

} else { // unit has EH
	player removeEventHandler ["Fired", admp_utilities_infammo_EHindex];
	admp_utilities_infammo_EHindex = -1;
	[0] remoteExec ["admp_fnc_setReturnValue", _clientID, false];
	admp_utilities_infammo_enabledUnits deleteAt (admp_utilities_infammo_enabledUnits find player);
};

publicVariable "admp_utilities_infammo_enabledUnits";