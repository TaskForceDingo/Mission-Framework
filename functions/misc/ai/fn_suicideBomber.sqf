/*
    Author: TheTimidShade

    Description:
        Converts a unit into a suicide bomber. The bomber can target a specific object, or if no target is provided, the nearest enemy unit within the specified target range will be targeted.
        Uses explosion types from TFD_fnc_explosion.

        Needs to be executed on the server.

    Parameter(s):
        0: OBJECT - The unit to convert to a suicide bomber.
        1: STRING (OPTIONAL) - The explosion size to use for the bomb. Default: "IED_SM"
        2: BOOL (OPTIONAL) - Whether or not the bomber will detonate the explosives when they are shot. Default: false
        3: NUMBER (OPTIONAL) - The distance in metres from a target the bomber will detonate the explosive at. Default: 8
        4: NUMBER/OBJECT (OPTIONAL) - Default: 300
            NUMBER - Represents the maximum range in metres the bomber will attempt to search for targets. Only targets units known about by the bomber's side.
            OBJECT - Represents the target that the bomber will try to detonate near. The bomber will move towards this target regardless of the distance.

    Returns:
        NONE

    Examples:

        // Create a suicide bomber that will try to detonate their explosives close to the 'hq_building' object
        [this, "IED_SM", false, hq_building] spawn TFD_fnc_suicideBomber;

        // Create a suicide bomber that will search for targets within 500m and will explode when shot
        [this, "IED_LG", true, 500] spawn TFD_fnc_suicideBomber;
*/

if (!isServer) exitWith {};

params [
    ["_bomber", objNull, [objNull]],
    ["_explosionType", "IED_SM", [""]],
    ["_deadman", false, [true]],
    ["_targetDistance", 8, [0]],
    ["_target", 300, [0, objNull]]
];

if (isNull _bomber) exitWith {
    ["No unit provided"] call BIS_fnc_error;
};

private _targetObj = objNull;
private _targetSearchDistance = -1;
if (typeName _target == "OBJECT") then {
    _targetObj = _target;
} else {
    _targetSearchDistance = _target;
};

// Add bomb vest
removeVest _bomber;
_bomber addVest "V_HarnessOGL_brn";

// Disable AI features
{
    _bomber disableAI _x;
} forEach ["AUTOTARGET", "AUTOCOMBAT"];

// Add EH to trigger explosion when unit is damaged/killed
if (_deadman) then {   
    _bomber addEventHandler ["Hit", {
        params ["_unit", "_source", "_damage", "_instigator"];
        _unit setVariable ["TFD_BOMBER_DETONATED", true, true];
    }];
    _bomber addEventHandler ["Killed", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        _unit setVariable ["TFD_BOMBER_DETONATED", true, true];
    }];
};

// !!! TODO: Instead, use variable on bomber to hold target and check distance to that

// Start loop to detonate the bomb when getting close to the target
if (!isNull _targetObj) then {
    [_bomber, _targetObj, _targetDistance] spawn {
        params ["_bomber", "_targetObj", "_targetDistance"];
        
        waitUntil { sleep 0.2; (_bomber distance _targetObj) <= _targetDistance };
        _bomber setVariable ["TFD_BOMBER_DETONATED", true, true];
    };
};

// Start loop to trigger the detonation when the TFD_BOMBER_DETONATED var is set
[_bomber, _explosionType] spawn {
    params ["_bomber", "_explosionType"];
    
    waitUntil { 0.2; _bomber getVariable ["TFD_BOMBER_DETONATED", false] };
    "BloodPool_01_Large_New_F" createVehicle (position _bomber);
    [_explosionType, _bomber, true] call TFD_fnc_explosion;
    _bomber setDamage 1;
};

private _startingPosiion = getPos _bomber;
while { sleep 1; alive _bomber } do {

    private _nearbyTargets = [_bomber, _targetSearchDistance] call BIS_fnc_enemyTargets;
    _nearbyTargets = [_nearbyTargets, [_bomber], { _input0 distance2D _x }, "ASCEND"] call BIS_fnc_sortBy;
    
    // WIP

};