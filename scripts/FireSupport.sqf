/*
Fire support of artillery/mortar unit. Use where unit is local.

	Select 0 - OBJECT: Artillery unit
	Select 1 - ARRAY or OBJECT or MARKER: Target position ([x,y,z] or Object or "Marker")
	Select 2 - STRING: Magazine (if left empy, first magazine available will be used)
	Select 3 - NUMBER: Radius
	Select 4 - NUMBER: Number of rounds to be fired
	Select 5 - NUMBER or ARRAY: Delay between rounds - use either #x for precise timing or [#x,#y] for setting min and max delay. 5 seconds is minimum.
	Select 6 - (OPTIONAL) CODE: Condition to end bombardment before all rounds are fired
	Select 7 - (OPTIONAL) NUMBER: Safezone radius - minimal distance from the target position where shells may be directed at

	EXAMPLE 1: _bombardment = [BIS_Mortar,[3600,3600,0],"",100,24,10] execVM "scripts\FireSupport.sqf"
	EXAMPLE 2: _bombardment = [BIS_Mortar,BIS_Player,"8Rnd_82mm_Mo_shells",100,24,10] execVM "scripts\FireSupport.sqf"
	EXAMPLE 3: _bombardment = [BIS_Mortar,"BIS_mrkTargetArea","8Rnd_82mm_Mo_shells",100,24,10,{BIS_Player distance BIS_EscapeZone < 100}] execVM "scripts\FireSupport.sqf"
	EXAMPLE 4: _bombardment = [BIS_Mortar,BIS_Player,"8Rnd_82mm_Mo_shells",100,24,10,{dayTime > 20},50] execVM "scripts\FireSupport.sqf"
	EXAMPLE 5: _bombardment = [BIS_Mortar,BIS_Victim,"8Rnd_82mm_Mo_shells",100,24,[5,10],{dayTime > 20},50] execVM "scripts\FireSupport.sqf"
*/

// Params
	params
	[
		["_unit",objNull,[objNull]],
		["_position",objNull,[objNull,[],""]],
		["_magazine","",[""]],
		["_radius",50,[999]],
		["_limit",10,[999]],
		["_delay",10,[999,[]]],
		["_condition",{false},[{}]],
		["_safeZone",0,[999]]
	];

// If magazine param is left empty, use first one available
	If (_magazine == "") Then {_magazine = (getArtilleryAmmo [_unit] select 0)};

// Check for validity
	If (isNull _unit) ExitWith {["ARTILLERY SUPPORT: Non-existing unit %1 for support used!",_unit] call BIS_fnc_logFormat};
	If (_unit getVariable "BIS_FireSupport" == 1) ExitWith {["ARTILLERY SUPPORT: %1 is already providing fire support!",_unit] call BIS_fnc_logFormat};
	If ((_position isEqualType "") and {getMarkerType _position == ""}) ExitWith {["ARTILLERY SUPPORT: Non-existent marker %1 for barrage for %2 used!",_position,_unit] call BIS_fnc_logFormat};
	If ((_position isEqualType objNull) and {isNull _position}) ExitWith {["ARTILLERY SUPPORT: Non-existent object %1 for barrage for %2 used!",_position,_unit] call BIS_fnc_logFormat};
	If ((_position isEqualType []) and {count _position != 3}) ExitWith {["ARTILLERY SUPPORT: Wrong coordinates %1 for barrage for %2 used!",_position,_unit] call BIS_fnc_logFormat};
	If (!(isClass (configFile >> "CfgMagazines" >> _magazine))) ExitWith {["ARTILLERY SUPPORT: Non-existing classname %1 for artillery ammo for %2 used!",_magazine,_unit] call BIS_fnc_logFormat};
	If !(_magazine in magazines _unit) ExitWith {["ARTILLERY SUPPORT: Unit %1 doesn't have requested ammo %2!",_unit,_magazine] call BIS_fnc_logFormat};
	If (_radius < 0) ExitWith {["ARTILLERY SUPPORT: %1 radius cannot be lower than 0 meters!",_unit] call BIS_fnc_logFormat};
	If (_limit < 1) ExitWith {["ARTILLERY SUPPORT: Unit %1 must fire at least one round!",_unit] call BIS_fnc_logFormat};
	If ((_delay isEqualType 999) and {_delay < 5}) ExitWith {"ARTILLERY SUPPORT: Delay cannot be less than 5 seconds!" call BIS_fnc_log};
	If ((_delay isEqualType []) and {count _delay != 2}) ExitWith {"ARTILLERY SUPPORT: Wrong format of random delay, use [#x,#y]." call BIS_fnc_log};
	If ((_delay isEqualType []) and {_delay select 0 < 5}) ExitWith {"ARTILLERY SUPPORT: Min delay cannot be less than 5 seconds!" call BIS_fnc_log};
	If ((_delay isEqualType []) and {_delay select 1 < 5}) ExitWith {"ARTILLERY SUPPORT: Max delay cannot be less than 5 seconds!" call BIS_fnc_log};
	If ((_delay isEqualType []) and {_delay select 1 < _delay select 0}) ExitWith {"ARTILLERY SUPPORT: Max delay cannot be lower than min delay!" call BIS_fnc_log};
	If (_safeZone < 0) ExitWith {["ARTILLERY SUPPORT: Safezone for %1 cannot be lower than 0!",_unit] call BIS_fnc_logFormat};
	If (_safeZone > _radius) ExitWith {["ARTILLERY SUPPORT: Safezone for %1 cannot be larger than radius!",_unit] call BIS_fnc_logFormat};

	If ((_position isEqualType "") and {!(getMarkerPos _position inRangeOfArtillery [[_unit],_magazine])}) ExitWith {["ARTILLERY SUPPORT: Target %1 is out of range for %2!",_position,_unit] call BIS_fnc_logFormat};
	If ((_position isEqualType objNull) and {!(getPos _position inRangeOfArtillery [[_unit],_magazine])}) ExitWith {["ARTILLERY SUPPORT: Target %1 is out of range for %2!",_position,_unit] call BIS_fnc_logFormat};
	If ((_position isEqualType []) and {!(_position inRangeOfArtillery [[_unit],_magazine])}) ExitWith {["ARTILLERY SUPPORT: Target %1 is out of range for %2!",_position,_unit] call BIS_fnc_logFormat};

