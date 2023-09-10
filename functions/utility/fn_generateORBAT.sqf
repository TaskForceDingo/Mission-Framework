/*
	Author: TheTimidShade

	Description:
		Generates a formatted version of the standard TFD ORBAT array based off group and unit names assigned in the editor.

	Parameters:
		NONE
		
	Returns:
		STRING - Formatted array (copy paste ready)
*/

if (isMultiplayer) exitWith {hint "Play in singleplayer to generate the ORBAT. All player slots must be spawned into the mission for the script to work.";};

private _CRLF = toString [0x0D, 0x0A]; // UTF-8 newline
private _tab = toString [0x09]; // UTF-8 tab

private _targetUnits = if (isMultiplayer) then {playableUnits} else {switchableUnits};

private _srToAssign = 1;

// collect raw data from playableUnits
private _orbat = [];
{
	private _unit = _x;
	if (_unit isKindOf "HeadlessClient_F") then {continue;}; // Skip HC
	
	private _foundGroup = false;
	{
		if (groupId (group _unit) == _x#0) then {
			_foundGroup = true;
			_x pushBackUnique (vehicleVarName _unit);
		};
	} forEach _orbat;

	if (!_foundGroup) then { // if no group with the same name was found, create a new group
		// get variable name and trim to correct format
		private _srChannel = _srToAssign;
		if (groupId (group _unit) == "Command") then {
			_srChannel = 8;
		};
		_orbat pushBack [groupId (group _unit), _srChannel, 1, (vehicleVarName _unit)];
		if (_srChannel == _srToAssign) then {_srToAssign = _srToAssign + 1}; // If the channel was used, increment the channel
		if (_srToAssign == 8) then {_srToAssign = 9;}; // Typically we reserve channel 8 for command
	};

} forEach _targetUnits;

// convert raw data into more readable format
private _orbatLength = count _orbat;

private _formattedOrbat = format ["TFD_ORBAT = [%1", _CRLF]; // start with variable assignment to make copy paste easier
{
	private _lineElements = _x;
	private _lineLength = count _lineElements;
	
	private _formattedLine = format ["%1[", _tab]; // insert tab character followed by open bracket to start line
	{
		if (_forEachIndex <= 2) then { // group name and channel numbers should have tab instead of space
			if (_forEachIndex == 0) then {
				_formattedLine = _formattedLine + format ["%1,%2%2", str _x, _tab]; // group name has double tab afterwards
			} else {
				_formattedLine = _formattedLine + format ["%1,%2", str _x, _tab];
			};
		} else {
			if (_forEachIndex != _lineLength-1) then {
				_formattedLine = _formattedLine + format ["%1, ", str _x];
			} else {
				_formattedLine = _formattedLine + format ["%1", str _x];
			};
		};
	} forEach _lineElements;
	
	// add end of line
	if (_forEachIndex != _orbatLength-1) then {
		_formattedLine = _formattedLine + format ["],%1", _CRLF]; // add comma to all lines except last
	} else {
		_formattedLine = _formattedLine + format ["]%1", _CRLF];
	};

	// add line to orbat
	_formattedOrbat = _formattedOrbat + _formattedLine;
} forEach _orbat;

private _formattedOrbat = _formattedOrbat + "];"; // add closing bracket

copyToClipboard _formattedOrbat;

hint "TFD_ORBAT copied to clipboard!";