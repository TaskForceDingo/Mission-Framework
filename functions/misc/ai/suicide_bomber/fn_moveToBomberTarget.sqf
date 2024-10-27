/*
    Author: TheTimidShade

    Description:
        Continously move the suicide bomber to it's target.

        Needs to be executed where the suicide bomber unit is local.

    Parameter(s):
        0: OBJECT - The suicide bomber unit.
      
    Returns:
        NONE

    Example:
        [bomber] remoteExec ["TFD_fnc_moveToBomberTarget", bomber, false];
*/

params [
    ["_bomber", objNull, [objNull]]
];

// If bomber is not local, execute where bomber is local
if (!local _bomber) exitWith {
    [_bomber] remoteExec ["TFD_fnc_moveToBomberTarget", _bomber, false];
};

while {alive _bomber} do {
    private _target = _bomber getVariable ["TFD_BOMBER_TARGET", objNull];

    if (!isNull _target) then {
        _bomber move (position _target);
    };

    sleep 0.5;
};
