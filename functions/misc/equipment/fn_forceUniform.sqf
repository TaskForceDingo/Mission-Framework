/*
	Author: TheTimidShade

	Description:
		Initialises forced uniform script

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["ENABLE_GEAR_RESTRICTION", false]) || vehicleVarName player in (missionNamespace getVariable ["GEAR_RESTRICTION_UNIT_WHITELIST", []])) exitWith {};

// Check to make sure variables exist
if (isNil "GEAR_RESTRICTION_FORCE_UNIFORM") then {GEAR_RESTRICTION_FORCE_UNIFORM = false;};
if (isNil "GEAR_RESTRICTION_FORCE_VEST") then {GEAR_RESTRICTION_FORCE_VEST = false;};
if (isNil "GEAR_RESTRICTION_FORCE_HELMET") then {GEAR_RESTRICTION_FORCE_HELMET = false;};
if (isNil "GEAR_RESTRICTION_GEAR_WHITELIST") then {GEAR_RESTRICTION_GEAR_WHITELIST = [];};

TFD_DEBUG_FORCE_UNIFORM_RUNNING = true;

sleep 10;

// Define starting equipment
private _startUniform = uniform player;
private _startVest = vest player;
private _startHelmet = headgear player;

while {alive player && ENABLE_GEAR_RESTRICTION} do {
	// test uniform
	if (GEAR_RESTRICTION_FORCE_UNIFORM && uniform player != _startUniform && !(uniform player in GEAR_RESTRICTION_GEAR_WHITELIST)) then {
		// save contents
		_uniformItems = itemCargo uniformContainer player;
		_uniformMags = magazinesAmmoCargo uniformContainer player;
		
		// remove and replace uniform
		removeUniform player;
		player forceAddUniform _startUniform;

		// add contents of uniform before deletion
		{
			(uniformContainer player) addItemCargo [_x, 1];
		} forEach _uniformItems;
		{
			(uniformContainer player) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
		} forEach _uniformMags;
	};
	
	// test vest
	if (GEAR_RESTRICTION_FORCE_VEST && vest player != _startVest && !(vest player in GEAR_RESTRICTION_GEAR_WHITELIST)) then {
		// save contents
		_vestItems = itemCargo vestContainer player;
		_vestMags = magazinesAmmoCargo vestContainer player;
		
		// remove and replace vest
		removeVest player;
		player addVest _startVest;

		// add contents of vest before deletion
		{
			(vestContainer player) addItemCargo [_x, 1];
		} forEach _vestItems;
		{
			(vestContainer player) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
		} forEach _vestMags;
	};

	// test helmet
	if (GEAR_RESTRICTION_FORCE_HELMET && headgear player != _startHelmet && !(headgear player in GEAR_RESTRICTION_GEAR_WHITELIST)) then {
		// remove and replace helmet
		removeHeadgear player;
		player addHeadgear _startHelmet;
	};

	sleep 3;
};

};