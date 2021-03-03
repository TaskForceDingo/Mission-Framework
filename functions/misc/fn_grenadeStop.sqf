params [
	["_zones", [], [[]]]
];
	
if (isDedicated) exitWith {};
waitUntil {!isNull player};

tfd_grenadeStopZones = _zones;

["ace_firedPlayer", { 
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

	if ({_unit distance getMarkerPos (_x#0) < _x#1} count tfd_grenadeStopZones > 0) then
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

