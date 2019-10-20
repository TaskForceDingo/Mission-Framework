/***
	
	'TFD_fnc_handleCivDeletion'
	
	Author: TheTimidShade
	
	Description:
	Handles deletion of CIV unit after players get too far away.
	
	Execution:
	Should only be executed on server/host player.
	
	Parameter(s):
	0	_civ - OBJECT: Unit passed to handler.
	1	_range - NUMBER: Distance before unit is deleted.
	
	Returns:
	NONE
	
***/

params [
	["_civ", objNull, [objNull]],
	["_range", 0, [0]]
];

while {!isNull _civ} do {
	_inRangeArray = [];
	
	{
		if ((_x distance _civ) < _range) then {
			_inRangeArray pushBackUnique true;
		}
		else {
			_inRangeArray pushBackUnique false;
		};
	} forEach allPlayers;
	
	if (!(true in _inRangeArray)) then {
		deleteVehicle _civ;
	};
	
	sleep 10;
};