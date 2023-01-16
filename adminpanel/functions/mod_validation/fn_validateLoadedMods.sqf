/*
	Author: TheTimidShade

	Description:
		Executed when player joins the server, will report any unknown mods to the server log

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

if (!hasInterface) exitWith {};

#include "approvedMods.hpp"

private _addonInfo = getLoadedModsInfo;
private _modInfo;
{
    _x params ["_modName", "_modDir", "_isDefault", "_isOfficial", "_origin", "_hash", "_hashShort", "_itemID"];
    
    if ((!_isOfficial) && {!(_modDir in _approvedMods)}) then {
        _modInfo = [_modName, _modDir, _itemID];
        [name player, _modInfo] remoteExecCall ["admp_fnc_logUnknownMod", 2, false];
    };
} forEach _addonInfo;

// Use in debug console to easily copy approved mods:
/*

private _CRLF = toString [0x0D, 0x0A];
private _outputStr = "";
private _addonInfo = getLoadedModsInfo;
private _numAddons = count _addonInfo;
{
    _x params ["_modName", "_modDir", "_isDefault", "_isOfficial", "_origin", "_hash", "_hashShort", "_itemID"];
    if (!_isOfficial) then {
        if (_forEachIndex == (_numAddons - 1)) then {
            _outputStr = _outputStr + format ["""%1""", _modDir];
        } else {
            _outputStr = _outputStr + format ["""%1"",%2", _modDir, _CRLF];
        };
    };
    
} forEach _addonInfo;
copyToClipboard _outputStr;

*/