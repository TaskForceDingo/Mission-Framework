params [
	["_zones", [], [[]]]
];
	
if (isDedicated) exitWith {};
waitUntil {!isNull player};

player addEventHandler ["Fired", {
	if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count _zones > 0) then
	{
		deleteVehicle (_this select 6);
		"WARNING" hintC ["Firing your weapon is not permitted at base!"];
		hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
			0 = _this spawn {
				_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
				hintSilent "";
			};
		}];
	};
}];

