/**
*	fn_garrisonBuildings.sqf";
*	
*	- populates the buildings inside the area of the given marker with
*	defined unit types and side.
*	
*	Params:
*	_trigger (STRING) - the name of the trigger being used to define the garrison area
*	_density (INT 0-100) - the chance (percentage) of a unit spawning at each building position
*	_typeID (INT) - which set of classnames should be used to populate the selected area
*
*	e.g. [spawnTriggerOne, 50, 0] execVM "scripts\garrison\fn_garrisonBuilding.sqf"
*   - garrisons all buildings within the trigger 'spawnTriggerOne' with a 50% chance for each position
*	using unit set 0 (first set)
*
*	Domain:
*	Server
**/

//Get the defined unit types in unitTypes.hpp
#include "unitTypes.hpp"

//Make sure the script is only every activated on the server (localhost or dedicated)
if (isServer) then {

	//Get params
	_trigger = _this select 0;
	_density = _this select 1;
	_typeID = _this select 2;

	if (isNil "_density" or _density == 0) exitWith {systemChat "Spawn percentage is 0!"};

	_side = (_UNIT_SETS select _typeID) select 0;
	_UNIT_TYPES = (_UNIT_SETS select _typeID) select 1;

	//Check to make sure unit set is valid
	if (!isNil "_UNIT_TYPES") then {
		
		//Get buildings within 1km
		_buildings = nearestObjects [getPos _trigger, ["House"], 1000, true]; //If you need to garrison an area bigger than 1000m change this value to a larger one, this is simply to improve performance
		
		{
			//Check if building is in marker area
			if (_x inArea _trigger) then {
				
				//Get building positions
				_positions = [_x] call BIS_fnc_buildingPositions;
			
				{
					//Check if position is also in trigger (units will only spawn in trigger boundaries)
					if (_x inArea _trigger) then {
						
						_spawnChance = random 100;
						
						if (_spawnChance <= _density) then {
							
							_classname = selectRandom _UNIT_TYPES;
							_grp = createGroup _side;
							
							_unit = _grp createUnit [_classname, _x, [], 0, "CAN_COLLIDE"];
							_unit setDir round (random 360);
							_unit setPosATL _x;
							
						};
					
					sleep 0.1;
					
					};
					
				} forEach _positions;
				
			};
			
		} forEach _buildings;
		
	}
	else{
		_message = format ["Invalid unit set used for trigger '%1'!", _trigger];
		systemChat _message;
	};

};
