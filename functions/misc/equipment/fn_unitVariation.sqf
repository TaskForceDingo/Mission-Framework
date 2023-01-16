/*
	Author: TheTimidShade

	Description:
		Randomises player units

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["ENABLE_LOADOUT_RANDOMISATION", false]) || (vehicleVarName player) in (missionNamespace getVariable ["LOADOUT_RANDOMISATION_BLACKLIST", []])) exitWith {};

// Check to make sure variables exist
if (isNil "RANDOM_HEADGEAR") then {RANDOM_HEADGEAR = [];};
if (isNil "RANDOM_FACEWEAR") then {RANDOM_FACEWEAR = [];};
if (isNil "RANDOM_FACES") then {RANDOM_FACES = [];};

private ["_equipment"];
if (count RANDOM_HEADGEAR > 0) then {
	removeHeadgear player;
	_equipment = selectRandom RANDOM_HEADGEAR;
	if (_equipment != "") then {player addHeadgear _equipment;};
};

if (count RANDOM_FACEWEAR > 0) then {
	removeGoggles player;
	_equipment = selectRandom RANDOM_FACEWEAR;
	if (_equipment != "") then {player addGoggles _equipment;};
};

if (count RANDOM_FACES > 0) then {
	[player, selectRandom RANDOM_FACES] remoteExec ["setFace", 0, player];
};

TFD_DEBUG_UNIT_VARIATION_COMPLETE = true;

};