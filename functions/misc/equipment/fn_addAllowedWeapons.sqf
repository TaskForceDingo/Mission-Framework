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

if (isNil "TFD_WEAPON_WHITELIST") then {TFD_WEAPON_WHITELIST = [];};

{TFD_WEAPON_WHITELIST pushBackUnique _x} forEach _weapons;
publicVariable "TFD_WEAPON_WHITELIST";