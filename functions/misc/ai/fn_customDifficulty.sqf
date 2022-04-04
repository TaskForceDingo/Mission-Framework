/*
	Author: TheTimidShade

	Description:
		Initialises custom difficulty script, overwrites any skill settings for units created at mission start
		or dynamically via script/zeus

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!isServer) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["ENABLE_CUSTOM_DIFFICULTY", false])) exitWith {};

// Check to make sure variables exist
if (isNil "TFD_CUSTOM_AI_SETTINGS") then {
	TFD_CUSTOM_AI_SETTINGS = [
		0.8,
		0.6,
		0.5,
		0.6,
		0.6,
		0.6,
		0.5,
		0.6,
		0.6
	];
};

TFD_DEBUG_CUSTOM_DIFFICULTY_RUNNING = true;
publicVariable "TFD_DEBUG_CUSTOM_DIFFICULTY_RUNNING";

TFD_CUSTOM_AI_SETTINGS params [
	["_aimingAccuracy", 0.8, [0]],
	["_aimingShake", 0.6, [0]],
	["_aimingSpeed", 0.5, [0]],
	["_spotDistance", 0.6, [0]],
	["_spotTime", 0.6, [0]],
	["_courage", 0.6, [0]],
	["_reloadSpeed", 0.5, [0]],
	["_commanding", 0.6, [0]],
	["_general", 0.6, [0]]
];

while {time >= 0} do {
	{
		if (!(isPlayer _x)) then {
			if (isNil {_x getVariable "CUSTOM_DIFF_SET"}) then {
				
				_x setSkill ["aimingAccuracy", _aimingAccuracy];
				_x setSkill ["aimingShake", _aimingShake];
				_x setSkill ["aimingSpeed", _aimingSpeed];
				_x setSkill ["spotDistance", _spotDistance];
				_x setSkill ["spotTime", _spotTime];
				_x setSkill ["courage", _courage];
				_x setSkill ["reloadSpeed", _reloadSpeed];
				_x setSkill ["commanding", _commanding];
				_x setSkill ["general", _general];
				
				_x setVariable ["CUSTOM_DIFF_SET", true, true];
			};
		};
		
	} forEach allUnits;
	
	sleep 10;
};

};