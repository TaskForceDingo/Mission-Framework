//Sidechat macro - do not touch
#define DEPOT_CHAT(unit,message) [[side driver unit, "AirBase"], message] remoteExec ["sideChat", driver unit, false];

/* Condition 
	- place the below script line into the condition of the trigger
	- set activation to "Any Player" and activation type to "Present"

	{_x iskindof "Air" && speed _x < 1} count thislist > 0
*/

/* Activation
	- place the below in the Activation field of the trigger

	 [(thisList select 0)] spawn TFD_fnc_serviceAircraft;
*/

if (!isServer) exitWith {};

private ["_veh","_vehType"];
_veh = _this select 0;
_vehType = getText(configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
_hq = [side driver _veh, "AirBase"];

if ((_veh isKindOf "Air") && (isPlayer driver _veh)) then { 
	
	_str = format ["Servicing %1.", _vehType];
	DEPOT_CHAT(_veh,_str);
	[_veh, 0] remoteExec ["setFuel", _veh];
	[_veh, 0] remoteExec ["setVehicleAmmoDef", _veh];
	_veh setVelocity [0,0,0];
	sleep 5;
	
	[_veh, 1] remoteExec ["setVehicleAmmoDef", _veh];
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



