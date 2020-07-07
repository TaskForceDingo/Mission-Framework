params [
	["_grp", grpNull, [grpNull]],
	["_zone", objNull, [objNull, ""]],
	["_allowMovement", true, [false]],
	["_customLoadout", false, [true]],
	["_unitSide", east, [east]]
];

_zonePos = [0,0];
if (typeName _zone == "STRING") then {
	_zonePos = getMarkerPos _zone;
}
else {
	_zonePos = getPos _zone;
};

while {{alive _x} count units _grp > 0} do {
	// wait until players are more than 800m away
	waitUntil {sleep 1; {_x distance _zonePos < 800} count allPlayers <= 0};

	// save data of all units in the group that are still alive
	_combatMode = combatMode _grp;
	_groupDataArray = [];
	{
		if (alive _x) then {
			_type = typeOf _x;
			_pos = getPosATL _x;
			_dir = getDir _x;

			_groupDataArray pushBack [_type, _pos, _dir];
		};
		
		deleteVehicle _x;
	} forEach units _grp;

	// wait until players are within 800m
	waitUntil {sleep 1; {_x distance _zonePos < 800} count allPlayers > 0};

	// create a new group for uncached garrison
	_grp = createGroup _unitSide;
	_grp setCombatMode _combatMode;
	{
		// get data from array
		_class = _x select 0;
		_pos = _x select 1;
		_dir = _x select 2;

		// create unit
		_unit = _grp createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
		_unit setDir _dir;
		_unit setPosATL _pos;

		doStop _unit;
		if (!_allowMovement) then {
			_unit disableAI "MOVE";
		};

		// reload any custom loadout applied
		if (_customLoadout) then {
			[_unit] spawn TFD_fnc_gar_customLoadout;
		};

		sleep 0.3;
	} forEach _groupDataArray;
};
