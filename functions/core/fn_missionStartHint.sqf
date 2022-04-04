/*
	Author: TheTimidShade

	Description:
		Pops up a summary message when the player joins after the intro has finished playing.

	Parameters:
		NONE
		
	Returns:
		NONE

*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["ENABLE_SUMMARY_HINT", false])) exitWith {};
if (missionNamespace getVariable ["ENABLE_INTRO", false]) then { waitUntil {missionNamespace getVariable ["INTRO_DONE", false]}; }; // Wait until intro is completed

sleep 5;

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
				hint parseText "<br/>If you need to contact TFD staff during the mission, press the <t font='PuristaSemiBold' color='#fab03f'>'PAUSE BREAK'</t> key.<br/><br/>You can change this keybind in your CBA options.";
			};
		}];
	};
} forEach TFD_ORBAT;

TFD_DEBUG_MISSION_START_HINT_COMPLETE = true;

};