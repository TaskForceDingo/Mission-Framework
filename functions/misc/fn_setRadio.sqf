/*
By [TFD] Jam Toast - edited by Imperator - fixed by JohnnyShootos
This handles the starting message that informs players of their squad/radio channel etc
*/
// #include "\task_force_radio\functions\common.sqf";

/*
	The first part of the array is the squad name.  If blueforce tracker is on this is the name that will display on the map.
	The second number in the array is the channel number for short range radios that will be displayed in the hint provided to players upon start.
	The remainder of the array is the units that make up each squad.
	The below are examples, change as neccessary.
	The last group array should NOT have a comma at the end.
	Any changes made here must also be reflected in setpatch.sqf in order to display insignia.

	This script is fired from 

	Want to hide the mission start hint then pass in false in the script call 
		e.g. [false] call TFD_fnc_setRadio
*/

params [
	["_showMissionStartHint", true, [true]]
];

TFD_ORBAT = [
	["Command",	 8,	 "s_1",		"s_2"],
	["Alpha",	 1,	 "s_3",		"s_4","s_5","s_6","s_7","s_8"],
	["Bravo",	 2,	 "s_9",		"s_10","s_11","s_12","s_13","s_14"],
	["Charlie",	 3,	 "s_15",	"s_16","s_17","s_18","s_19","s_20"],
	["Delta",	 4,	 "s_21",	"s_22","s_23","s_24","s_25","s_26"]

];

waitUntil {!isNil "BIS_fnc_establishingShot_playing" && {!BIS_fnc_establishingShot_playing}}; // Wait until establishing shot has stopped playing - this prevents the hint from popping up during the intro shot.

[_showMissionStartHint] spawn {

	_name = format ["%1", player];
	_role =  getText (configFile >> "CfgVehicles" >> typeOf player >> "displayname");
	{
		if (_name in _x) then {
		
			_channel = (_x select 1);
			waitUntil {[] call TFAR_fnc_haveSWRadio};
			// Channels are 0 indexed so must be _channel - 1
			[(call TFAR_fnc_activeSwRadio), _channel - 1] call TFAR_fnc_setSwChannel;		
			sleep 0.5; 
		};
	}  forEach TFD_ORBAT;

	if (leader group player == player) then {
		[(call TFAR_fnc_activeSwRadio), 7] call TFAR_fnc_setAdditionalSwChannel;
	};

	if (_this select 0) then {
		[TFD_ORBAT, _name, _role] spawn TFD_fnc_missionStartHint;
	};

};