/*
	Author: TheTimidShade

	Description:
		Assigns player to their squad's channel as defined in the TFD_ORBAT array.

	Parameters:
		NONE
		
	Returns:
		NONE

*/

_name = format ["%1", player];

waitUntil {([] call acre_api_fnc_isInitialized)};

private ["_unitNames", "_SRchannel", "_LRchannel", "_radioIDs"];
{
	if (_name in _x) then {
	
		_channel = _x select 1;
		_lrChannel = _x select 2;

		// get all player's SR radios and assign each to correct channel
		{
			_radioIDs = [_x] call acre_api_fnc_getAllRadiosByType;
			{[_x, _channel] call acre_api_fnc_setRadioChannel;} forEach _radioIDs;
		} forEach TFD_SRRADIOS;
		
		// get all player's LR radios and assign each to correct channel
		{
			_radioIDs = [_x] call acre_api_fnc_getAllRadiosByType;
			{[_x, _lrChannel] call acre_api_fnc_setRadioChannel;} forEach _radioIDs;
		} forEach TFD_LRRADIOS;

	};			
}  forEach TFD_ORBAT;

// Alternative channel assignment
{
	_x params ["_unitNames", "_SRchannel", "_LRchannel"];

	if (_name in _unitNames) then {
		// get all player's SR radios and assign each to correct channel
		if (_SRchannel != -1) then {
			{
				_radioIDs = [_x] call acre_api_fnc_getAllRadiosByType;
				{[_x, _SRchannel] call acre_api_fnc_setRadioChannel;} forEach _radioIDs;
			} forEach TFD_SRRADIOS;
		};
		
		// get all player's LR radios and assign each to correct channel
		if (_LRchannel != -1) then {
			{
				_radioIDs = [_x] call acre_api_fnc_getAllRadiosByType;
				{[_x, _LRchannel] call acre_api_fnc_setRadioChannel;} forEach _radioIDs;
			} forEach TFD_LRRADIOS;
		};
	};

} forEach TFD_ALTERNATE_CHANNEL_ASSIGNMENT;