/*
	Author: TheTimidShade

	Description:
		Logs player's fire events to the server log

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!hasInterface) exitWith {};

["ace_firedPlayer", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

	private _weaponName = getText (configFile >> "CfgWeapons" >> _weapon >> "DisplayName");
	private _message = format ["[TFD ADMIN] Player %1 fired weapon '%2'", name player, _weaponName];
	[_message] remoteExec ["TFD_fnc_logToServer", 2, false];

}] call CBA_fnc_addEventHandler;