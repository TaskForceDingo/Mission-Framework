params ["_CenterUnit"];
private _Leader = _CenterUnit;	
private _SearchSize = 30;
private _LeaderPos = getposASL _Leader;
private _RtrnA = [];
//If the unit is not far from its previous point, don't bother recalculating.
private _VarCheck = (group _CenterUnit) getVariable ["GEN_GridArray",[[0,0,0],[]]];

private _LGroup = group _leader;
private _CurrentWaypoint = currentWaypoint _LGroup;
private _wPos = waypointPosition [_LGroup,_CurrentWaypoint];
[_LGroup, _CurrentWaypoint] setWaypointCompletionRadius 75;
if !(_wPos isEqualTo [0,0,0]) then
{
	private _enemylist = allunits select {[(side _Leader),(side _x)] call BIS_fnc_sideIsEnemy};
	private _ClosestE = [_enemylist,_Leader] call BIS_fnc_nearestPosition;
	private _Distance = linearConversion [10,1000,(_ClosestE distance2D _Leader),15,100,true];
	private _CoverPosition = _LeaderPos getPos [_Distance,(_LeaderPos getdir _wPos)];
	private _CoverObjs = nearestTerrainObjects [_CoverPosition, ["TREE","SMALL TREE","BUSH","WALL","FENCE","ROCK","HOUSE"], _SearchSize,false,true];
	_RtrnA = [(getPosASL _CenterUnit),_CoverObjs,_wPos];
	(group _CenterUnit) setVariable ["GEN_GridArray",_RtrnA];
};



_RtrnA