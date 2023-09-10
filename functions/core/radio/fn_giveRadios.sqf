/*
	Author: TheTimidShade

	Description:
		Handles adding of radios to player units based of TFD_RADIO_ASSIGNMENT array in 'init.sqf'

	Parameters:
		NONE
		
	Returns:
		NONE
*/

// wait until the radio clear process is complete
waitUntil {sleep 1; missionNamespace getVariable ["TFD_RADIO_CLEAR_COMPLETED", false]};

// returns name of group the player is assigned to from TFD ORBAT
private _fnc_getORBATgroupName = {
	private _orbatGroupName = "";
	{
		if ((vehicleVarName player) in _x) then {_orbatGroupName = _x#0;};
	} forEach TFD_ORBAT;
	_orbatGroupName
};

// returns whether or not the player is a group leader (as per TFD_ORBAT)
private _fnc_isGroupLeader = {
	private _isLeader = false;
	{
		if ((vehicleVarName player) == _x#3) then {_isLeader = true;};
	} forEach TFD_ORBAT;
	_isLeader
};

{
	_x params ["_radioClassname", "_identifierList"];
	private _orbatGROUP = [] call _fnc_getORBATgroupName; // get the player's group name from TFD_ORBAT

	if ("All" in _identifierList || _orbatGROUP in _identifierList || (vehicleVarName player) in _identifierList || ("Leaders" in _identifierList && call _fnc_isGroupLeader)) then {
		
		if ([player, _radioClassname] call TFD_fnc_fitsInventory) then {
			[player, _radioClassname] call TFD_fnc_forceAddItem;
		} else {
			systemChat format ["Failed to add %1 to inventory! Check the loadout has enough space for the radio", _radioClassname];
			private _logMessage = format ["[TFD RADIO ASSIGNMENT] Failed to add radio '%1' to %2's loadout (role '%3', varname '%4')", _radioClassname, name player, roleDescription player, vehicleVarName player];
			[_logMessage] remoteExec ["TFD_fnc_logToServer", 2, false];
		};
	};
} forEach TFD_RADIO_ASSIGNMENT;

TFD_RADIO_ASSIGNMENT_COMPLETED = true;