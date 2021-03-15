/*
	Author: TheTimidShade

	Description:
		Generates a formatted version of the standard TFD ORBAT array based off group and unit names assigned in the editor.

	Parameters:
		NONE
		
	Returns:
		STRING - Formatted array (copy paste ready)
*/

private _CRLF = toString [0x0D, 0x0A]; // UTF-8 newline
private _tab = toString [0x09]; // UTF-8 tab

private _targetUnits = if (isMultiplayer) then {playableUnits} else {switchableUnits};

// collect raw data from playableUnits
private _orbat = [];
{
	private _unit = _x;
	private _foundGroup = false;
	{
		if (groupId (group _unit) == _x#0) then {
			_foundGroup = true;
			_x pushBackUnique (vehicleVarName _unit);
		};
	} forEach _orbat;

	if (!_foundGroup) then { // if no group with the same name was found, create a new group
		// get variable name and trim to correct format
		_orbat pushBack [groupId (group _unit), 1, 1, (vehicleVarName _unit)];
	};

} forEach _targetUnits;

// convert raw data into more readable format
private _orbatLength = count _orbat;

private _formattedOrbat = format ["[%1", _CRLF]; // start with opening bracket
{
	private _lineElements = _x;
	private _lineLength = count _lineElements;
	
	private _formattedLine = format ["%1[", _tab]; // insert tab character followed by open bracket to start line
	{
		if (_forEachIndex <= 2) then { // group name and channel numbers should have tab instead of space
			_formattedLine = _formattedLine + format ["%1,%2", str _x, _tab];
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

_formattedOrbat