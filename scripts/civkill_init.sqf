while {true} do
{
	{ 
		if (side _x == civilian) then
		{
		_x removeEventHandler ["killed", 0]; //remove the previous event handler for the killed so that there's no duplication of eventhandler
		sleep 2;
		_x addEventHandler ["Killed", {_this execVM "scripts\civilianKilled.sqf"}];
		};
	} forEach allUnits;
	sleep 5; //Adds the EH to every newly spawned cilvilian unit.
};


/* The following code is used to check your limit.  Execute in script or in a trigger.
			if (TFD_civ_deaths > 5) then //define your acceptable casualties limit here.
			{
				failMission "LOSER"; //insert script/code that activates upon limit being reached.
			};
*/