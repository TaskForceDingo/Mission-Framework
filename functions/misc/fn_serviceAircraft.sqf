/*
	Author: JohnnyShootos

	Description:
		Services an aircraft (rearm/repair/refuel)

	Parameters:
		0: OBJECT - Aircraft to service
		1: NUMBER - Total duration of service (Default: 30)
		
	Returns:
		NONE

	Example:
		Place down TFD Aircraft Service Point composition or to manually set up a service point:
		
		Set trigger activation parameters to 'Any Player' and 'Present'
		
		Place in trigger 'Condition':
			{_x iskindof "Air" && isTouchingGround _x && speed _x < 0.5} count thislist > 0
		
		Place in trigger 'On Activation':
			private _duration = 30;
			[(thisList select 0), _duration] spawn TFD_fnc_serviceAircraft;
*/

#define DEPOT_CHAT(UNIT,MESSAGE) [[side driver UNIT, "AirBase"], MESSAGE] remoteExec ["sideChat", driver UNIT, false];

params [
	["_vehicle", objNull, [objNull]],
	["_duration", 30, [0]]
];

if (!isServer || missionNamespace getVariable ["TFD_SERVICE_IN_PROGRESS", false]) exitWith {};

private _segmentDuration = (_duration-2)/3;
private _vehicleType = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
private _message = "";

if ((_vehicle isKindOf "Air") && (isPlayer driver _vehicle)) then { 
	TFD_SERVICE_IN_PROGRESS = true;

	_message = format ["Servicing %1...", _vehicleType];
	DEPOT_CHAT(_vehicle,_message);
	
	[_vehicle, 0] remoteExec ["setFuel", _vehicle];
	[_vehicle, 0] remoteExec ["setVehicleAmmo", _vehicle];
	[_vehicle, [0,0,0]] remoteExec ["setVelocity", _vehicle];
	
	sleep 2;

	DEPOT_CHAT(_vehicle,"Rearming...");

	sleep _segmentDuration;

	_message = "Rearm complete, repairing...";
	DEPOT_CHAT(_vehicle,_message);
	[_vehicle, 1] remoteExec ["setVehicleAmmo", _vehicle];
	
	sleep _segmentDuration;
	
	_message = "Repair complete, refuelling...";
	DEPOT_CHAT(_vehicle,_message);	
	[_vehicle, 0] remoteExec ["setDamage", _vehicle];	
	
	sleep _segmentDuration;
	
	_message = "Refuel complete...";
	DEPOT_CHAT(_vehicle,_message);
	[_vehicle, 1] remoteExec ["setFuel", _vehicle];
	
	sleep 2;
	
	_message = "Service complete!";
	DEPOT_CHAT(_vehicle,_message);

	sleep 10;

	TFD_SERVICE_IN_PROGRESS = false;
};