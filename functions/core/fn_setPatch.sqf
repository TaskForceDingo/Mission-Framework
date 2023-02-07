/*
	Author: TheTimidShade

	Description:
		Assigns player an insigia based on the TFD_ORBAT/TFD_PATCHES arrays

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["ENABLE_PATCHES", false])) exitWith {};

// Check to make sure variables exist
if (isNil "AUTOASSIGN_MEDIC_PATCH") then {AUTOASSIGN_MEDIC_PATCH = true;};
if (isNil "TFD_PATCH_ASSIGNMENT") then {TFD_PATCH_ASSIGNMENT = [];};

private _name = vehicleVarName player;

private ["_squadName", "_patchClass"];

// First autoassign patch based on ORBAT
_squadName = "none";
{
	if (_name in _x) exitWith {
		_squadName = _x#0;
	};
}  forEach TFD_ORBAT;

// If the player is a medic, assign medic patch otherwise assign squad name patch
if (AUTOASSIGN_MEDIC_PATCH && (player getVariable ["ace_medical_medicClass", parseNumber (player getUnitTrait "Medic")]) > 0) then {
	player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; // required for insignia to work correctly on respawn
	[player, "Medic"] call BIS_fnc_setUnitInsignia;
} else {
	// If a patch with the squad name exists, assign it to the unit
	if (isClass(missionConfigFile >> "CfgUnitInsignia" >> _squadName)) then {
		player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; // required for insignia to work correctly on respawn
		[player, _squadName] call BIS_fnc_setUnitInsignia;
	};
};

// Check for alternate patch assignment in TFD_PATCH_ASSIGNMENT
{
	_x params ["_unitList", "_patchClass"];
	if (_name in _unitList && {isClass(missionConfigFile >> "CfgUnitInsignia" >> _patchClass) || isClass(configFile >> "CfgUnitInsignia" >> _patchClass)}) then {
		player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; // required for insignia to work correctly on respawn
		[player, _patchClass] call BIS_fnc_setUnitInsignia;
	};
}  forEach TFD_PATCH_ASSIGNMENT; 

TFD_DEBUG_SET_PATCH_COMPLETE = true;

};