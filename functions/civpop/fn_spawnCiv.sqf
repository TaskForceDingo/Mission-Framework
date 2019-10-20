/***
	
	'TFD_fnc_spawnCiv'
	
	Author: TheTimidShade
	
	Description:
	Spawns a civilian in specified town.
	
	Execution:
	Should only be executed on server/host player.
	
	Parameter(s):
	0	_marker - STRING: Marker used as town centre.
	1	_radius - NUMBER: Maximum distance civ can be spawned from marker.
	2	_range - NUMBER: Distance after which civ is deleted if no players are nearby.
	
	Returns:
	NONE
	
***/

params [
	["_marker", "", [""]],
	["_radius", 50, [0]],
	["_range", 1000, [0]]
];

#include "civTypes.hpp"

_classname = selectRandom _civTypes;
	
_spawnPos = [getMarkerPos _marker, 0, _radius, 5, 0] call BIS_fnc_findSafePos;			
_grp = createGroup civilian;	
_civ = _grp createUnit [_classname, _spawnPos, [], 0, "NONE"];
				
_wp1 = _grp addWaypoint [[getMarkerPos _marker, random _radius, random 360] call BIS_fnc_relPos, 0];
_wp2 = _grp addWaypoint [[getMarkerPos _marker, random _radius, random 360] call BIS_fnc_relPos, 0];
_wp3 = _grp addWaypoint [[getMarkerPos _marker, random _radius, random 360] call BIS_fnc_relPos, 0];
//_wp4 = _grp addWaypoint [[getMarkerPos _marker, random _radius, random 360] call BIS_fnc_relPos, 0];
		
{
	_x setWaypointBehaviour "SAFE";
	_x setWaypointSpeed "LIMITED";
	_x setWaypointType "MOVE";
} forEach [_wp1,_wp2,_wp3];
		
_wp3 setWaypointType "CYCLE";

[_civ, _range] spawn TFD_fnc_handleCivDeletion;
			