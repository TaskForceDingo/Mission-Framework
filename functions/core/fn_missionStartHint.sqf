/*
	Author: TheTimidShade

	Description:
		Pops up a summary message when the player joins after the intro has finished playing.

	Parameters:
		NONE
		
	Returns:
		NONE

*/

sleep 5;

waitUntil {!(missionNameSpace getVariable ["BIS_fnc_establishingShot_playing", false])}; // Wait until establishing shot has stopped playing

_name = format ["%1", player];

{
	if (_name in _x) then {
		_channel = (_x select 1);
		"Attention" hintC [
			if (isNil "s_1") then {
				"There is no commander.";
			}
			else {
				if (player == s_1) then {
					"You are the mission commander.";
				}
				else {
					format[ "Mission commander is %1." , name s_1 ];
				}
			},
			format[ "You are in %1." , (_x select 0) ],				
			if (leader group player == player) then {
					"You are the leader of your group, please report to command for briefing.";
				}
				else {
					format[ "Your group leader is %1, please wait in your rally area until the mission begins." , (name leader group player) ];
				},
				if (TFD_USING_SR) then {
					format[ "Your SR channel is channel %1." , _channel];
				}
				else {
					"There are no SR radios.";
				},
				"Primary LR comms are channel 1. See ORBAT for other channels."
			];
		
		hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
			0 = _this spawn {
				_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
				hintSilent "";
			};
		}];
	};
} forEach TFD_ORBAT;