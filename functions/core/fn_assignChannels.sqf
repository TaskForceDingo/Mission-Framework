// assign player to their squad channel using orbat
_name = format ["%1", player];

{
	if (_name in _x) then {
	
		_channel = _x select 1;
		_lrChannel = _x select 2;

		waitUntil {([] call acre_api_fnc_isInitialized)};

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
