/*
	This file handles the config and assignment of radio channels using ACRE.

	You can assign custom labels/frequencies to channels by editing the channel settings below if you choose.
	
	By default, squad names are used for SR channel labels, you can use custom SR labels by setting the second
	parameter to true.
*/

[] spawn {

waitUntil {!isNil "TFD_ORBAT"};

_noProgram = ["ACRE_PRC343", "ACRE_SEM70", "PRC-77"]; // these radios work slightly differently and don't need to be programmed

/* Don't edit below here unless you know what you're changing */

// remove 343 and SEM70 from programming list
_srradios = []; _lrradios = [];
{
	if (!(_x in _noProgram)) then {_srradios pushBackUnique _x};
} forEach TFD_SRRADIOS;
{
	if (!(_x in _noProgram)) then {_lrradios pushBackUnique _x};
} forEach TFD_LRRADIOS;

// define unused channels
_usedSRchannels = []; _usedLRchannels = [];
{_usedSRchannels pushBackUnique (_x#0);} forEach TFD_SR_CHANNELS;
{_usedLRchannels pushBackUnique (_x#0);} forEach TFD_LR_CHANNELS;

// SETUP CONFIG ///////////////////////////////////////////////////////////////////////////////////

_labelField = [
	["ACRE_PRC148", "label"],
	["ACRE_PRC152", "description"],
	["ACRE_PRC117F", "name"]
];

{
	_radioClass = _x;
	_chanList = [];
	_usedList = [];
	if (_radioClass in _srradios) then {
		_chanlist = TFD_SR_CHANNELS;
		_usedList = _usedSRchannels;
	};
	if (_radioClass in _lrradios) then {
		_chanList = TFD_LR_CHANNELS;
		_usedList = _usedLRchannels;
	};
	// get the field property relevant to the radio
	_field = "";
	{
		if (_radioClass == _x#0) then {_field = _x#1};
	} forEach _labelField;

	{
		_channel = _x#0;
		_freq = _x#1;
		_label = toUpper (_x#2); 

		// set frequencies
		[_radioClass, "default", _channel, "frequencyTX", _freq] call acre_api_fnc_setPresetChannelField;
		[_radioClass, "default", _channel, "frequencyRX", _freq] call acre_api_fnc_setPresetChannelField;

		if (_radioClass != "ACRE_SEM52SL") then { // (SEM52 has no label)
			
			// auto set up label based on squadname (if enabled)
			if (!TFD_CUSTOM_SR_LABELS && (_radioClass in _srradios)) then { // if not using custom labels get assigned squad from ORBAT
				_label = "UNASSIGNED";
				{
					if (_x#1 == _channel) then {
						_label = toUpper (_x#0);
					}
				} forEach TFD_ORBAT;
			};

			// if the radio is a 148, append channel num to label (isn't on display)
			if (_radioClass == "ACRE_PRC148") then {
				_label = format ["%1-%2", _label, _channel];
			};

			// set label
			[_radioClass, "default", _channel, _field, _label] call acre_api_fnc_setPresetChannelField;
			
		};
	} forEach _chanList;

	// label unused channels
	if (_radioClass != "ACRE_SEM52SL") then {
		for "_i" from 1 to 100 do {
			if (!(_i in _usedList)) then {
				_label = "";
				if (_radioClass == "ACRE_PRC148") then {
					_label = format ["UNUSED-%1", _i];
				} else {
					_label = "UNUSED";
				};
				[_radioClass, "default", _i, _field, _label] call acre_api_fnc_setPresetChannelField;
			};
		};
	};

} forEach (_srradios + _lrradios);

// MISSION HINT ///////////////////////////////////////////////////////////////////////////////////

if (!hasInterface) exitWith {}; // only clients should execute the next part

[] spawn {
	sleep 5;

	if (isNil "BIS_fnc_establishingShot_playing") then {BIS_fnc_establishingShot_playing = false;};
	waitUntil {sleep 1; !BIS_fnc_establishingShot_playing}; // Wait until establishing shot has stopped playing

	if (TFD_SHOW_START_HINT) then {
		[TFD_USING_SR] spawn TFD_fnc_missionStartHint;
	};
};

};