// Set variable to be able to check if the unit is firing or not and to prevent running the script multiple times on a single unit
	_unit setVariable ["BIS_FireSupport",1];

// Private variables, set roundsFired to 0
	private ["_roundsFired","_targetPos","_finalPos","_marker","_eta","_minDelay","_maxDelay","_finalDelay"];
	_roundsFired = 0;

// Handle delays
	If (_delay isEqualType 999) Then {_minDelay = _delay; _maxDelay = _delay};
	If (_delay isEqualType []) Then {_minDelay = _delay select 0; _maxDelay = _delay select 1};

// Get ETA and log the action
	If (_position isEqualType "") Then {_eta = getMarkerPos _position};
	If (_position isEqualType objNull) Then {_eta = getPos _position};
	If (_position isEqualType []) Then {_eta = _position};

	["ARTILLERY SUPPORT: Unit %1 providing fire support, target: %2 ETA: %3",_unit,_position,_unit getArtilleryETA [_eta, _magazine]] call BIS_fnc_logFormat;

// Fire support
	While
		{
			(alive _unit) and
			(canFire _unit) and
			(_roundsFired < _limit)
		}
	Do
		{
			// If the condition is triggered, stop the barrage
			If (!(isNil _condition) and (_condition)) ExitWith {["ARTILLERY SUPPORT: Condition to end bombardment for unit %1 activated.",_unit] call BIS_fnc_logFormat};

			// Getting the position - done each time to be able to track moving targets
			If (_position isEqualType "") Then {_targetPos = getMarkerPos _position};
			If (_position isEqualType objNull) Then {_targetPos = getPos _position};
			If (_position isEqualType []) Then {_targetPos = _position};

			// Selecting the final position where the AI should fire
			_finalPos = [_targetPos,(random (_radius - _safeZone)) + _safeZone, random 360] call BIS_fnc_relPos;
			_unit commandArtilleryFire [_finalPos,_magazine,1];
			_roundsFired = _roundsFired + 1;
                        _unit setVehicleAmmo 1;

			// Debug - create marker at each target position
                        // _targetMarker = createMarker [format ["Marker%1",(random 999999)],_finalPos];
                        // _targetMarker setMarkerType "Mil_Warning";
                        // _targetMarker setMarkerColor "ColorRed";

			_finalDelay = _minDelay + (random (_maxDelay - _minDelay));
			sleep _finalDelay;
		};

	If !(alive _unit) Then {["ARTILLERY SUPPORT: %1 - fire mission canceled, unit was destroyed.",_unit] call BIS_fnc_logFormat; _unit setVariable ["BIS_FireSupport",nil];};
	If (!(canFire _unit) and (damage _unit < 1) and (alive gunner _unit)) Then {["ARTILLERY SUPPORT: %1 - fire mission cancled, unit can no longer fire.",_unit] call BIS_fnc_logFormat};
	If (!(alive gunner _unit) and (alive _unit)) Then {["ARTILLERY SUPPORT: %1 - fire mission cancled, gunner was killed.",_unit] call BIS_fnc_logFormat};
	If !(_roundsFired < _limit) Then {["ARTILLERY SUPPORT: %1 - fire mission finished, shell limit:%2 reached.",_unit,_limit] call BIS_fnc_logFormat};

// Unit is available for another fire support
	_unit setVariable ["BIS_FireSupport",0];
