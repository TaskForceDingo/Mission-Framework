params [
	["_swDisabled", false, [true]]
];

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
				if (!_swDisabled) then {
					format[ "Your SR channel is channel %1." , _channel];
				}
				else {
					"SR radios are disabled.";
				},
				"LR comms are channel 50 (Platoon Net) and channel 51 (Air Net)." //Edit here if neccessary to define LR channels.
			];
		
		hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
			0 = _this spawn {
				_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
				hintSilent "";
			};
		}];
	};
} forEach TFD_ORBAT;