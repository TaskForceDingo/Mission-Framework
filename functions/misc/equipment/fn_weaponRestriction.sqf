/*
	Author: TheTimidShade

	Description:
		Replacement for Diwako Punish Unknown Weapon designed to work with the latest ACE Overheating functionality

	Parameters:
		NONE
		
	Returns:
		NONE
*/

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};

TFD_DEBUG_WEAPON_RESTRICTION_RUNNING = true;

if (isServer) then { // when executed on the server, initialise the weapon whitelist(s)
	[TFD_WEAPON_WHITELIST_LOCAL] spawn TFD_fnc_addAllowedWeapons;
	publicVariable "TFD_OVERHEAT_WHITELIST_LOCAL";
};
if (!hasInterface) exitWith {};

// Add fired event handler
["ace_firedPlayer", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
	[_weapon, _muzzle, _ammo, _magazine, _projectile] call TFD_fnc_handleWeaponOverheating;
}] call CBA_fnc_addEventHandler;

// If we don't want weapon restrictions don't worry about the whitelist
if (!ENABLE_WEAPON_RESTRICTION) exitWith {};

sleep 15;

private _weaponsToAdd = [];
{
	if (_x != "") then {
		_weaponsToAdd pushBackUnique _x;
	};
} forEach [primaryWeapon player, secondaryWeapon player, handgunWeapon player];

[_weaponsToAdd] remoteExec ["TFD_fnc_addAllowedWeapons", 2, false];

};
