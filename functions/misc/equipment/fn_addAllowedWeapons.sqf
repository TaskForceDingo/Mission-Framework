/*
	Author: TheTimidShade

	Description:
		Adds weapons from player units into the serverside weapon whitelist

	Parameters:
		0: ARRAY - Array of weapon names to add to serverside list
		
	Returns:
		NONE
*/

params [
	["_weapons", [], [[]]]
];

if (!isServer) exitWith {};
if (count _weapons == 0) exitWith {};

if (isNil "TFD_weapon_whitelist") then {TFD_weapon_whitelist = [];};

{TFD_weapon_whitelist pushBackUnique _x} forEach _weapons;
publicVariable "TFD_weapon_whitelist";