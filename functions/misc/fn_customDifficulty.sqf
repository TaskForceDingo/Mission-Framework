if (!isServer) exitWith {};

//higher value = better
_aimingAccuracy = 0.8; // how good the AI is at hitting what it's aiming at (leading, drop, recoil)
_aimingShake = 0.6; // how steady the AI can keep their weapon
_aimingSpeed = 0.5; // how quickly the AI will rotate to a target and stabilise their aim
_spotDistance = 0.6; // how good is the AI at spotting targets (distance and accuracy of spot)
_spotTime = 0.6; // how quickly the AI responds to information (death, damage, enemies)
_courage = 0.6; // affects morale of other units in squad, higher morale = less likely to flee
_reloadSpeed = 0.5; // how quickly the AI can switch weapons/reload
_commanding = 0.6; // how quickly targets are shared with other AI units in squad
_general = 0.6; // overall base 'skill', higher value means better overall performance in all categories

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