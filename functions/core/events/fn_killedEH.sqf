/*
	Author: TheTimidShade

	Description:
		Executes TFD Framework scripts when the player is killed

	Parameters:
		Parameters passed from Killed EH
		https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Killed
		
	Returns:
		NONE
*/

params ["_unit", "_killer", "_instigator", "_useEffects"];

if (!hasInterface) exitWith {};

[] spawn {
	sleep 5;
	hint parseText "<br/>Uh oh, looks like you're dead! Please wait in spectator until you are instructed to REJIP.<br/><br/>If you don't know when/if you are allowed to REJIP you can contact an admin or mission maker using '<t color='#fab03f' font='RobotoCondensedBold'>SHIFT + PAUSE BREAK</t>'.";
};