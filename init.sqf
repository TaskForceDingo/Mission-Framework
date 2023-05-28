// These are single line comments
/* These are multi line comments (note the / and * before and after) */

/* 
    Anything in a comment will not be treated as code when the script is run.

    They can safely be deleted without changing the functionality of the script but they provide
    instructions on how to use the scripts and settings so you should only delete them if you
    understand what each part of the script is doing.

    In order to make it easier to see comments and other useful syntax highlighting, you should
    download Visual Studio Code (https://code.visualstudio.com). It's free, easy to use and has
    very good SQF language support with the following extensions:

    - SQF Language by Armitxes
    - SQFLint by SkaceKachna

    This makes it A LOT easier to find mistakes in your code and also provides you autocompletion
    for most SQF commands.

    For a reference on what different parts of the syntax in this file mean, see:
    https://community.bistudio.com/wiki/SQF_Syntax
*/

//== ORBAT & RADIO ASSIGNMENT =====================================================================
/*
    The ORBAT array is used to define player groups used by various scripts (insignia, assign channel, give radio, etc).

    Format:
        ["SquadName", _SRchannel, _LRchannel, "s_1", "s_2", "s_3", ...]
    Where s_1, s_2, etc are the varnames of units in that squad

    Once you have set up your player slots with correct group and variable names, play the mission
    in singleplayer and run the following code in debug console:

        [] spawn TFD_fnc_generateORBAT;

    This will automatically generate the TFD_ORBAT array for you and copy it to your clipboard,
    simply hit CTRL + V to paste it into this file over the top of the default one.
*/

TFD_ORBAT = [
    ["Command",		8,	1,	"s_1", "s_2", "s_3"],
    ["Alpha",		1,	1,	"s_4", "s_5", "s_6", "s_7", "s_8", "s_9", "s_10", "s_11"],
    ["Bravo",		2,	1,	"s_12", "s_13", "s_14", "s_15", "s_16", "s_17", "s_18", "s_19"],
    ["Charlie",		3,	1,	"s_20", "s_21", "s_22", "s_23", "s_24", "s_25", "s_26", "s_27"],
    ["Delta",		4,	1,	"s_28", "s_29", "s_30", "s_31", "s_32", "s_33", "s_34", "s_35"]
];

// TEAM ASSIGNMENT
/*
    Add unit's names to these lists if you want to pre-allocate squad colour assignment

    Format:
        ["s_1", "s_2", "s_3"]

    Examples:
        Assign units s_3, s_4 and s_5 to red team
            TFD_RED_TEAM = ["s_3", "s_4", "s_5"];

    
*/
TFD_RED_TEAM = [];
TFD_BLUE_TEAM = [];
TFD_YELLOW_TEAM = [];
TFD_GREEN_TEAM = [];

// PATCH ASSIGNMENT
/*
    By default, players will be assigned the patch corresponding to their group name or the medic
    patch if they have ACE medical skill. You can manually choose which patch is assigned to each
    unit below.

    To add more patches, open the 'media\patches.hpp' file.

    Format:
        [["s_1", "s_2", "s_3"], "PatchClass"]

    Examples:
        Overwrite s_1 and s_2's default patch with 'Command'
            [["s_1", "s_2"], "Command"]
*/

ENABLE_PATCHES = true;
AUTOASSIGN_MEDIC_PATCH = true;

TFD_PATCH_ASSIGNMENT = [

];

/*
    The TFD_RADIO_ASSIGNMENT array below controls which radios are assigned to players when TFD_AUTOASSIGN_RADIOS is set to true.
    
    Format:
        ["RADIO_CLASS", ["Groupname", "s_n", "Leaders", "All"]]
    The second parameter (array) can be any combination of group names, unit varnames, "Leaders" which is
    used to assign the radio to group leaders or "All" which will give the radio to every player.

    The possible radios to assign are:
    STANDARD:		VIETNAM:		OTHER:
      ACRE_PRC343	  ACRE_PRC77	  ACRE_PRC148
      ACRE_PRC152					  ACRE_SEM52SL
      ACRE_PRC117F					  ACRE_SEM70
    
    Squad leaders are considered to be the first 's_n' unit in the TFD_ORBAT array entry e.g.
    TFD_ORBAT = [
        ["Command", 8, 1, "s_1", "s_2", "s_3"] << 's_1' is considered to be the leader of group 'Command'.
    ];
*/

TFD_CLEAR_RADIOS = true; // If true, will remove 343 radios that are sometimes assigned automatically
TFD_AUTOASSIGN_RADIOS = true; // True - auto assign radios using TFD_RADIO_ASSIGNMENT array, false - manually add radios to loadouts
TFD_USING_SR = true; // If you're not using SR radios (only squad leaders have radios) set this to false

// SRRADIOS are assigned to the channel in col 2 of TFD_ORBAT and use TFD_SR_CHANNELS programming settings
// LRRADIOS are assigned to the channel in col 3 of TFD_ORBAT and use TFD_LR_CHANNELS programming settings
// Radios not in these two arrays do not have channels that can be assigned
TFD_SRRADIOS = ["ACRE_PRC343", "ACRE_PRC148"];
TFD_LRRADIOS = ["ACRE_PRC152", "ACRE_SEM52SL", "ACRE_PRC117F"];

