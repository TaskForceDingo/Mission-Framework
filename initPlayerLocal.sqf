//Execute the script to display briefing (comment out to remove in game briefing)
[] execVM "scripts\briefing.sqf";

//Execute the intro (comment out to remove intro)
[] execVM "scripts\intro.sqf";

/* Used to set up insignias and radio channels

Format:
["SquadName", _channelNum, s_1, s_2, s_3, ...]
Where s_1, s_2, etc are the units in that squad

The last group array should NOT have a comma at the end. */

TFD_ORBAT = [
	["Command",		8,	"s_1", "s_2"],
	["Alpha",	 	1,	"s_3", "s_4","s_5","s_6","s_7","s_8"],
	["Bravo",	 	2,	"s_9", "s_10","s_11","s_12","s_13","s_14"],
	["Charlie",	 	3,	"s_15", "s_16","s_17","s_18","s_19","s_20"],
	["Delta",	 	4,	"s_21", "s_22","s_23","s_24","s_25","s_26"]
];

//Setup TFAR radio channels and mission hint
//Params: [_showMissionStartHint, _swDisabled, _setAdditional]
[true, false, false] spawn TFD_fnc_setRadio;

//Setup insignias
//Params: [_autoAssignMedicPatch]
[true] spawn TFD_fnc_setPatch;

//Remove comment to increase vehicle fuel consumption to make logistics useful
//[] spawn TFD_fnc_tm4_fuelUptake;

//Disable AI radio calls
enableSentences false;

//View distance settings (can also be configured in ACE settings)
setViewDistance 3000;
setObjectViewDistance 3000;

/*Boobytrapped items
If there are restricted enemy weapons/certain items you don't want players picking up
you can add them here to cause an explosion when picked up
*/
//[player, ["itemClass", "itemClass", "itemClass"]] spawn TFD_fnc_boobyTrap;

// Diwako's Punish Weapon - Allowed weapons
// Use this to manually add more weapons to the 'known' pool (is added on top of propogated weapons + weapons players have on start)
// Mainly used if you want players to be able to use weapons they do not start with.
diwako_unknownwp_local_weapons = [
	//"weapon_class_1",
	//"weapon_class_2" ...
];
