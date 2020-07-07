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

waitUntil {time > 0};

// cycle through all non-player civilian units and add event handler
while {CIVPUNISH_PUNISHCIVS} do {
	{
		if (!(isPlayer _x) && side _x == civilian && isNil {_x getVariable "CIV_PUNISH_DONE"}) then {
			_x setVariable ["CIV_PUNISH_DONE", true, true];
			
			_x addEventHandler ["Killed", {
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				
				if (isNull _killer) then {
					_killer = _unit getVariable ["ace_medical_lastDamageSource", objNull];
				};

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
		
	} forEach allUnits;

	if (_killLimit >= 0 && PLAYER_CIV_KILLS >= _killLimit) then {
		"CIVFAIL" spawn BIS_fnc_endMissionServer; // fail mission
		CIVPUNISH_PUNISHCIVS = false;
	};

	sleep 5;
};