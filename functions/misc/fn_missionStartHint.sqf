params ["_orbat","_name","_role"];

{
	if (_name in _x) then {
		_channel = (_x select 1);
		"Attention" hintC [
			if ( player == s_1 ) then {
				"You are the mission commander.";
			} else {
				format[ "Mission commander is %1." , name s_1 ];
			},
			format[ "You are in squad %1." , (_x select 0) ],				
			if (name leader group player == name player) then {
				"You are the leader of your group, please report to the command area for briefing.";
			} else {
				format[ "Your group leader is %1, please wait in your rally area until the mission begins." , (name leader group player) ];
			},
			format[ "Your SR channel is %1." , _channel],
			"LR comms are channel 1." //Edit here if neccessary to define LR channels.
		];
		
		hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
			0 = _this spawn {
				_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
				hintSilent "";
			};
		}];
	};
} forEach _orbat;