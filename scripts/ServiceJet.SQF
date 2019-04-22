private ["_veh","_vehType"];
_veh = _this select 0;
_vehType = getText(configFile>>"CfgVehicles">>typeOf _veh>>"DisplayName");

if ((_veh isKindOf "plane") && (driver _veh == player)) exitWith { 

	_veh sidechat format ["Servicing %1.", _vehType];
	_veh setFuel 0;
	sleep 5;
	
	_veh setVehicleAmmo 1;	
	_veh sidechat format ["%1 Rearmed.", _vehType];
	sleep 5;
	
	_veh setDamage 0;	
	_veh sidechat format ["%1 Repaired.", _vehType];	
	sleep 5;
	
	_veh setFuel 1;
	_veh sidechat format ["%1 Refueled.", _vehType];
	sleep 2;
	

	_veh sidechat format ["Service Complete", _vehType];
};


Condition

call{{_x iskindof "plane" && speed _x < 1} count thislist > 0  }


Activation

call{_handle = [(thisList select 0)] execVM "scripts\vehicle\ServiceJet.sqf";}
