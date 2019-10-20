//Execute the script to display briefing (comment out to remove in game briefing)
[] execVM "scripts\briefing.sqf";

//Execute the intro (comment out to remove intro)
[] execVM "scripts\intro.sqf";

//Setup TFAR radio channels + hint
[true] spawn TFD_fnc_setRadio;

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