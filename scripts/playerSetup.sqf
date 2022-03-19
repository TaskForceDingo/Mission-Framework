/*
	Put scripts here that you want to be executed on players each time they spawn
	e.g. Loadout scripts, script to assign/remove radios, etc

	This is to ensure that scripts run correctly both at mission start and when players respawn (if enabled)
*/

// Place player's weapon on back
player action ["SWITCHWEAPON",player,player,-1];

// Setup insignias
private _autoAssignMedicPatch = true;
[_autoAssignMedicPatch] spawn TFD_fnc_setPatch;

// Randomise helmet/facewear/face (configure in functions/misc/fn_unitVariation.sqf)
//[player] spawn TFD_fnc_unitVariation;

// This function will overwrite the player's uniform if they try to change or drop it
// By default only uniform is forced but vests and helmets can also be restricted
ENABLE_GEAR_RESTRICTION = true;
private _forceUniform = true;
private _forceVest = false;
private _forceHelmet = false;
private _unitWhitelist = []; // add units here to be exempted from forced uniform
private _gearWhitelist = []; // add uniform/vest/headgear classnames here that will not be overwritten by force uniform

//== DON'T TOUCH ==================================================================================
// Don't change anything past this point unless you understand what you're changing
//=================================================================================================

[] spawn TFD_fnc_handleRadioSetup;

if (ENABLE_GEAR_RESTRICTION) then {[_forceUniform, _forceVest, _forceHelmet, _unitWhitelist, _gearWhitelist] spawn TFD_fnc_forceUniform;};