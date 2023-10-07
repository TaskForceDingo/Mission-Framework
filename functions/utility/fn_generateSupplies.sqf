/*
    Author: TheTimidShade

    Description:
        Collects ammo and items from player slots and adds them to selected
        containers/vehicles.

    Parameters:
        0: ARRAY - Array of containers to add supplies to.
        
    Returns:
        NONE

    Usage:
        Can be used in the editor:
            [get3DENSelected "object"] call TFD_fnc_generateSupplies;

        Can also be used in game via Zeus Module or debug console.
*/

params [
    ["_containers", [], [[]]]
];

if (count _containers == 0) exitWith { systemChat "No containers passed in parameters!"; };

private _allMags = [];
private _allItems = [];

// Radios get duplicated due to being assigned different IDs for each player, so they should not be added
private _blacklist = ["ACRE_PRC77","ACRE_PRC117F","ACRE_PRC148","ACRE_PRC152","ACRE_PRC343","ACRE_SEM52SL","ACRE_SEM70","ACRE_BF888S"];

private _fnc_inBlacklist = {
	params ["_classname", "_blacklist"];
    private _found = false;
    {
        private _matches = _className regexFind [_x];
        if (count _matches > 0) then { _found = true; break; };
     } forEach _blacklist;
    _found
};

private _units = if (isMultiplayer || is3DEN) then {playableUnits} else {switchableUnits};
{
    // Collect mags and items
    private _magazines = magazines _x;
    private _items = items _x;

    // Remove duplicates
    _magazines = _magazines arrayIntersect _magazines;
    _items = _items arrayIntersect _items;

    // Add unique mags/items to the lists
    {if !([_x, _blacklist] call _fnc_inBlacklist) then { _allMags pushBackUnique _x; }} forEach _magazines;
    {if !([_x, _blacklist] call _fnc_inBlacklist) then { _allItems pushBackUnique _x; }} forEach _items;
} forEach _units; 

{
    private _container = _x;
    {_container addMagazineCargoGlobal [_x, 1];} forEach _allMags;
    {_container addItemCargoGlobal [_x, 1];} forEach _allItems;
} forEach _containers;

if (is3DEN) then {
    save3DENInventory _selected;
    ["Added items to containers"] call BIS_fnc_3DENNotification;
};
