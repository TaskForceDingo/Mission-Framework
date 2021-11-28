/*
	Author: TheTimidShade

	Description:
		Server side function to log unknown mod reported by fn_validateLoadedMods in the server log

	Parameters:
		0: STRING - Player name
		1: ARRAY - Mod info in the format [_modName, _modDir, _itemID]
		
	Returns:
		NOTHING
*/

params ["_name", "_modInfo"];
_modInfo params ["_modName", "_modDir", "_itemID"];

private _CRLF = toString [0x0D, 0x0A];
private _message = format ["[TFD ADMIN] %2 is loading an unknown mod:%1  Name: %3%1    Mod Dir: %4%1    Item ID: %5", _CRLF, _name, _modName, _modDir, _itemID];

diag_log text _message;