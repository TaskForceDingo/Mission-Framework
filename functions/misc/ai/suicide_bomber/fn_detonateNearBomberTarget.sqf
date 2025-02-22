/*
    Author: TheTimidShade

    Description:
        Loop to check if the suicide bomber is close enough to it's target to detonate.

        Needs to be executed on the server.

    Parameter(s):
        0: OBJECT - The suicide bomber unit.
        1: NUMBER - The distance the suicide bomber must be to the target to detonate.
      
    Returns:
        NONE

    Example:
        [bomber, 8] spawn TFD_fnc_detonateNearBomberTarget;
*/

if (!isServer) exitWith {};

params [
    ["_bomber", objNull, [objNull]],
    ["_targetDistance", 8, [0]]
];

if (isNull _bomber) exitWith {
    ["Bomber unit is null"] call BIS_fnc_error;
};

while {sleep 0.2; alive _bomber && !(_bomber getVariable ["TFD_BOMBER_DETONATED", false])} do {
    private _target = _bomber getVariable ["TFD_BOMBER_TARGET", objNull];

    // If the bomber has a valid target and is within range, detonate the bomb
    if (!isNull _target && { _bomber distance _target <= _targetDistance }) then {
        _bomber setVariable ["TFD_BOMBER_DETONATED", true, true];
    };
};