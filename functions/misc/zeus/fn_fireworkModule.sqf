/*
    Author: TheTimidShade

    Description:
        Zeus Enhanced module that launches a unit into the sky and detonates an
        explosive charge on them. Use with caution (or for lols)
*/

["TFD Framework", "Firework",
{
    params [["_position", [0,0,0], [[]], 3], ["_attachedObject", objNull, [objNull]]];

    if (isNull _attachedObject || {!(_attachedObject isKindOf "CAManBase")}) exitWith {["Must be placed on a person!"] call zen_common_fnc_showMessage;};

    ["WARNING", format ["Are you sure you want to launch %1?", name _attachedObject], {
        params ["_unit"];
        
        ["Liftoff!"] call zen_common_fnc_showMessage;
        
        [_unit, [0,0,100]] remoteExec ["setVelocity", _unit, false];
        
        _unit spawn {
            waitUntil {(velocity _this)#2 <= 0};
            private _bomb = createVehicle ["SatchelCharge_Remote_Ammo_Scripted", (getPosATL _this), [], 0, "CAN_COLLIDE"];
            _bomb setDamage 1;
        };

        false
    },{}, [_attachedObject]] call zen_common_fnc_messageBox;

}, ""] call zen_custom_modules_fnc_register;