TFD_RADIO_ASSIGNMENT = [
    ["ACRE_PRC343", ["All"]], // Assign 343 SR to all units
    ["ACRE_PRC152", ["Leaders"]] // Assign 152 LR to group leaders
];

/*
    You may want some units to have different default channels to the rest of the squad,
    e.g. Have a FAC assigned to LR 2 instead of LR 1
    You can assign specific units alternate channels using the TFD_ALTERNATE_CHANNEL_ASSIGNMENT array below.

    Format:
        [["unit_1", "unit_2", "unit_3"], _SRchannel, _LRchannel]
    
    A value of -1 for _SRchannel or _LRchannel will keep that radio the same channel as the ORBAT.

    Examples:
        Overwrite s_1 and s_2's LR channel from the ORBAT to channel 2, leave the SR channel unchanged
            [["s_1", "s_2"], -1, 2]
        Overwrite s_26's SR channel to channel 1 and LR channel to channel 2
            [["s_26"], 1, 2] 
*/

TFD_ALTERNATE_CHANNEL_ASSIGNMENT = [
    
];

//== BRIEFING =====================================================================================
/*
    You can have a copy of your mission brief in the game for players to easily refer to if you want to
    Simply fill out the briefing sections below with the text from your briefing on the forums

    To add a newline put '<br/>' (without quotes) where you want the newline
    
    For embedded images (supports JPEG/PAA):
        <img image='path\to\image\file.paa' width='500' height='800'/>

    For links to marker locations:
        <marker name='markernamehere'>Link text</marker>

    You can also execute code:
        <execute expression='hint ""Some code"";'>Some text</execute>
*/

SHOW_INGAME_BRIEFING = false;
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
      - Camera view translates between multiple points
      - Camera view points towards certain positions during pan
      - Mission name and author shown during cinematic pan
*/

ENABLE_INTRO = true; // Set to false to disable intro completely
ENABLE_SUMMARY_HINT = true; // Show players summary with basic ORBAT info after intro

INTRO_USE_CAMERA_PAN = false; // false - use establishing shot, true - use camera pan
INTRO_MISSION_INFO = ["Mission Name", "Author Name"];

INTRO_ESTABLISHING_SHOT_PARAMS = [
    "intro_marker", "Intro text",
    80, 80, 0, // _altitude, _radius, _startingAngle
    false // NVG view mode
];

/*
    To add more pans to the intro, copy the block between the second set of [] below and paste it 
    after the first one, then add a ',' in between (see the commented out section below for example).
*/
INTRO_CAMERA_PAN_TEXT_DELAY = 10; // Length of time before mission name/author text appears
INTRO_CAMERA_PAN_TEXT_DURATION = 10; // Length of time before mission name/author text disappears
INTRO_CAMERA_PAN_PARAMS = [
    [
        [0,0,0],                // _target (where the camera is pointing)
        [0,0,0], [0,0,0], 20,   // _startPos, _endPos, _duration
        "tfd_intro_2"           // _sound ("" for none)
    ]/*, // <--- Remove /* before comma and after closing bracket below
    [
        getPosATL pan2target, // Use object as targets/positions to easily get coordinates
        getPosATL pan2start, getPosATL pan2end, 20,
        ""
    ]
    */
];

//== EQUIPMENT RESTRICTION ========================================================================
/*
    By default, the player's uniform is restricted to the uniform they start with. This can also be
    enabled for vests/headgear.
*/

ENABLE_GEAR_RESTRICTION = true;
GEAR_RESTRICTION_FORCE_UNIFORM = true;
GEAR_RESTRICTION_FORCE_VEST = false;
GEAR_RESTRICTION_FORCE_HELMET = false;
GEAR_RESTRICTION_UNIT_WHITELIST = []; // Units in this list will not have gear restrictions
GEAR_RESTRICTION_GEAR_WHITELIST = []; // Uniform/vest/headgear classnames in this list will not be overwritten

//== ALLOWED WEAPONS/EXEMPTIONS ===================================================================
/*
    By default, weapons the player picks up that they did not start with will have increased
    overheating and jam chance to discourage players from using enemy weapons.

    Weapons in the player's loadout will automatically be whitelisted, however you can add
    additional weapons below to whitelist them.

    You may wish to remove overheating entirely for certain weapons as some weapons (especially modded
    ones such as the M134 from NIArms) will overheat and jam very quickly. You can add them to the
    overheat whitelist to avoid this.
*/

ENABLE_WEAPON_RESTRICTION = true; 
TFD_WEAPON_WHITELIST_LOCAL = [
    "weapon_classname_here",
    "another_weapon_classname"
];

TFD_OVERHEAT_WHITELIST_LOCAL = [
    "HLC_wp_M134Painless", // NIArms M134 minigun
    "weapon_classname_here"
];

