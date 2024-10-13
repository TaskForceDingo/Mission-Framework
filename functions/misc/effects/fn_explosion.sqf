/*
	Author: TheTimidShade

	Description:
		Creates an explosion of the given type at a location or object. Some explosions might not work when triggering midair.

	Parameter(s):
		0: STRING - Type of explosion (not case sensitive):
                        - "FRAG"
                        - "DEMO_CHARGE" 
                        - "IED_SM"
                        - "IED_LG" 
                        - "RKT_60"
                        - "RKT_80"
                        - "SH_120"
                        - "SH_82"
                        - "GBU"
		1: ARRAY/OBJECT - The position to create the explosion at
        2: BOOL (OPTIONAL) - Whether or not to delete the object when it explodes (does nothing if position is provided)

	Returns:
		NONE

	Examples:
		
        // Explode and delete a laptop
        ["FRAG", boobytrapped_laptop, true] call TFD_fnc_explosion;
		
        // Using 2D position
        ["IED_SM", getPos ied_1] call TFD_fnc_explosion;

        // Using 3D position
        ["GBU", position bomb_target] call TFD_fnc_explosion;
*/

params [
    ["_explosionType", "FRAG", [""]],
    ["_position", objNull, [[], objNull], [2,3]],
    ["_delete", false, [true]]
];

if (isNull _position) exitWith { ["Position parameter must be provided"] call BIS_fnc_error; };

_explosionType = toUpperANSI _explosionType;

private _sourceObject = objNull;
if (typeName _position == "OBJECT") then {
    _sourceObject = _position;
    _position = position _position;
};

private _ammo = switch (_explosionType) do {
    case "FRAG":        { "APERSTripMine_Wire_Ammo" };
    case "DEMO_CHARGE": { "DemoCharge_Remote_Ammo" };
    case "IED_SM":      { "IEDLandSmall_Remote_Ammo" };
    case "IED_LG":      { "IEDLandBig_Remote_Ammo" };
    case "RKT_60":      { "R_60mm_HE" };
    case "RKT_80":      { "R_80mm_HE" };
    case "SH_120":      { "Sh_120mm_HE" };
    case "SH_82":       { "Sh_82mm_AMOS" };
    case "GBU":         { "Bo_GBU12_LGB" };
    default             { "none" };
};

if (_ammo == "none") exitWith {
    ["Invalid explosion type %1", _explosionType] call BIS_fnc_error;
};

private _bomb = _ammo createVehicle _position;
_bomb setDamage 1;
_bomb setVelocity [0,0,-5]; // Some projectiles need to impact something to detonate

if (!isNull _sourceObject && _delete) then {
    deleteVehicle _sourceObject;
};