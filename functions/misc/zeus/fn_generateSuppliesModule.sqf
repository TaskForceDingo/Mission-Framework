/*
    Author: TheTimidShade

    Description:
        Zeus Enhanced module that will add supplies collected from player's
        loadouts into the object the module was placed on to allow Zeus to
        easily give player's more supplies if required.
*/

["TFD Framework", "Generate Supplies",
{
    params [["_position", [0,0,0], [[]], 3], ["_attachedObject", objNull, [objNull]]];

    if (isNull _attachedObject) then {
        ["Place the module on a container you want to add supplies to"] call zen_common_fnc_showMessage;
    } else {
        [[_attachedObject]] call TFD_fnc_generateSupplies;
        ["Supplies added to container"] call zen_common_fnc_showMessage;
    };

}, ""] call zen_custom_modules_fnc_register;