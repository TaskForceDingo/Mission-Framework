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

TFD_CLEAR_RADIOS = true; // If true, will remove 343 radios that are sometimes assigned automatically
TFD_AUTOASSIGN_RADIOS = true; // True - auto assign radios using TFD_RADIO_ASSIGNMENT array, false - manually add radios to loadouts
TFD_USING_SR = true; // If you're not using SR radios (only squad leaders have radios) set this to false

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

//== BRIEFING =====================================================================================
/*
    You can have a copy of your mission brief in the game for players to easily refer to if you want to.
    Simply fill out the briefing sections below with the text from your briefing on the forums.

    To add a newline put '<br/>' (without quotes) where you want the newline
    
    For embedded images (supports JPEG/PAA):
        <img image='path\to\image\file.paa' width='500' height='800'/>

    For links to marker locations:
        <marker name='markernamehere'>Link text</marker>

    You can also execute code:
        <execute expression='hint ""Some code"";'>Some text</execute>
*/

SHOW_INGAME_BRIEFING = true;
BRIEFING_SITUATION = "Situation text.";
BRIEFING_MISSION = "Mission text.";
BRIEFING_EXECUTION = "Execution text.";
BRIEFING_ADMIN = "Admin and Logistics text.";

//== MISSION INTRO ================================================================================
/*
    Settings here control the look of your mission intro. The TFD framework offers 2 intro modes:

    Establishing Shot (Set INTRO_USE_CAMERA_PAN to false):
      - UAV style camera view rotates around marker position
      - Short text shown in top left
      - Mission name and author shown after UAV feed closed

    Camera Pan (Set INTRO_USE_CAMERA_PAN to true):
      - Camera view translates between two points
      - Camera view points towards certain position during pan
      - Mission name and author shown during cinematic pan
*/

ENABLE_INTRO = true;
ENABLE_SUMMARY_HINT = true; // Show players summary with basic ORBAT info after intro

INTRO_USE_CAMERA_PAN = false;
INTRO_MISSION_INFO = ["Mission Name", "Author Name"];

INTRO_ESTABLISHING_SHOT_PARAMS = [
    "intro_marker", "Intro text",
    80, 80, 0, // _altitude, _radius, _startingAngle
    false // NVG view mode
];

INTRO_CAMERA_PAN_PARAMS = [
    [0,0,0], // Camera target position (where the camera is pointing)
    [0,0,0], [0,0,0], 20, // _startPos, _endPos, _duration
    "" // Sound effect to play during pan ("" for none)
];

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

TFD_CUSTOM_SR_LABELS = false; // Set to true if you want custom labels for SR channels

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

// TEAM ASSIGNMENT
// Add unit's names to these lists if you want to pre-allocate squad colour assignment
// e.g. ["s_4", "s_5", "s_6"] will assign units s_4, s_5 and s_6 to that team
TFD_RED_TEAM = [];
TFD_BLUE_TEAM = [];
TFD_YELLOW_TEAM = [];
TFD_GREEN_TEAM = [];

// SPAWN PROTECTION
ENABLE_SPAWN_PROTECTION = false; // Set this to true to enable spawn protection around the safezones
SPAWN_PROTECTION_SAFEZONES = ["safeMarkerName"]; // Triggers or marker names that are safezones, trigger names must not have quotes

// WEAPON RESTRICTION
// When enabled, un-whitelisted weapons will have increased jam chance and overheating
// Weapons in player's loadouts will automatically be whitelisted
ENABLE_WEAPON_RESTRICTION = true; 
TFD_WEAPON_WHITELIST_LOCAL = [
    "weapon_classname_here",
    "another_weapon_classname"
];

// PUNISH CIVILIAN DEATHS
/* 
    If enabled this will announce civilians that are killed by players and
    optionally will fail the mission/kick offending player back to lobby
 
    If PUNISH_CIVS_KILL_LIMIT is not -1, mission will fail when limit is reached
    If PUNISH_CIVS_KICK_PLAYERS is true then the offending player will be kicked to lobby after PUNISH_CIVS_KILLS_TO_KICK kills
*/
ENABLE_PUNISH_CIVS = false; // Set this to true to punish players killing civilians
PUNISH_CIVS_ANNOUNCE_DEATHS = true;
PUNISH_CIVS_KILL_LIMIT = -1;
PUNISH_CIVS_KICK_PLAYERS = false;
PUNISH_CIVS_KILLS_TO_KICK = 2;

// INCREASED FUEL CONSUMPTION
// Enabling this setting will increase fuel consumption on player vehicles to increase logistic requirements
ENABLE_EXTRA_FUEL_CONSUMPTION = false;
FUEL_CONSUMPTION_COEF = 1; // Adjust this value to change the intensity of the effect

// OVERHEATING EXEMPTION
// Adding weapons to this list will allow them to be fired without overheating
TFD_OVERHEAT_WHITELIST_LOCAL = [
    "HLC_wp_M134Painless", // NIArms M134 minigun
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
TFD_CUSTOM_AI_SETTINGS = [
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

// ZADE BACKPACK ON CHEST
ENABLE_ZADE_BOC = false; // Set this to true to enable backpack on chest
USE_BOC_WHITELIST = false; // Set this to true to restrict BOC only to whitelisted units
BOC_WHITELIST = ["s_1", "s_2", "s_3"]; // Add slots here you want to be able to use BOC

// BOOBYTRAPPED ITEMS
// When enabled, an explosion is created when the player picks up one of the items in the list
ENABLE_BOOBYTRAPPED_ITEMS = false;
BOOBYTRAPPED_ITEMS_LIST = [
    "someItem",
    "anotherItem"
];

//== DAC SETUP ====================================================================================

USE_DAC = false; // set this to true if using DAC

//== DON'T TOUCH ==================================================================================
// Don't change anything past this point unless you understand what you're changing
//=================================================================================================

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
WH_BLACKLIST = [];
WH_DEBUG = false; // Enable debug mode if you want to check units transfer correctly

TFD_DEBUG = false; // Used to see if TFD framework scripts are executing correctly



//== DON'T EDIT ANYTHING BENEATH THIS POINT =======================================================

// Notify the player about REJIP when they are killed
if (hasInterface) then {
    player addEventHandler ["Killed", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        [] spawn {
            sleep 5;
            hint parseText "<br/>Uh oh, looks like you're dead! Please wait in spectator until you are instructed to REJIP.<br/><br/>If you don't know when/if you are allowed to REJIP you can contact an admin or mission maker using '<t color='#fab03f' font='RobotoCondensedBold'>SHIFT + PAUSE BREAK</t>'.";
        };
    }];
};

// Some misc configuration
0 enableChannel [true, false]; 	// GLOBAL
1 enableChannel [true, false]; 	// SIDE
2 enableChannel [true, true]; 	// COMMAND
3 enableChannel [true, false]; 	// GROUP
4 enableChannel [true, false];	// VEHICLE
5 enableChannel [true, false];	// DIRECT

enableSaving [false,false];
enableSentences false;

TFD_INIT_COMPLETE = true;