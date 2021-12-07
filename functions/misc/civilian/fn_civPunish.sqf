/*
	Author: TheTimidShade

	Description:
		Handles player punishment for killing civilians, called from init.sqf

	Parameters:
		0: BOOL (OPTIONAL) - True to show message in chat when a player kills a civilian. Default: true
		1: NUMBER (OPTIONAL) - If this number is anything other than -1, the mission will fail after this many civilians are killed. Default: -1
		2: BOOL (OPTIONAL) - True to kick players to lobby when a number of civilians are killed. The number is determined by the next parameter. Default: false
		3: NUMBER (OPTIONAL) - If the player kills this many civilians they will be kicked to the lobby. Default: 2
		
	Returns:
		NONE

*/

params [
	["_showKillMessage", true, [true]],
	["_killLimit", -1, [0]],
	["_punishPlayers", false, [true]],
	["_killsToKick", 2, [0]]
];

if (!isServer) exitWith {};

CIVPUNISH_PUNISHCIVS = true;

// define publicVariables
PLAYER_CIV_KILLS = 0;
CIVPUNISH_SHOWMESSAGE = _showKillMessage;
CIVPUNISH_PUNISHPLAYERS = _punishPlayers;
CIVPUNISH_KICK = _killsToKick;
{publicVariable _x} forEach ["PLAYER_CIV_KILLS", "CIVPUNISH_SHOWMESSAGE", "CIVPUNISH_PUNISHPLAYERS", "CIVPUNISH_KICK"];

// define local function to use
_TFD_fnc_registerCivilian = {
	params ["_unit"];
	_unit setVariable ["CIV_PUNISH_DONE", true, true];
			
	_unit addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		
		_killer = if (isNull _killer) then {
			_unit getVariable ["ace_medical_lastDamageSource", objNull];
		} else {_killer};

		if (isPlayer _killer) then {
			// display message
			if (CIVPUNISH_SHOWMESSAGE) then {
				_message = format ["%1 killed a civilian!", name _killer];
				[_message] remoteExec ["systemChat", 0, false];
			};
			
			// assign penalty to player
			if (CIVPUNISH_PUNISHPLAYERS) then {
				
				_playersCivKills = _killer getVariable ["CIVPUNISH_KILLS", 0];
				_playersCivKills = _playersCivKills + 1;
				_killer setVariable ["CIVPUNISH_KILLS", _playersCivKills];

				// if player kills too many civilians kick to lobby
				if (_playersCivKills >= CIVPUNISH_KICK) then {
					["CIVKICK"] remoteExec ["endMission", _killer, false];
					[] remoteExec ["forceEnd", _killer, false];
				};

			};

			PLAYER_CIV_KILLS = PLAYER_CIV_KILLS + 1;
			publicVariable "PLAYER_CIV_KILLS";
		};
	}];
};

waitUntil {time > 0};

// cycle through all non-player civilian units and add event handler
while {CIVPUNISH_PUNISHCIVS} do {
	{
		private _unit = _x;

		if (!(isPlayer _unit) && side _unit == civilian && !(_unit getVariable ["ACE_isUnconscious", false]) && !(_unit getVariable ["CIV_PUNISH_DONE", false])) then {
			[_unit] spawn _TFD_fnc_registerCivilian;
		};
		
	} forEach allUnits;

	// check agents as well (Civilian Presence Module)
	{
		private _unit = agent _x;
		
		if (!(isPlayer _unit) && side _unit == civilian && !(_unit getVariable ["ACE_isUnconscious", false]) && !(_unit getVariable ["CIV_PUNISH_DONE", false])) then {
			[_unit] spawn _TFD_fnc_registerCivilian;
		};
		
	} forEach agents;

	if (_killLimit >= 0 && PLAYER_CIV_KILLS >= _killLimit) then {
		"CIVFAIL" spawn BIS_fnc_endMissionServer; // fail mission
		CIVPUNISH_PUNISHCIVS = false;
	};

	sleep 5;
};