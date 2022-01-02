/*
	Author: TheTimidShade

	Description:
		Replacement for Diwako Punish Unknown Weapon designed to work with the latest ACE Overheating functionality

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!hasInterface) exitWith {};

["ace_firedPlayer", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
	[_weapon, _muzzle, _ammo, _magazine, _projectile] call TFD_fnc_handleWeaponOverheating;
}] call CBA_fnc_addEventHandler;

sleep 15;

private _weaponsToAdd = [];
{
	if (_x != "") then {
		_weaponsToAdd pushBackUnique _x;
	};
} forEach [primaryWeapon player, secondaryWeapon player, handgunWeapon player];

[_weaponsToAdd] remoteExec ["TFD_fnc_addAllowedWeapons", 2, false];
