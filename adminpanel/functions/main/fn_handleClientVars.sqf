/*
	Author: TheTimidShade

	Description:
		Executed on all clients to report various states/stats to admin panel

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

while {true} do { // scary infinite loop of doom
	if (alive player) then {
		player setVariable ["admp_clientFPS", round diag_fps, true]; // report fps
	};
	if (!alive player && !isNull(getAssignedCuratorLogic player)) then {  // if the player is dead and has an assigned curator module, delete it
		deleteVehicle (getAssignedCuratorLogic player);
	};
	sleep 0.25;
};