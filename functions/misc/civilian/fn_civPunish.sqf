/*
	Author: TheTimidShade

	Description:
		Handles player punishment for killing civilians, called from init.sqf

	Parameters:
		NONE
		
	Returns:
		NONE

*/

if (!isServer) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["ENABLE_PUNISH_CIVS", false])) exitWith {};

// Check to make sure variables exist
if (isNil "PUNISH_CIVS_ANNOUNCE_DEATHS") then {PUNISH_CIVS_ANNOUNCE_DEATHS = true;};
if (isNil "PUNISH_CIVS_KILL_LIMIT") then {PUNISH_CIVS_KILL_LIMIT = -1;};
if (isNil "PUNISH_CIVS_KICK_PLAYERS") then {PUNISH_CIVS_KICK_PLAYERS = false;};
if (isNil "PUNISH_CIVS_KILLS_TO_KICK") then {PUNISH_CIVS_KILLS_TO_KICK = 2;};

PUNISH_CIVS_CIV_KILLS = 0;
{publicVariable _x} forEach ["PUNISH_CIVS_CIV_KILLS", "PUNISH_CIVS_KILL_LIMIT", "PUNISH_CIVS_ANNOUNCE_DEATHS", "PUNISH_CIVS_KICK_PLAYERS", "PUNISH_CIVS_KILLS_TO_KICK"];

TFD_DEBUG_CIV_PUNISH_RUNNING = true;

// define local function to use
_TFD_fnc_registerCivilian = {
	params ["_unit"];
	_unit setVariable ["CIV_PUNISH_DONE", true, true];
			
	_unit addMPEventHandler ["MPKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		
		_killer = if (isNull _killer) then {
			_unit getVariable ["ace_medical_lastDamageSource", objNull];
		} else {_killer};

		if (isPlayer _killer) then {
			// display message
			if (PUNISH_CIVS_ANNOUNCE_DEATHS) then {
				_message = format ["%1 killed a civilian!", name _killer];
				systemChat _message;
			};
			
			if (isServer) then {
				if (PUNISH_CIVS_KICK_PLAYERS) then { // assign penalty to player
					_playersCivKills = _killer getVariable ["CIVPUNISH_KILLS", 0];
					_playersCivKills = _playersCivKills + 1;
					_killer setVariable ["CIVPUNISH_KILLS", _playersCivKills, true];

					// if player kills too many civilians kick to lobby
					if (_playersCivKills >= PUNISH_CIVS_KILLS_TO_KICK) then {
						["CIVKICK"] remoteExec ["endMission", _killer, false];
						[] remoteExec ["forceEnd", _killer, false];
					};
				};

				PUNISH_CIVS_CIV_KILLS = PUNISH_CIVS_CIV_KILLS + 1;
				publicVariable "PUNISH_CIVS_CIV_KILLS";
			};
		};
	}];
};

waitUntil {time > 0};

// cycle through all non-player civilian units and add event handler
while {ENABLE_PUNISH_CIVS} do {
	{
		private _unit = _x;

		if (!(_unit isKindOf "CAManBase")) then {continue;};

		if (!(isPlayer _unit) && side _unit == civilian && !(_unit getVariable ["ACE_isUnconscious", false]) && !(_unit getVariable ["CIV_PUNISH_DONE", false])) then {
			[_unit] spawn _TFD_fnc_registerCivilian;
		};
		
	} forEach allUnits;

	// check agents as well (Civilian Presence Module)
	{
		private _unit = agent _x;

		if (!(_unit isKindOf "CAManBase")) then {continue;};
		
		if (!(isPlayer _unit) && side _unit == civilian && !(_unit getVariable ["ACE_isUnconscious", false]) && !(_unit getVariable ["CIV_PUNISH_DONE", false])) then {
			[_unit] spawn _TFD_fnc_registerCivilian;
		};
		
	} forEach agents;

	if (PUNISH_CIVS_KILL_LIMIT >= 0 && PUNISH_CIVS_CIV_KILLS >= PUNISH_CIVS_KILL_LIMIT) then {
		"CIVFAIL" spawn BIS_fnc_endMissionServer; // fail mission
		ENABLE_PUNISH_CIVS = false;
	};

	sleep 5;
};

};