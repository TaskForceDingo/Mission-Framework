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

private _units = if (isMultiplayer || is3DEN) then {playableUnits} else {switchableUnits};

{
    // Collect mags and items
    private _magazines = magazines _x;
    private _items = items _x;

    // Remove duplicates
    _magazines = _magazines arrayIntersect _magazines;
    _items = _items arrayIntersect _items;

    // Add unique mags/items to the lists
    {_allMags pushBackUnique _x;} forEach _magazines;
    {_allItems pushBackUnique _x;} forEach _items;
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
