//== ORBAT & RADIO ASSIGNMENT =====================================================================
/*
	The ORBAT array is used to define player groups used by various scripts (insignia, assign channel, give radio, etc)

	Format:
		["SquadName", _SRchannel, _LRchannel, "s_1", "s_2", "s_3", ...]
	Where s_1, s_2, etc are the varnames of units in that squad
*/

TFD_ORBAT = [
	["Command",		8,	1,	"s_1", "s_2"],
	["Alpha",		1,	1,	"s_3", "s_4","s_5","s_6","s_7","s_8"],
	["Bravo",	 	2,	1,	"s_9", "s_10","s_11","s_12","s_13","s_14"],
	["Charlie",	 	3,	1,	"s_15", "s_16","s_17","s_18","s_19","s_20"],
	["Delta",	 	4,	1,	"s_21", "s_22","s_23","s_24","s_25","s_26"]
];

TFD_SHOW_START_HINT = true; // set to false if you don't want the group/radio summary on loading in
TFD_CLEAR_RADIOS = true; // if true, will remove 343 radios that are sometimes assigned automatically
TFD_AUTOASSIGN_RADIOS = true; // true - auto assign radios using TFD_RADIO_ASSIGNMENT array, false - manually add radios to loadouts

// SRRADIOS are assigned to the channel in col 2 of TFD_ORBAT and use TFD_SR_CHANNELS programming settings
// LRRADIOS are assigned to the channel in col 3 of TFD_ORBAT and use TFD_LR_CHANNELS programming settings
// Radios not in these two arrays do not have channels that can be assigned
TFD_SRRADIOS = ["ACRE_PRC343", "ACRE_PRC148"];
TFD_LRRADIOS = ["ACRE_PRC152", "ACRE_SEM52SL", "ACRE_PRC117F"];

TFD_RADIO_ASSIGNMENT = [
	["ACRE_PRC343", ["Command", "Alpha", "Bravo", "Charlie", "Delta"]],
	["ACRE_PRC152", ["Leaders"]],
	["ACRE_PRC117F", ["Leaders"]]
];

/*
	The TFD_RADIO_ASSIGNMENT array above will assign 343s to all infantry groups and 152s + 117Fs only to squad leaders
	
	The possible radios to assign are:
	STANDARD:		VIETNAM:		OTHER:
	  ACRE_PRC343	  ACRE_PRC77	  ACRE_PRC148
	  ACRE_PRC152					  ACRE_SEM52SL
	  ACRE_PRC117F					  ACRE_SEM70
	
	Format:
		["RADIO_CLASS", ["Groupname", "s_n", "Leaders"]]
	The second parameter (array) can be any combination of group names, unit varnames or "Leaders" which is
	used to assign the radio to group leaders

	Squad leaders are considered to be the first 's_n' unit in the TFD_ORBAT array entry
	e.g.
	TFD_ORBAT = [
		["Command", 8, 1, "s_1", "s_2", "s_3"] << 's_1' is considered to be the leader of group 'Command'.
	];
*/

//== CUSTOM RADIO PROGRAMMING =====================================================================
/*
	The arrays below are used to customise the radio programming (if desired)
	Format: [channel, freq(MHz), label]
	
	By default, the label of a SR channel is the name of the assigned squad in
	the TFD_ORBAT array, but setting TFD_CUSTOM_SR_LABELS to true will allow you
	to specify custom labels like the LR channels.

	Note: Different radios have different frequency ranges:
	STANDARD:					VIETNAM:						OTHER:
	  PRC343:	2400-2483 MHz	  PRC77:   30-52.95 MHz (LOW)	  PRC148:	30-512 MHz
	  PRC152:	30-512 MHz				   53-95.95 MHz (HIGH)	  SEM52SL:	46-65,975 MHz
	  PRC117F:	30-512 MHz										  SEM70:	30-79,975 MHz
*/

TFD_USING_SR = true; // if you're not using SR radios (only squad leaders have radios) set this to false
TFD_CUSTOM_SR_LABELS = false; // set to true if you want custom labels for SR channels

TFD_SR_CHANNELS = [
	[1,311, ""],
	[2,312, ""],
	[3,313, ""],
	[4,314, ""],
	[5,315, ""],
	[6,316, ""],
	[7,317, ""],
	[8,318, ""]
];

TFD_LR_CHANNELS = [
	[1, 50, "PLTNET 1"],
	[2, 51, "PLTNET 2"],
	[3, 52, "AIRNET"],
	[4, 53, "CAS"],
	[5, 54, "FIRES"],
	[6, 55, "AUX 1"],
	[7, 56, "AUX 2"]
];

//== SPAWN PROTECTION =============================================================================
//Uncomment below line to enable grenade/fire stop within 150m of "noFire" marker. (Change markername/radius as desired).
//[[["noFire", 150]]] spawn TFD_fnc_grenadeStop;

//== CASUALTIES CAP ===============================================================================

// Uncomment if you wish to have a set amount of casualties before mission fail (for each side).
//Format: [side, %ofunits, endtype] (possible sides are west > blufor, east > opfor, independent and civilian)
// [west,100,1] spawn TFD_fnc_casualtiesCapCheck;

//== MISC =========================================================================================

// CUSTOM DIFFICULTY
//Set difficulty in 'functions/misc/fn_customDifficulty.sqf'
//[] spawn TFD_fnc_customDifficulty;

/* CIV PUNISH
 If enabled this will announce civilians that are killed by players and
 optionally will fail the mission/kick offending player back to lobby
 
 If _killLimit is not -1, mission will fail when limit is reached
 If _punishPlayers is true then the offending player will be kicked to lobby after _killsToKick kills

 [_showKillMessage, _killLimit, _punishPlayers, _killsToKick] spawn TFD_fnc_civPunish;
*/
//[true, -1, false, 2] spawn TFD_fnc_civPunish;

// ZADE BACKPACK ON CHEST
BOC_WHITELIST = ["s_1", "s_2", "s_3"]; // add slots here you want to be able to use BOC
//[false] spawn zade_boc_fnc_initBOC; // change to true if you want to use the slot whitelist, otherwise everyone can use BOC

//== WERTHLESS HEADLESS ===========================================================================
/* Parameters
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

//== DON'T TOUCH ==================================================================================

//Saving disabled without autosave.
enableSaving [false,false]; 
