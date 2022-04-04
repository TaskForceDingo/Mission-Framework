/*
	Author: TheTimidShade

	Description:
		Prevents the player from firing their weapon in any markers/triggers in SPAWN_PROTECTION_SAFEZONES

		Called from init.sqf

	Parameters:
		NONE
		
	Returns:
		NONE
*/
	
if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!ENABLE_SPAWN_PROTECTION) exitWith {};

["ace_firedPlayer", { 
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

	if ({_unit inArea _x} count SPAWN_PROTECTION_SAFEZONES > 0) then
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

TFD_DEBUG_GRENADE_STOP_COMPLETE = true;

};