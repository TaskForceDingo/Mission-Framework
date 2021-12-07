/*
	Author: JohnnyShootos

	Description:
		Services an aircraft (rearm/repair/refuel)

	Parameters:
		0: OBJECT - Aircraft to service
		
	Returns:
		NONE

	Example:
		Set trigger activation parameters to 'Any Player' and 'Present'
		
		Place in trigger 'Condition':
			{_x iskindof "Air" && speed _x < 1} count thislist > 0
		
		Place in trigger 'On Activation':
			[(thisList select 0)] spawn TFD_fnc_serviceAircraft;
*/

#define DEPOT_CHAT(unit,message) [[side driver unit, "AirBase"], message] remoteExec ["sideChat", driver unit, false];

if (!isServer) exitWith {};

private ["_veh","_vehType"];
_veh = _this select 0;
_vehType = getText(configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
_hq = [side driver _veh, "AirBase"];

if ((_veh isKindOf "Air") && (isPlayer driver _veh)) then { 
	
	_str = format ["Servicing %1.", _vehType];
	DEPOT_CHAT(_veh,_str);
	[_veh, 0] remoteExec ["setFuel", _veh];
	[_veh, 0] remoteExec ["setVehicleAmmo", _veh];
	_veh setVelocity [0,0,0];
	sleep 5;
	
	[_veh, 1] remoteExec ["setVehicleAmmo", _veh];
	_str = format ["%1 Rearmed.", _vehType];
	DEPOT_CHAT(_veh,_str);	
	sleep 5;
	
	[_veh, 0] remoteExec ["setDamage", _veh];	
	_str = format ["%1 Repaired.", _vehType];
	DEPOT_CHAT(_veh,_str);	
	sleep 5;
	
	_str = format ["%1 Refueling.", _vehType];
	DEPOT_CHAT(_veh,_str);
	sleep 2;
	
	[_veh, 1] remoteExec ["setFuel", _veh];
	_str = format ["Service Complete", _vehType];
	DEPOT_CHAT(_veh,_str);
};



