/*
	Author: TheTimidShade

	Description:
		Executes TFD Framework scripts when the player is hit/damaged

	Parameters:
		Parameters passed from HandleDamage EH
		https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#HandleDamage
		
	Returns:
		NONE
*/

params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

// If the player is damaged by another player, write the event data to the server log
if (isPlayer _instigator && _damage > 0.03) then {
	private _distance = round (_unit distance _instigator);

	private "_message";
	if (vehicle _instigator == _instigator) then {
		private _weaponName = getText (configFile >> "CfgWeapons" >> currentWeapon _instigator >> "DisplayName");
		_message = format ["[TFD ADMIN] FRIENDLY FIRE: %1 did %2 damage to %3's hitpoint '%4' with projectile '%5' while holding weapon '%6' from range %7m", name _instigator, str _damage, name _unit, _selection, _projectile, _weaponName, str _distance];
	} else {
		private _vehicleName = getText (configFile >> "CfgVehicles" >> (typeOf (vehicle _instigator)) >> "DisplayName");
		_message = format ["[TFD ADMIN] FRIENDLY FIRE: %1 did %2 damage to %3's hitpoint '%4' with projectile '%5' in vehicle '%6' from range %7m", name _instigator, str _damage, name _unit, _selection, _projectile, _vehicleName, str _distance];
	};
	
	[_message] remoteExec ["TFD_fnc_logToServer", 2, false];
};

