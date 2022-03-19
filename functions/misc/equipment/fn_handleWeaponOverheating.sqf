/*
	Author: TheTimidShade

	Description:
		Handles weapon fire event for fn_weaponRestriction

	Parameters:
		0: STRING - Weapon classname
		
	Returns:
		NONE
*/

params [
	["_weapon", "", [""]],
	["_muzzle", "", [""]],
	["_ammo", "", [""]],
	["_magazine", "", [""]],
	["_bullet", objNull, [objNull]]
];

// if weapon is allowed or is a GL/launcher/grenade ignore the fired event
if (_weapon in TFD_weapon_whitelist || {(_muzzle != (primaryWeapon player)) && {_muzzle != (handgunWeapon player)}}) exitWith {};

// if weapon is in the no overheat list, reset heating to 0 and exit
// otherwise calculate the jam chance and heating and apply it
if (_weapon in TFD_nooverheat_whitelist) then {
	player setVariable ["ace_overheating_" + (_weapon) + "_temp", 0]; // remove weapon heat
} else {
	// from https://github.com/acemod/ACE3/blob/master/addons/overheating/functions/fnc_firedEH.sqf
	// get current temperature from the unit variable
	private _temperature = player getVariable ["ace_overheating_" + (_weapon), 0];
	private _scaledTemperature = linearConversion [0, 1000, _temperature, 0, 1, true];
	
	// get weapon data
	([_weapon] call ace_overheating_fnc_getWeaponData) params ["_dispersion", "_slowdownFactor", "_jamChance"];

	// calculate jam chance based on temperature
	private _value = 5 * _scaledTemperature;
	private _array = [0.5, 1, 2, 8, 20, 150];
	_jamChance = _jamChance * ace_overheating_jamChanceCoef * linearConversion [0, 1, _value % 1, _array select floor _value, _array select ceil _value];

	if ((random 1) < _jamChance) then {
        [player, _weapon] call ace_overheating_fnc_jamWeapon;
    };

	// from https://github.com/acemod/ACE3/blob/master/addons/overheating/functions/fnc_overheat.sqf
	// get bullet parameters
	private _energyIncrement = ace_overheating_cacheAmmoData get _ammo;
	if (isNil "_energyIncrement") then {
		private _bulletMass = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_BulletMass");
		if (_bulletMass == 0) then {
			// If the bullet mass is not configured, estimate it
			_bulletMass = 3.4334 + 0.5171 * (getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit") + getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber"));
		};

		_energyIncrement = ace_overheating_heatCoef * 0.0015 * _bulletMass * (vectorMagnitudeSqr velocity _bullet);

		ace_overheating_cacheAmmoData set [_ammo, _energyIncrement];
	};

	// increase overheating depending on how obstrusive is the current supressor
	private _suppressor = switch (_weapon) do {
		case (primaryWeapon player) : {(primaryWeaponItems player) select 0};
		case (handgunWeapon player) : {(handgunItems player) select 0};
		default {""};
	};
	if (_suppressor != "" && {ace_overheating_suppressorCoef > 0}) then {
		private _suppressorCoef = ace_overheating_cacheSilencerData get _suppressor;
		if (isNil "_suppressorCoef") then {
			private _config = configFile >> "CfgWeapons" >> _suppressor >> "ItemInfo" >> "AmmoCoef";
			_suppressorCoef = ace_overheating_suppressorCoef * (1 + (1 - getNumber (_config >> "audibleFire")) + (1 - getNumber (_config >> "visibleFire")));
			ace_overheating_cacheSilencerData set [_suppressor, _suppressorCoef];
		};
		_energyIncrement = _energyIncrement * _suppressorCoef;
	};


	[player, _weapon, _energyIncrement/3] call ace_overheating_fnc_updateTemperature;
};