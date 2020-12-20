params [
	["_zone", objNull, [objNull, ""]],
	["_numUnits", 0, [0]],
	["_classGroupID", 0, [0]],
	["_allowMovement", true, [false]],
	["_customLoadout", false, [true]]
];

if (!isServer) exitWith {}; // make sure script is not firing on clients

#include "unitTypes.hpp" // get unit types from header

_isTrigger = true;
if (typeName _zone == "STRING") then {
	_isTrigger = false;
};

if ((_isTrigger && _zone isEqualTo objNull) || _zone isEqualTo "") then {["No zone provided for garrison, exiting"] remoteExec ["systemChat", 0, false]};
if (_numUnits <= 0) then {["Number of units in garrison cannot be 0 or negative, exiting"] remoteExec ["systemChat", 0, false]};

// get the maximum distance from the trigger/marker
_maxDist = 0;
if (_isTrigger) then {
	_triggerSize = triggerArea _zone;
	_maxDist = (_triggerSize select 0) max (_triggerSize select 1);
}
else {
	_markerSize = getMarkerSize _zone;
	_maxDist = (_markerSize select 0) max (_markerSize select 1);
};
if (_maxDist <= 0) exitWith {["Garrison trigger/marker has invalid size, exiting"] remoteExec ["systemChat", 0, false]};

// find all buildings within the max distance and get all their garrison positions
_pos = [0,0];
if (_isTrigger) then {
	_pos = getPos _zone;
}
else {
	_pos = getMarkerPos _zone;
};

_garrisonPositions = [];
_nearbyBuildings = _pos nearObjects ["House", _maxDist + 10];
{
	_positions = [_x] call BIS_fnc_buildingPositions;
	{
		if (_x inArea _zone) then { // only add positions that are within trigger/marker
			_garrisonPositions pushBackUnique _x;
		};
	} forEach _positions;
} forEach _nearbyBuildings;

// if the number of positions is smaller than the number of units, discard extra units
_numPositions = count _garrisonPositions;
if (_numPositions < _numUnits) then {
	_numUnits = _numPositions;
};

// get unit types and side based off parameters
_unitGroupInfo = _unitClasses select _classGroupID;
_unitSide = _unitGroupInfo select 0;
_unitTypes = _unitGroupInfo select 1;

_grp = createGroup _unitSide; // create a group for the garrison

for "_i" from 1 to _numUnits do {
	// generate a random position from available positions and remove from array
	_positionI = floor random _numPositions;
	_position = _garrisonPositions deleteAt _positionI;
	_numPositions = _numPositions - 1;

	_unit = _grp createUnit [selectRandom _unitTypes, _position, [], 0, "CAN_COLLIDE"];
	_unit setDir (random 360);
	_unit setPosATL _position;
	doStop _unit;
	if (!_allowMovement) then {
		_unit disableAI "MOVE";
	};

	if (_customLoadout) then {
		[_unit] spawn TFD_fnc_gar_customLoadout;
	};

	sleep 0.3;
};

[_grp, _zone, _allowMovement, _customLoadout, _unitSide] spawn TFD_fnc_gar_cacheGroup;












