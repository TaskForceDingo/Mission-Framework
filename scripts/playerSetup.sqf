/*Put scripts here that you want to be executed on players each time they spawn
e.g. Loadout scripts, script to assign/remove radios, etc

This is to ensure that scripts run correctly both at mission start and when players respawn (if enabled)
*/

//Setup TFAR radio channels and mission hint
//Params: [_showMissionStartHint, _swDisabled, _setAdditional]
[true, false, false] spawn TFD_fnc_setRadio;

//Setup insignias
//Params: [_autoAssignMedicPatch]
[true] spawn TFD_fnc_setPatch;

/* Forced equipment
This script prevents players from picking up enemy/civilian equipment.
[_enforceUniform, _enforceVest, _enforceHelmet, _unitWhitelist, _gearWhitelist] spawn TFD_fnc_uniformChange;
*/
_unitWhitelist = []; // add units here to be exempted from forced uniform
_gearWhitelist = []; // add uniform/vest/headgear classnames here that will not be overwritten by force uniform
[true, false, false, _unitWhitelist, _gearWhitelist] spawn TFD_fnc_forceUniform;