//== BRIEFING/INTRO ===============================================================================

//Execute the script to display briefing (comment out to remove in game briefing)
[] execVM "scripts\briefing.sqf";

//Execute the intro (comment out to remove intro)
[] execVM "scripts\intro.sqf";

// Mission start hint (comment out to remove summary message)
[] spawn TFD_fnc_missionStartHint;

//== MISC =========================================================================================

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

//Disable AI radio calls
enableSentences false;

// Notify the player about REJIP when they are killed
player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[] spawn {
		sleep 5;
		hint parseText "<br/>Uh oh, looks like you're dead! Please wait in spectator until you are instructed to REJIP.<br/><br/>If you don't know when/if you are allowed to REJIP you can contact an admin or mission maker using '<t color='#fab03f' font='RobotoCondensedBold'>SHIFT + PAUSE BREAK</t>'.";
	};
}];
