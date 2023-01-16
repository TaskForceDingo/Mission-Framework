/*
	Author: TheTimidShade

	Description:
		Takes an array and generates a nicely formatted list with a comment label
		Providing "" as the label removes the label

	Parameters:
		0: ARRAY - Array of list items
		1: STRING - Text to use for comment label
		
	Returns:
		STRING - Formatted array (copy paste ready)
*/

params [
	["_listItems", [], [[]]],
	["_label", "", [""]]
];

private _CRLF = toString [0x0D, 0x0A]; // UTF-8 newline
private _tab = toString [0x09]; // UTF-8 tab

private _formattedString = "";

if (_label != "") then { // if label was specified add coment to top of string
	_formattedString = _formattedString + format ["// %1%2", _label, _CRLF];
};

_formattedString = _formattedString + format ["[%1", _CRLF]; // add opening bracket

private _numListItems = count _listItems;
{
	if (_forEachIndex != _numListItems-1) then { // don't add comma to last item
		_formattedString = _formattedString + format ["%3%1,%2", str _x, _CRLF, _tab];
	} else {
		_formattedString = _formattedString + format ["%3%1%2", str _x, _CRLF, _tab];
	};
} forEach _listItems;

_formattedString = _formattedString + format ["];%1", _CRLF]; // add closing bracket

_formattedString
