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

TFD_CLEAR_RADIOS = true; // if true, will remove 343 radios that are sometimes assigned automatically
TFD_AUTOASSIGN_RADIOS = true; // true - auto assign radios using TFD_RADIO_ASSIGNMENT array, false - manually add radios to loadouts
TFD_USING_SR = true; // if you're not using SR radios (only squad leaders have radios) set this to false

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

//== MISC =========================================================================================

// SPAWN PROTECTION
ENABLE_SPAWN_PROTECTION = false; // Set this to true to enable spawn protection around the safezones
private _safezones = ["safeMarkerName"]; // Triggers or marker names that are safezones, trigger names must not have quotes

// WEAPON RESTRICTION
ENABLE_WEAPON_RESTRICTION = true; // When enabled, un-whitelisted weapons will have increased jam chance and overheating
private _allowedWeapons = [
    "weapon_classname_here",
    "weapon_classname_here"
];

// CUSTOM DIFFICULTY
/* 
    If enabled, these difficulty settings will overwrite the default settings assigned to units
    Might conflict with AI scripts that modify difficulty
    Higher values are better
    For explanation of what these values do see https://community.bistudio.com/wiki/Arma_3:_AI_Skill#Sub-Skills
*/
ENABLE_CUSTOM_DIFFICULTY = false; // Set this to true to enable custom difficulty
private _difficulty = [
    0.8, // Aim accuracy (lead, drop, recoil)
    0.6, // Aim steadiness
    0.5, // Aim speed
    0.6, // Spot distance
    0.6, // Spot speed
    0.6, // Courage
    0.5, // Reload speed
    0.6, // Commanding
    0.6  // General
];

// PUNISH CIVILIAN DEATHS
/* 
    If enabled this will announce civilians that are killed by players and
    optionally will fail the mission/kick offending player back to lobby
 
    If _killLimit is not -1, mission will fail when limit is reached
    If _punishPlayers is true then the offending player will be kicked to lobby after _killsToKick kills
*/
ENABLE_CIV_PUNISH = false; // Set this to true to punish players killing civilians
private _announceDeaths = true;
private _killLimit = -1;
private _punishPlayers = false;
private _killsToKick = 2;

// ZADE BACKPACK ON CHEST
ENABLE_ZADE_BOC = false; // Set this to true to enable backpack on chest
BOC_WHITELIST = ["s_1", "s_2", "s_3"]; // add slots here you want to be able to use BOC
private _useWhitelist = false;

//== DAC SETUP ====================================================================================

USE_DAC = false; // set this to true if using DAC

//== DON'T TOUCH ==================================================================================
// Don't change anything past this point unless you understand what you're changing
//=================================================================================================

//Saving disabled without autosave.
enableSaving [false,false];

//== WERTHLESS HEADLESS ===========================================================================
/* 
    Parameters:
    0: BOOL - Repeat mode, true = repeat, false = only execute once
    1: NUMBER - Time in seconds between repeats
    2: BOOL - Debug mode, true to show debug messages
    3: BOOL - Advanced balancing, true to enable, false to use simple balancing
    4: NUMBER - Delay in seconds before executing script
    5: NUMBER - Additional syncing time in seconds between groups transferred to try to reduce bad unit transfer caused by desyncs
    6. BOOL - If true, displays a report after the first cycle showing the number of units moved to HCs
    7. ARRAY - Addition phrases to look for when checking whether to ignore
    
    Unit names, group names, unit's current transport vehicle, modules synced to units and unit class names will all be checked for the additional phrases
      Format:
        ["UnitName","GroupCallsignName","SupportProviderModule1","TypeOfUnit"]
        E.g. ["BLUE1","AlphaSquad","B_Heli_Transport_01_camo_F"]
      
    Specifying "B_Heli" would stop all units with that class type from transferring to HCs
    However, if you specify "BLUE1", "NAVYBLUE10" will also be ignored
*/

// Some units/scripts can break when transferred to the HC
// Add phrases to the exclusion list to prevent this
private _HC_exclusion = [

];

[
    true, // Repeat mode
    30, // Period
    false, // Debug
    true, // Advanced balancing
    60, // Delay
    3, // Sync time
    false, // Report first cycle
    _HC_exclusion // Exclusion list
] spawn TFD_fnc_WerthlesHeadless;

// DAC SETUP
if (USE_DAC) then {[] spawn TFD_fnc_setupDAC;};

// SPAWN PROTECTION
if (ENABLE_SPAWN_PROTECTION) then {[_safezones] spawn TFD_fnc_grenadeStop;};

// WEAPON RESTRICTION
if (ENABLE_WEAPON_RESTRICTION) then {
    if (isServer) then {
        [_allowedWeapons] spawn TFD_fnc_addAllowedWeapons;
    };
    [] spawn TFD_fnc_weaponRestriction;
};

// CUSTOM DIFFICULTY
if (ENABLE_CUSTOM_DIFFICULTY) then {_difficulty spawn TFD_fnc_customDifficulty;};

// PUNISH CIVILIAN DEATHS
if (ENABLE_CIV_PUNISH) then {[_announceDeaths, _killLimit, _punishPlayers, _killsToKick] spawn TFD_fnc_civPunish;};

// ZADE BOC
if (ENABLE_ZADE_BOC) then {[_useWhitelist] spawn zade_boc_fnc_initBOC;};
