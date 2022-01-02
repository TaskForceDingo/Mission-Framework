/*
	Author: TheTimidShade

	Description:
		Initialises custom difficulty script, overwrites any skill settings for units created at mission start
		or dynamically via script/zeus
		Called from init.sqf

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!isServer) exitWith {};

params [
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