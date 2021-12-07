/*
	Author: TheTimidShade

	Description:
		Used to assign custom loadouts to garrison units.

	Parameters:
		0: OBJECT - Unit to assign custom loadout to
		
	Returns:
		NONE

*/

params [
	["_unit", objNull, [objNull, ""]]
];

if (isNull _unit) exitWith {};

switch (typeOf _unit) do {
	case "O_Soldier_F"; // unit class you want the loadout on
	case "O_Soldier_LAT_F"; // use a semicolon after a case to combine cases
	case "O_soldier_M_F"; // all of these units will have the same loadout loaded onto them
	case "O_Soldier_TL_F";
	case "O_Soldier_AR_F";
	case "O_Soldier_A_F";
	case "O_medic_F";
	case "O_Soldier_SL_F": {
		// arsenal export with 'this' replaced by '_unit' and comments removed
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit addWeapon "arifle_Katiba_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_ACO_grn";
		_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
		_unit addWeapon "hgun_Rook40_F";
		_unit addHandgunItem "16Rnd_9x21_Mag";

		_unit forceAddUniform "U_O_CombatUniform_ocamo";
		_unit addVest "V_HarnessO_brn";
		_unit addBackpack "B_FieldPack_cbr_Ammo";

		_unit addItemToUniform "FirstAidKit";
		for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
		for "_i" from 1 to 9 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
		for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "SmokeShell";
		_unit addItemToVest "SmokeShellRed";
		for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "FirstAidKit";};
		for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
		_unit addItemToBackpack "150Rnd_762x54_Box";
		_unit addItemToBackpack "RPG32_F";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "MiniGrenade";};
		for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "10Rnd_93x64_DMR_05_Mag";};
		for "_i" from 1 to 3 do {_unit addItemToBackpack "10Rnd_762x51_Mag";};
		_unit addHeadgear "H_HelmetO_ocamo";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "NVGoggles_OPFOR";
	};
	/*case "classname": {
		// arsenal export here
	};*/// copy the structure above to add as many cases as you want
	default {};
};