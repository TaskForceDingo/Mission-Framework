/*
	Author: TheTimidShade

	Description:
		Creates diary records in journal for mission briefing
		Briefing text can be set in init.sqf

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["SHOW_INGAME_BRIEFING", false])) exitWith {};

if (!isNil "BRIEFING_ADMIN") then {
player createDiaryRecord ["Diary",
							["Admin and Logistics",
								format ["<font face='RobotoCondensedBold' size='16' color='#FFC145'>%1</font><br/>%2", "ADMIN AND LOGISTICS", BRIEFING_ADMIN]]];
};

if (!isNil "BRIEFING_EXECUTION") then {
player createDiaryRecord ["Diary",
							["Execution",
								format ["<font face='RobotoCondensedBold' size='16' color='#FFC145'>%1</font><br/>%2", "EXECUTION", BRIEFING_EXECUTION]]];
};

if (!isNil "BRIEFING_MISSION") then {
player createDiaryRecord ["Diary", 
							["Mission", 
								format ["<font face='RobotoCondensedBold' size='16' color='#FFC145'>%1</font><br/>%2", "MISSION", BRIEFING_MISSION]]];
};

if (!isNil "BRIEFING_SITUATION") then {
player createDiaryRecord ["Diary", 
							["Situation", 
								format ["<font face='RobotoCondensedBold' size='16' color='#FFC145'>%1</font><br/>%2", "SITUATION", BRIEFING_SITUATION]]];
};

TFD_DEBUG_BRIEFING_COMPLETE = true;

};