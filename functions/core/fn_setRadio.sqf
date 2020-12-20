/*
	This file handles the config and assignment of radio channels using ACRE.

	You can assign custom labels/frequencies to channels by editing the channel settings below if you choose.
	
	By default, squad names are used for SR channel labels, you can use custom SW labels by setting the second
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
	[1, 50, "PLTNET"],
	[2, 51, "SUPPORT"],
	[3, 53, "AIR 1"],
	[4, 54, "AIR 2"],
	[5, 55, "AUX 1"],
	[6, 56, "AUX 2"],
	[7, 57, "AUX 3"]
];

/* Don't edit below here unless you know what you're changing */

// SR CONFIG //////////////////////////////////////////////////////////////////////////////////////

// assign default channel frequencies for 148, 152 and SEM 52
{
	_channel = _x select 0;
	_freq = _x select 1;

	{
		[_x, "default", _channel, "frequencyTX", _freq] call acre_api_fnc_setPresetChannelField;
		[_x, "default", _channel, "frequencyRX", _freq] call acre_api_fnc_setPresetChannelField;
	} forEach ["ACRE_PRC148", "ACRE_PRC152", "ACRE_SEM52SL"];

} forEach _SRchannelList;

// set up default SR channel labels using squad names or custom labels
_usedChannels = [];
if (_useCustomSRlabels) then {
	{
		_channel = _x select 0;
		_label = _x select 2;

		["ACRE_PRC152", "default", _channel, "description", _label] call acre_api_fnc_setPresetChannelField;
		
		_label = format ["%1-%2", _label, _channel]; // since 148 doesn't show channel num add it to label
		["ACRE_PRC148", "default", _channel, "label", _label] call acre_api_fnc_setPresetChannelField;

		_usedChannels pushBackUnique _channel;
	}  forEach _SRchannelList;
} else {
	{
		_channel = _x select 1;
		_squadName = toUpper (_x select 0);

		["ACRE_PRC152", "default", _channel, "description", _squadName] call acre_api_fnc_setPresetChannelField;
		
		_label = format ["%1-%2", _squadName, _channel]; // since 148 doesn't show channel num add it to label
		["ACRE_PRC148", "default", _channel, "label", _label] call acre_api_fnc_setPresetChannelField;

		_usedChannels pushBackUnique _channel;
	}  forEach TFD_ORBAT;
};

// any unused channels label as 'unused'
for "_i" from 1 to 100 do {
	if (!(_i in _usedChannels)) then {
		["ACRE_PRC152", "default", _i, "description", "UNUSED"] call acre_api_fnc_setPresetChannelField;
		
		_label = format ["UNUSED-%1", _i];
		["ACRE_PRC148", "default", _i, "label", _label] call acre_api_fnc_setPresetChannelField;
	};
};

// LR CONFIG //////////////////////////////////////////////////////////////////////////////////////

// set up default LR channel labels and frequencies (PRC77 and SEM 70 are both left as default)
_usedChannels = [];
{
	_channel = _x select 0;
	_freq = _x select 1;
	_label = _x select 2;

	["ACRE_PRC117F", "default", _channel, "frequencyTX", _freq] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "default", _channel, "frequencyRX", _freq] call acre_api_fnc_setPresetChannelField;
	["ACRE_PRC117F", "default", _channel, "name", _label] call acre_api_fnc_setPresetChannelField;

	_usedChannels pushBackUnique _channel;

} forEach _LRchannelList;

// any unused channels label as 'unused'
for "_i" from 1 to 100 do {
	if (!(_i in _usedChannels)) then {
		["ACRE_PRC117F", "default", _i, "name", "UNUSED"] call acre_api_fnc_setPresetChannelField;
	};
};

// MISSION HINT ///////////////////////////////////////////////////////////////////////////////////

if (!hasInterface) exitWith {}; // only clients should execute the next part

sleep 5;

if (isNil "BIS_fnc_establishingShot_playing") then {BIS_fnc_establishingShot_playing = false;};
waitUntil {sleep 1; !BIS_fnc_establishingShot_playing}; // Wait until establishing shot has stopped playing

if (_showMissionStartHint) then {
	[_usingSR] spawn TFD_fnc_missionStartHint;
};

