/***
	
	'TFD_fnc_initCivTown'
	
	Author: TheTimidShade
	
	Description:
	Initialises civilian population for given marker.
	
	Execution:
	Should only be executed on server/host player.
	
	Parameter(s):
	0	_marker - STRING: Name of marker used for town centre.
	1	_count - NUMBER (OPTIONAL): Number of civilians to spawn when players are close enough.
	2	_radius - NUMBER (OPTIONAL): Radius in metres within civilians to spawn from marker.
	3	_range - NUMBER (OPTIONAL): Radius in metres players must be within before civs spawn (or despawn)
	
	Returns:
	NONE
	
	Example(s):
	Spawn civs at 'civ_marker_1' with default params:
		["civ_marker_1"] spawn TFD_fnc_initCivTown;
	
	Spawn 25 civs within 150m of 'civ_marker_2' when players are within 1000m:
		["civ_marker_2", 25, 150, 1000] spawn TFD_fnc_initCivTown;
	
***/

params [
	["_marker", "", [""]],
	["_count", 10, [0]],
	["_radius", 50, [0]],
	["_range", 1000, [0]]
];

if (_marker == "") exitWith {
	["No marker provided for civpop, terminating"] remoteExec ["systemChat", 0];
};

waitUntil {time > 0};

while {time > 0} do {
	if (spawnCivs) then {
		_inRangeArray = [];
	
		{
			if ((_x distance (getMarkerPos _marker)) < _range) then {
				_inRangeArray pushBackUnique true;
			}
			else {
				_inRangeArray pushBackUnique false;
			};
		} forEach allPlayers;
		
		if (true in _inRangeArray) then {
			_activeCivs = {side _x == civilian && (_x distance (getMarkerPos _marker) < _radius*2)} count allUnits;
			
			if (_activeCivs < _count) then {
				_civsNeeded = _count - _activeCivs;
				for [{_i = 0}, {_i < _civsNeeded}, {_i = _i + 1}] do {
					[_marker, _radius, _range] spawn TFD_fnc_spawnCiv;
					sleep 0.5;
				};
			};
		};
	};
	
	//Test condition every 10 seconds to save performance
	sleep 10;
};




