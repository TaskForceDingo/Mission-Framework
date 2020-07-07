/*
By [TFD] Jam Toast - edited by Imperator - fixed by JohnnyShootos
This handles the starting message that informs players of their squad/radio channel etc
*/

/*
	e.g. [_showMissionStartHint, _swDisabled, _setAdditional] call TFD_fnc_setRadio
		
	0 _showMissionStartHint - Whether or not hint is displayed on screen showing radio/commander information.
	1 _swDisabled - Disables assignment of radio channels to SR radios (allows script to finish if no radios given)
	2 _setAdditional - Whether or not additional channel is assigned to squad leaders (command channel)
*/

params [
	["_showMissionStartHint", true, [true]],
	["_swDisabled", false, [true]],
	["_setAdditional", false, [true]]
];

_name = format ["%1", player];

if (!_swDisabled) then {
	{
		if (_name in _x) then {
		
			_channel = (_x select 1);
			waitUntil {[] call TFAR_fnc_haveSWRadio};
			// Channels are 0 indexed so must be _channel - 1
			[(call TFAR_fnc_activeSwRadio), _channel - 1] call TFAR_fnc_setSwChannel;
			
			//Setup additional channel + stereo for SL (if they are not in command team)
			if (_setAdditional) then {
				if ((leader group player == player) && _channel != 8) then {
					[(call TFAR_fnc_activeSwRadio), 7] call TFAR_fnc_setAdditionalSwChannel;
					
					//Primary channel left
					[(call TFAR_fnc_ActiveSwRadio), 1] call TFAR_fnc_setSwStereo;
					//Additional channel right
					[(call TFAR_fnc_ActiveSWRadio), 2] call TFAR_fnc_setAdditionalSwStereo;
				};
			};
			
			sleep 0.5;
		};			
	}  forEach TFD_ORBAT;
};

if (usingEstablishingShot) then {
	waitUntil {!isNil "BIS_fnc_establishingShot_playing" && {!BIS_fnc_establishingShot_playing}}; // Wait until establishing shot has stopped playing
};

if (_showMissionStartHint) then {
	[_swDisabled] spawn TFD_fnc_missionStartHint;
};
