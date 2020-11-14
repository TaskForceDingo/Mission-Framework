//== Misc Functions ===================================================

//Initialises custom difficulty for all non player units (Uncomment to use)
//Set difficulty in 'functions/misc/fn_customDifficulty.sqf'
//[] spawn TFD_fnc_customDifficulty;

/* Initialise civPunish function
 If enabled this will announce civilians that are killed by players and
 optionally will fail the mission/kick offending player back to lobby
 
 If _killLimit is not -1, mission will fail when limit is reached
 If _punishPlayers is true then the offending player will be kicked to lobby after _killsToKick kills

 [_showKillMessage, _killLimit, _punishPlayers, _killsToKick] spawn TFD_fnc_civPunish;
*/
//[true, -1, false, 2] spawn TFD_fnc_civPunish;

//Uncomment below line to enable grenade/fire stop within 150m of "noFire" marker. (Change markername/radius as desired).
//[[["noFire", 150]]] spawn TFD_fnc_grenadeStop;

/*== Diwako's Punish Unknown Weapon - Allowed weapons =================

Use this to manually add more weapons to the 'known' pool (is added on top of propogated weapons + weapons players have on start)
Mainly used if you want players to be able to use weapons they do not start with.

_NATO: true = M4 style ARs are whitelisted
_EAST: true = AK style ARs are whitelisted

*/

_NATO = false; _EAST = false;

_wp_classnames = [
	//"weapon_class_1",
	//"weapon_class_2" ...
];

[_wp_classnames, _NATO, _EAST] spawn TFD_fnc_setupDPWlist;

//== Casualties Cap ===================================================

// Uncomment if you wish to have a set amount of casualties before mission fail (for each side).
//Format: [side, %ofunits, endtype] (possible sides are west > blufor, east > opfor, independent and civilian)
// [west,100,1] spawn TFD_fnc_casualtiesCapCheck;

//== Misc =============================================================

// Initialise Zade Backpack on Chest actions
// uncomment to use
BOC_WHITELIST = ["s_1", "s_2", "s_3"]; // add slots here you want to be able to use BOC
//[false] spawn zade_boc_fnc_initBOC; // change to true if you want to use the slot whitelist, otherwise everyone can use BOC

//Saving disabled without autosave.
enableSaving [false,false]; 

//Execute the TFAR settings
[] spawn TFD_fnc_tfar;

/* Werthles Headless Script Parameters
 1. Repeating - true/Once - false,
 2. Time between repeats (seconds),
 3. Debug on - true/off - false,
 4. Advanced balancing - true/Simple balancing - false,
 5. Delay before executing (seconds),
 6. Additional syncing time between groups transferred to try to reduce bad unit transfer caused by desyncs (seconds)
 7. Display an initial setup report after the first cycle, showing the number of units moved to HCs,
 8. Addition phrases to look for when checking whether to ignore.
 Unit names, group names, unit's current transport vehicle, modules synced to units and unit class names will all be checked for these phrases
 Format:
 ["UnitName","GroupCallsignName","SupportProviderModule1","TypeOfUnit"]
 E.g. ["BLUE1","AlphaSquad","B_Heli_Transport_01_camo_F"]
 Specifying "B_Heli" would stop all units with that class type from transferring to HCs
 However, if you specify "BLUE1", "NAVYBLUE10" will also be ignored
 */
[true,30,false,true,60,3,false,[]] spawn TFD_fnc_WerthlesHeadless;





