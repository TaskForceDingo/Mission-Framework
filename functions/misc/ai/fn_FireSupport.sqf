/*
	Author: TheTimidShade

	Description:
		Simple artillery script.

	Parameters:
		0: OBJECT - Artillery unit performing the fire support
		1: ARRAY/POSITION - Target position, shots will be centered around this point
		2: NUMBER (OPTIONAL) - Radius of shot spread around centre position (not including dispersion after firing)
		3: NUMBER (OPTIONAL) - Number of rounds to fire in barrage
		4: NUMBER (OPTIONAL) - Length in seconds of pause between each shot, must be at least 3 seconds
		5: STRING (OPTIONAL) - Type of round used for fire support, if not provided or "" uses first available round
		
	Returns:
		NONE

	Example:
		If you want to use this in a trigger set it to server only and do:
		[myMortar, getMarkerPos "artilleryMarker", 50, 8, 5, "8Rnd_82mm_Mo_Smoke_white"] spawn TFD_fnc_FireSupport;

		If using this from a script do:
		[myMortar, getMarkerPos "artilleryMarker", 50, 8, 5, "8Rnd_82mm_Mo_Smoke_white"] remoteExec ["TFD_fnc_FireSupport", myMortar, false];
*/

params [
	["_unit", objNull, [objNull]],
	["_targetPos", [], [[]], [2,3]],
	["_spread", 0, [0]],
	["_numRounds", 1, [0]],
	["_waitBetweenRounds", 5, [0]],
	["_ammoType", "", [""]]
];

// validate params
if (isNull _unit) exitWith {};
if (_targetPos isEqualTo [] || count _targetPos < 2) exitWith {};
if (count _targetPos < 3) then {_targetPos set [2, 0];};
if (_spread < 0) then {_spread = abs _spread};
_numRounds = round _numRounds;
if (_waitBetweenRounds < 0) then {_waitBetweenRounds = abs _waitBetweenRounds};
if (_waitBetweenRounds < 3) then {_waitBetweenRounds = 3};
if (_ammoType == "") then {_ammoType = (magazines _unit)#0};

if (_unit getVariable ["TFD_fireSupportActive", false]) exitWith {};

_unit setVariable ["TFD_fireSupportActive", true, true];
for "_i" from 1 to _numRounds do {
    private _shotPos =  [(_targetPos#0) + (_spread * sin (random 360)), (_targetPos#1) + (_spread * sin (random 360)), _targetPos#2];
	[_unit, [_shotPos , _ammoType, 1]] remoteExec ["doArtilleryFire", _unit, false];
    sleep _waitBetweenRounds;
};
_unit setVariable ["TFD_fireSupportActive", false, true];