// When enabled, an explosion is created when the player picks up one of the items in the BOOBYTRAPPED_ITEMS_LIST
ENABLE_BOOBYTRAPPED_ITEMS = false;
BOOBYTRAPPED_ITEMS_LIST = [
    "someItem",
    "anotherItem"
];

//== SPAWN PROTECTION =============================================================================
/*
    When this is enabled, players who are within triggers or markers in the list below will be unable to
    fire their weapons/throw grenades/etc.
*/

ENABLE_SPAWN_PROTECTION = false; // Set this to true to enable spawn protection around the safezones
SPAWN_PROTECTION_SAFEZONES = ["safeMarkerName"]; // Triggers or marker names that are safezones, trigger names must not have quotes

//== ZADE BACKPACK ON CHEST =======================================================================
/*
    When enabled, players will be able to carry two bags one on their chest and one on their back.
    Useful for if you want to have parachute insertions without restricting unit loadouts.

    You can restrict the script to certain slots to avoid people abusing it if necessary.
*/

ENABLE_ZADE_BOC = false; // Set this to true to enable backpack on chest
USE_BOC_WHITELIST = false; // Set this to true to restrict BOC only to whitelisted units
BOC_WHITELIST = ["s_1", "s_2", "s_3"]; // Add slots here you want to be able to use BOC

//== INCREASED FUEL CONSUMPTION ===================================================================
/*
    This script can be enabled to increase fuel consumption of player vehicles to make fuel
    management more important. 'FUEL_CONSUMPTION_COEF' controls the intensity of the fuel drain.
*/

ENABLE_EXTRA_FUEL_CONSUMPTION = false;
FUEL_CONSUMPTION_COEF = 1; // Adjust this value to change the intensity of the effect

//== PUNISH CIVILIAN DEATHS =======================================================================
/* 
    If desired, harsher punishments for players killing civilians can be enabled.

    If 'PUNISH_CIVS_ANNOUNCE_DEATHS' is true, players will be shamed in global chat for killing
    civilians.

    If 'PUNISH_CIVS_KILL_LIMIT' is any number other than '-1', the mission will fail after that number
    of civilians has been killed (by players).

    Optionally, individual players who repeatedly kill civilians will be kicked to the lobby after
    'PUNISH_CIVS_KILLS_TO_KICK' civilian kills if 'PUNISH_CIVS_KICK_PLAYERS' is set to true.
*/

ENABLE_PUNISH_CIVS = false;
PUNISH_CIVS_ANNOUNCE_DEATHS = true;
PUNISH_CIVS_KILL_LIMIT = -1;
PUNISH_CIVS_KICK_PLAYERS = false;
PUNISH_CIVS_KILLS_TO_KICK = 2;

//== LOADOUT VARIATION ============================================================================
/* 
    This script can randomise parts of players loadouts to provide variation between units without
    having to manually edit variations into each loadout.

    To disable randomisation on specific slots, add them to the LOADOUT_RANDOMISATION_BLACKLIST.
*/

ENABLE_LOADOUT_RANDOMISATION = false;
RANDOM_HEADGEAR = []; // Add headgear classnames
RANDOM_FACEWEAR = []; // Add facewear classnames
RANDOM_FACES = []; // Add face classnames
LOADOUT_RANDOMISATION_BLACKLIST = [];

//== CUSTOM AI DIFFICULTY =========================================================================
/* 
    If enabled, these difficulty settings will manually overwrite the default settings assigned to units
    in the editor or via scripts.
    
    May conflict with other AI scripts that modify difficulty such as VCOM or DAC.
    
    Higher values are better, for explanation of what these values do see:
        https://community.bistudio.com/wiki/Arma_3:_AI_Skill#Sub-Skills
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

//== AI FRAMEWORKS ================================================================================

USE_DAC = false; // Set this to true if using DAC
USE_VCOM = false; // Set this to true if using VCOM

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

//== WERTHLESS HEADLESS BALANCING EXCLUSION =======================================================
/*
    Some scripts running on units can break when units are transferred to the headless client(s).

    If you don't know what this means, you probably don't need to worry about this section, but if
    required you can add units to the exclusion list using the array below:

    Unit names, group names, unit's current transport vehicle, modules synced to units and unit
    classnames will all be checked for the additional phrases.

    Format:
        ["UnitName","GroupCallsignName","SupportProviderModule1","TypeOfUnit"]
    
    Examples:
        ["BLUE1","AlphaSquad","B_Heli_Transport_01_camo_F"]
      
    Specifying "B_Heli" would stop all units with that class type from transferring to HCs
    However, if you specify "BLUE1", "NAVYBLUE10" will also be ignored
*/

ENABLE_WH = true; // Set to false to disable HC balancing
WH_BLACKLIST = [];
WH_DEBUG = false; // Enable debug mode if you want to check units transfer correctly

TFD_DEBUG = false; // Used to see if TFD framework scripts are executing correctly

//== DON'T TOUCH ==================================================================================
// Don't change anything past this point unless you understand what you're changing
//=================================================================================================

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