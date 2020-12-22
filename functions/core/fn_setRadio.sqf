/*
	This file handles the config and assignment of radio channels using ACRE.

	You can assign custom labels/frequencies to channels by editing the channel settings below if you choose.
	
	By default, squad names are used for SR channel labels, you can use custom SR labels by setting the second
	parameter to true.
*/

params [
	["_usingSR", true, [true]],
	["_showMissionStartHint", true, [true]],
	["_useCustomSRlabels", false, [true]]
];

// CHANNEL SETTINGS ///////////////////////////////////////////////////////////////////////////////

_SRchannelList = [
// 	[chanNum, freq, label] // label is only used if _useCustomSRlabels is true
	[1,311, ""],
	[2,312, ""],
	[3,313, ""],
	[4,314, ""],
	[5,315, ""],
	[6,316, ""],
	[7,317, ""],
	[8,318, ""]
];

_LRchannelList = [
// 	[chanNum, freq, label]
	[1, 50, "PLTNET 1"],
	[2, 51, "PLTNET 2"],
	[3, 52, "AIRNET"],
	[4, 53, "CAS"],
	[5, 54, "FIRES"],
	[6, 55, "AUX 1"],
	[7, 56, "AUX 2"]
];

// Note: Radios have different frequency ranges so you may have to edit
// the frequencies in order for assignment to work correctly
// e.g. SEM52 has range of 46.0 to 65.975 MHz where most other radios have
// a range from 30 to 512 MHz

// SRRADIOS are assigned to the channel in col 2 of TFD_ORBAT
// LRRADIOS are assigned to the channel in col 3 of TFD_ORBAT
TFD_SRRADIOS = ["ACRE_PRC343", "ACRE_PRC148"];
TFD_LRRADIOS = ["ACRE_PRC152", "ACRE_SEM52SL", "ACRE_PRC117F"]; // PRC-77 is analogue and SEM70 doesn't have modifiable frequencies so they aren't included
_noProgram = ["ACRE_PRC343", "ACRE_SEM70"]; // these radios work slightly differently and don't need to be programmed

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
{_usedSRchannels pushBackUnique (_x#0);} forEach _SRchannelList;
{_usedLRchannels pushBackUnique (_x#0);} forEach _LRchannelList;

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
		_chanlist = _SRchannelList;
		_usedList = _usedSRchannels;
	};
	if (_radioClass in _lrradios) then {
		_chanList = _LRchannelList;
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
			if (!_useCustomSRlabels && (_radioClass in _srradios)) then { // if not using custom labels get assigned squad from ORBAT
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

sleep 5;

if (isNil "BIS_fnc_establishingShot_playing") then {BIS_fnc_establishingShot_playing = false;};
waitUntil {sleep 1; !BIS_fnc_establishingShot_playing}; // Wait until establishing shot has stopped playing

if (_showMissionStartHint) then {
	[_usingSR] spawn TFD_fnc_missionStartHint;
};

