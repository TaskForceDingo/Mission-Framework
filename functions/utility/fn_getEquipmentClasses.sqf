/*
	Author: TheTimidShade

	Description:
		Generates a set of formatted arrays that contain useful classnames such as weapon classes
		(for Diwako's Punish Unknown Weapon) or headgear/facewear (for unit randomisation script)

	Parameters:
		0: ARRAY - Array of units to retrieve classnames from
		
	Returns:
		STRING - Formatted arrays (copy paste ready)
*/

params [
	["_targetUnits", [], [[]]]
];

if (count _targetUnits == 0) exitWith {};

private _CRLF = toString [0x0D, 0x0A]; // UTF-8 newline
private _tab = toString [0x09]; // UTF-8 tab

// Equipment
private _headgearList = [];
private _facewearList = [];
private _uniformList = [];
private _vestList = [];
private _backpackList = [];

// Weapons
private _primaryWeaponsList = [];
private _secondaryWeaponsList = [];
private _sidearmsList = [];

// Faces/Voices
private _facesList = [];
private _voicesList = [];

// collect raw data from playableUnits
{
	_headgearList pushBackUnique (headgear _x);
	_facewearList pushBackUnique (goggles _x);
	_uniformList pushBackUnique (uniform _x);
	_vestList pushBackUnique (vest _x);
	_backpackList pushBackUnique (backpack _x);

	_primaryWeaponsList pushBackUnique (primaryWeapon _x);
	_secondaryWeaponsList pushBackUnique (secondaryWeapon _x);
	_sidearmsList pushBackUnique (handgunWeapon _x);

	_facesList pushBackUnique (face _x);
	_voicesList pushBackUnique (speaker _x);
} forEach _targetUnits;

private _formattedString = "";
private _labels = ["Headgear", "Facewear", "Uniforms", "Vests", "Backpacks", "Primary weapons", "Secondary weapons (e.g. launchers)", "Sidearms", "Faces", "Voices"];

{
	private _label = _labels#_forEachIndex;
	_formattedString = _formattedString + ([_x, _label] call TFD_fnc_formatList);
	
	// add a space between all lists but don't add second newline for last list
	if (_forEachIndex != (count _labels)-1) then {_formattedString = _formattedString + format ["%1", _CRLF];};
	
} forEach [_headgearList, _facewearList, _uniformList, _vestList, _backpackList, _primaryWeaponsList, _secondaryWeaponsList, _sidearmsList, _facesList, _voicesList];

copyToClipboard _formattedString;

_formattedString