/*
	Author: TheTimidShade

	Description:
		Generates an array containing all items from a given set of units intended to be used for creating an ACE arsenal.

	Parameters:
		0: ARRAY - Array of units to get items from
		
	Returns:
		STRING - Formatted array (copy paste ready)
*/

params [
	["_targetUnits", [], [[]]]
];

if (count _targetUnits == 0) exitWith {};

private _fnc_inBlacklist = {
	params ["_classname", "_blacklist"];
    private _found = false;
    {
        private _matches = _className regexFind [_x];
        if (count _matches > 0) then { _found = true; break; };
     } forEach _blacklist;
    _found
};

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

// Magazines/Items
private _allMags = [];
private _allItems = [];

// Radios get duplicated due to being assigned different IDs for each player, so they should not be added
private _blacklist = ["ACRE_PRC77","ACRE_PRC117F","ACRE_PRC148","ACRE_PRC152","ACRE_PRC343","ACRE_SEM52SL","ACRE_SEM70","ACRE_BF888S"];

// We generally always want these items to be included
private _essentials = ["ItemMap","ItemCompass","ItemWatch","ACE_Altimeter","ItemAndroid","ItemGPS","ItemMicroDAGR","ItemcTab","B_UavTerminal","ACE_RangeTable_82mm","ACE_adenosine","ACRE_PRC117F","ACRE_PRC148","ACRE_PRC152","ACRE_PRC343","ACRE_PRC77","ACE_artilleryTable","ACE_ATragMX","ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage","ACE_quikclot","ACRE_BF888S","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_bodyBag","ACE_bodyBag_blue","ACE_bodyBag_white","ACE_CableTie","ACE_Cellphone","ACE_DAGR","ACE_DefusalKit","ACE_EarPlugs","ACE_EHP","ACE_EntrenchingTool","ACE_epinephrine","ACE_Flashlight_MX991","ItemcTabHCam","ACE_IR_Strobe_Item","ACE_Kestrel4500","ACE_Flashlight_KSF1","ACE_M26_Clacker","ACE_Clacker","ACE_Flashlight_XL50","ACE_MapTools","ACE_microDAGR","ACE_morphine","ACE_painkillers","ACE_personalAidKit","ACE_plasmaIV","ACE_plasmaIV_250","ACE_plasmaIV_500","ACE_RangeCard","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","ACRE_SEM52SL","ACRE_SEM70","ACE_SpareBarrel","ACE_splint","ACE_surgicalKit","ACE_suture","ToolKit","ACE_tourniquet","ACRE_VHF30108SPIKE","ACRE_VHF30108","ACRE_VHF30108MAST"];

// Collect items from target units
{
	_headgearList pushBackUnique (headgear _x);
	_facewearList pushBackUnique (goggles _x);
	_uniformList pushBackUnique (uniform _x);
	_vestList pushBackUnique (vest _x);
	_backpackList pushBackUnique (backpack _x);

	_primaryWeaponsList pushBackUnique (primaryWeapon _x);
	_secondaryWeaponsList pushBackUnique (secondaryWeapon _x);
	_sidearmsList pushBackUnique (handgunWeapon _x);

    // Collect mags and items
    private _magazines = magazines _x;
    private _items = items _x;

    // Remove duplicates
    _magazines = _magazines arrayIntersect _magazines;
    _items = _items arrayIntersect _items;

    // Add unique mags/items to the lists
    {if !([_x, _blacklist] call _fnc_inBlacklist) then { _allMags pushBackUnique _x; }} forEach _magazines;
    {if !([_x, _blacklist] call _fnc_inBlacklist) then { _allItems pushBackUnique _x; }} forEach _items;

} forEach _targetUnits;

// Combine everything into one array
private _everything = [];
{
	_everything append _x;
} forEach [_headgearList, _facewearList, _uniformList, _vestList, _backpackList, _primaryWeaponsList, _secondaryWeaponsList, _sidearmsList, _allMags, _allItems, _essentials];

// Remove duplicates
_everything = _everything arrayIntersect _everything;
// Remove empty string
_everything - [""];

private _formattedString = "[";

// Join all classnames together with commas except for the last one
private _totalClassnames = count _everything;
{
    _formattedString = _formattedString + format ["%1", str _x];
    if (_forEachIndex != _totalClassnames - 1) then {
		_formattedString = _formattedString + ",";
	};
} forEach _everything;

_formattedString = _formattedString + "]";

copyToClipboard _formattedString;

_formattedString
