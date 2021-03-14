/*Put scripts here that you want to be executed on players each time they spawn
e.g. Loadout scripts, script to assign/remove radios, etc

This is to ensure that scripts run correctly both at mission start and when players respawn (if enabled)
*/

// Place player's weapon on back
player action ["SWITCHWEAPON",player,player,-1];

// Setup insignias
// Params: [_autoAssignMedicPatch]
[true] spawn TFD_fnc_setPatch;

// Randomise helmet/facewear/face (configure in functions/misc/fn_unitVariation.sqf)
//[player] spawn TFD_fnc_unitVariation;

/* Forced equipment
This script prevents players from picking up enemy/civilian equipment.
[_enforceUniform, _enforceVest, _enforceHelmet, _unitWhitelist, _gearWhitelist] spawn TFD_fnc_forceUniform;
*/
_unitWhitelist = []; // add units here to be exempted from forced uniform
_gearWhitelist = []; // add uniform/vest/headgear classnames here that will not be overwritten by force uniform
[true, false, false, _unitWhitelist, _gearWhitelist] spawn TFD_fnc_forceUniform;

//== RADIO SETUP !!! DO NOT EDIT BELOW !!! ========================================================

[] spawn {
	if (TFD_CLEAR_RADIOS) then {TFD_RADIO_CLEAR_COMPLETED = false; [] spawn TFD_fnc_clearRadios;} else {TFD_RADIO_CLEAR_COMPLETED = true;};
	waitUntil {TFD_RADIO_CLEAR_COMPLETED};
	if (TFD_AUTOASSIGN_RADIOS) then {TFD_RADIO_ASSIGNMENT_COMPLETED = false; [] spawn TFD_fnc_giveRadios;} else {TFD_RADIO_ASSIGNMENT_COMPLETED = true;};
	waitUntil {TFD_RADIO_ASSIGNMENT_COMPLETED};
	[] spawn TFD_fnc_assignChannels;
};

//== !!! DO NOT EDIT ABOVE !!! ====================================================================