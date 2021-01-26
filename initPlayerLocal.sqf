//== Briefing/Intro ===================================================

//Execute the script to display briefing (comment out to remove in game briefing)
[] execVM "scripts\briefing.sqf";

//Execute the intro (comment out to remove intro)
[] execVM "scripts\intro.sqf";

//== Misc =============================================================

// Setup admin panel
[] spawn admp_fnc_playerSetup;

// Remove comment to increase vehicle fuel consumption to make logistics useful
//[] spawn TFD_fnc_tm4_fuelUptake;

/* Boobytrapped items
If there are restricted enemy weapons/certain items you don't want players picking up
you can add them here to cause an explosion when picked up
*/
//[player, ["itemClass", "itemClass", "itemClass"]] spawn TFD_fnc_boobyTrap;

// Disable player's vanilla game radio channels to prevent hotmic
// Format is: channelID enableChannel [textChat, VoN];
[] spawn {
	sleep 1;
	0 enableChannel [true, false]; 	// GLOBAL
	1 enableChannel [true, false]; 	// SIDE
	2 enableChannel [true, true]; 	// COMMAND
	3 enableChannel [true, false]; 	// GROUP
	4 enableChannel [true, false];	// VEHICLE
	5 enableChannel [true, false];	// DIRECT
};

//== Do not edit ======================================================

//Disable AI radio calls
enableSentences false;
