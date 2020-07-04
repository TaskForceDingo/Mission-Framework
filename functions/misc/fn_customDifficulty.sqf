_aimingAccuracy = 0.4;
_aimingShake = 0.5;
_aimingSpeed = 0.3;
_spotDistance = 0.3;
_spotTime = 0.4;
_courage = 0.6;
_reloadSpeed = 0.5;
_commanding = 0.6;
_general = 0.4;

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