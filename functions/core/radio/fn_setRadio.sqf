/*
	Author: TheTimidShade

	Description:
		Sets up ACRE radio config based on radio settings defined in init.sqf

	Parameters:
		NONE
		
	Returns:
		NONE

*/

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};

// Check to make sure variables exist
if (isNil "TFD_CUSTOM_SR_LABELS") then {TFD_CUSTOM_SR_LABELS = false;};
if (isNil "TFD_SR_CHANNELS") then {
	TFD_SR_CHANNELS = [
		[1,311, ""],
		[2,312, ""],
		[3,313, ""],
		[4,314, ""],
		[5,315, ""],
		[6,316, ""],
		[7,317, ""],
		[8,318, ""]
	];
};

if (isNil "TFD_LR_CHANNELS") then {
	TFD_LR_CHANNELS = [
		[1, 50, "PLTNET 1"],
		[2, 51, "PLTNET 2"],
		[3, 52, "AIRNET"],
		[4, 53, "CAS"],
		[5, 54, "FIRES"],
		[6, 55, "AUX 1"],
		[7, 56, "AUX 2"]
	];
};

if (isNil "TFD_SRRADIOS") then {TFD_SRRADIOS = ["ACRE_PRC343", "ACRE_PRC148"];};
if (isNil "TFD_LRRADIOS") then {TFD_LRRADIOS = ["ACRE_PRC152", "ACRE_SEM52SL", "ACRE_PRC117F"];};

_noProgram = ["ACRE_PRC343", "ACRE_SEM70", "PRC-77"]; // these radios work slightly differently and don't need to be programmed

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
		private _numChannels = 100;
		if (_radioClass == "ACRE_PRC148") then {_numChannels = 32;};
		
		for "_i" from 1 to _numChannels do {
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

TFD_DEBUG_SET_RADIO_COMPLETE = true;

};