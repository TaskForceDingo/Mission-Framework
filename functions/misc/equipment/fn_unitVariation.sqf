/*
	Author: TheTimidShade

	Description:
		Randomises the provided unit using the equipment/face/voice from the arrays defined below.

	Parameters:
		NONE
		
	Returns:
		NONE
*/

// change these to enable/disable functionality
private _randomHelmet = false;
private _randomFacewear = false;
private _randomFace = false;
private _randomSpeaker = false;

// classnames of random options, putting "" in will mean there is a chance for no helmet/facewear (can't have no face)
private _helmets = [];
private _facewear = [];
private _faces = []; // face classnames
private _speakers = []; // voices used for shouts

private _blacklist = ["s_n", "s_n"]; // unit var names in here will not be randomised

// DON'T EDIT BELOW HERE

params ["_unit"];

if ((vehicleVarName _unit) in _blacklist) exitWith {};

sleep 0.5;

if (_randomHelmet) then {
	removeHeadgear _unit;
	_helmet = selectRandom _helmets;
	if (_helmet != "") then {_unit addHeadgear _helmet;};
};

if (_randomFacewear) then {
	removeGoggles _unit;
	_goggles = selectRandom _facewear;
	if (_goggles != "") then {_unit addGoggles _goggles;};
};

if (_randomFace) then {[_unit, selectRandom _faces] remoteExec ["setFace", 0, _unit];};
if (_randomSpeaker) then {[_unit, selectRandom _speakers] remoteExec ["setSpeaker", 0, _unit];};