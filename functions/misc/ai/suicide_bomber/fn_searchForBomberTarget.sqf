/*
    Author: TheTimidShade

    Description:
        Continously search for nearby target within a given range, and set the bombing target to the closest one.

        Needs to be executed on the server.

    Parameter(s):
        0: OBJECT - The suicide bomber unit.
        1: NUMBER - The distance the suicide bomber should search for targets within.
      
    Returns:
        NONE

    Example:
        [bomber, 300] spawn TFD_fnc_searchForBomberTarget;
*/

if (!isServer) exitWith {};

params [
    ["_bomber", objNull, [objNull]],
    ["_targetSearchDistance", 300, [0]]
];

private _nearbyTargets = [];
while {alive _bomber} do {
    _nearbyTargets = [_bomber, _targetSearchDistance] call BIS_fnc_enemyTargets;
    _nearbyTargets = [_nearbyTargets, [_bomber], { _input0 distance2D _x }, "ASCEND"] call BIS_fnc_sortBy;
    
    if (count _nearbyTargets > 0) then {
        _bomber setVariable ["TFD_BOMBER_TARGET", _nearbyTargets#0, true];
    } else {
        _bomber setVariable ["TFD_BOMBER_TARGET", objNull, true];
    };

    sleep 5;
};
