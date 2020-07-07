params [
	["_enforceUniform", true, [true]],
	["_enforceVest", false, [true]],
	["_enforceHelmet", false, [true]],
	["_unitWhitelist", [], [[]]],
	["_gearWhitelist", [], [[]]]
];

sleep 30; // wait 30 seconds after player joins
ENFORCE_UNIFORM = true;

// define starting equipment
_startUniform = uniform player;
_startVest = vest player;
_startHelmet = headgear player;

/*
systemChat ("uniform: " + str _startUniform);
systemChat ("vest: " + str _startVest);
systemChat ("helmet: " + str _startHelmet);
hint str _unitWhitelist;
*/

while {alive player && !(player in _unitWhitelist) && ENFORCE_UNIFORM} do {
	// test uniform
	if (_enforceUniform && uniform player != _startUniform && !(uniform player in _gearWhitelist)) then {
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
	if (_enforceVest && vest player != _startVest && !(vest player in _gearWhitelist)) then {
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
	if (_enforceHelmet && headgear player != _startHelmet && !(headgear player in _gearWhitelist)) then {
		// remove and replace helmet
		removeHeadgear player;
		player addHeadgear _startHelmet;
	};

	sleep 3;
};

ENFORCE_UNIFORM = false;