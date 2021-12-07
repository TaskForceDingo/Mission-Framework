/*
	Author: TheTimidShade

	Description:
		Prevents the player from firing their weapon in any of the markers/triggers
		passed in the parameters

		Can only be called once per mission

		Called from init.sqf

	Parameters:
		0: ARRAY - Array of triggers or markers player cannot fire in
		           e.g. [safeTrigger1, "safeMarker"]
		
	Returns:
		NONE
*/

params [
	["_zones", [], [[]]]
];
	
if (!hasInterface) exitWith {};
if (!isNil tfd_grenadeStopZones) exitWith {};
waitUntil {!isNull player};

tfd_grenadeStopZones = _zones;

["ace_firedPlayer", { 
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

	if ({_unit inArea _x} count tfd_grenadeStopZones > 0) then
	{
		deleteVehicle _projectile;
		"WARNING" hintC ["Firing your weapon is not permitted in this area!"];
		hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
			0 = _this spawn {
				_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
				hintSilent "";
			};
		}];
	};
 
}] call CBA_fnc_addEventHandler; 

