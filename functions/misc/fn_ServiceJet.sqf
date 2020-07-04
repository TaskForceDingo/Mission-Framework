//Sidechat macro - do not touch
#define DEPOT_CHAT(unit,message) [[side driver unit, "AirBase"], message] remoteExec ["sideChat", driver unit, false];


/* Condition 
	- place the below script line into the condition of the trigger

	{_x iskindof "plane" && speed _x < 1} count thislist > 0
*/

/* Activation
	- place the below in the Activation field of the trigger

	 [(thisList select 0)] spawn TFD_fnc_ServiceJet;
*/


private ["_veh","_vehType"];
_veh = _this select 0;
_vehType = getText(configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
_hq = [side driver _veh, "AirBase"];

if ((_veh isKindOf "plane") && (isPlayer driver _veh)) then { 
	
	_str = format ["Servicing %1.", _vehType];
	DEPOT_CHAT(_veh,_str);
	[_veh, 0] remoteExec ["setFuel",0];
	[_veh, 0] remoteExec ["setVehicleAmmoDef",0];
	_veh setVelocity [0,0,0];
	sleep 5;
	
	[_veh, 1] remoteExec ["setVehicleAmmoDef",0];
	_str = format ["%1 Rearmed.", _vehType];
	DEPOT_CHAT(_veh,_str);	
	sleep 5;
	
	[_veh, 0] remoteExec ["setDamage",0];	
	_str = format ["%1 Repaired.", _vehType];
	DEPOT_CHAT(_veh,_str);	
	sleep 5;
	
	_str = format ["%1 Refueling.", _vehType];
	DEPOT_CHAT(_veh,_str);
	sleep 2;
	
	[_veh, 1] remoteExec ["setFuel",0];
	_str = format ["Service Complete", _vehType];
	DEPOT_CHAT(_veh,_str);
};



