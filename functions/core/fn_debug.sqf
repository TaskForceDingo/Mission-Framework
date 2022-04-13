/*
	Author: TheTimidShade

	Description:
		Executed on mission start if TFD_DEBUG = true
		Shows which framework scripts set to initialise on mission start are running correctly

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["TFD_DEBUG", false])) exitWith {};

private _message = ["<br/><t size='1.1' font='PuristaBold'>SCRIPT STATUS:</t>"];

if (missionNamespace getVariable ["ENABLE_INTRO", false]) then { waitUntil {missionNamespace getVariable ["INTRO_DONE", false]}; }; // Wait until intro is completed
sleep 10;

private ["_value", "_valueString", "_heading"];
{
	_x params ["_scriptName", "_valueName"];

	if (_scriptName == "HEADING") then {
		_heading = format ["<t font='PuristaSemiBold' align='left'>%1</t>", _valueName];

		_message pushBack _heading;
	} else {
		_value = missionNamespace getVariable [_valueName, false];
	
		// colour value to show status
		if (_value) then {_valueString = format ["<t color='#00ff00'>%1</t>", "Running/Done"]}
		else {_valueString = format ["<t color='#ff0000'>%1</t>", "Not Running"]};
		
		_message pushBack (format ["<t align='left'>%1</t> <t align='right'>%2</t>", _scriptName, _valueString]);
	};
} forEach [
	["HEADING", "CORE:"],
	["Set Radio:", "TFD_DEBUG_SET_RADIO_COMPLETE"],
	["Set Patch:", "TFD_DEBUG_SET_PATCH_COMPLETE"],
	["Werthless Headless:", "TFD_DEBUG_WERTHLESS_HEADLESS_RUNNING"],
	["HEADING", ""], // newline

	["HEADING", "INTRO:"],
	["Briefing:", "TFD_DEBUG_BRIEFING_COMPLETE"],
	["Intro:", "TFD_DEBUG_INTRO_COMPLETE"],
	["Mission Summary Hint:", "TFD_DEBUG_MISSION_START_HINT_COMPLETE"],
	["HEADING", ""], // newline

	["HEADING", "EQUIPMENT:"],
	["Weapon Restriction:", "TFD_DEBUG_WEAPON_RESTRICTION_RUNNING"],
	["Gear Restriction:", "TFD_DEBUG_FORCE_UNIFORM_RUNNING"],
	["Grenade Stop:", "TFD_DEBUG_GRENADE_STOP_COMPLETE"],
	["Boobytrapped Items:", "TFD_DEBUG_BOOBYTRAPPED_ITEMS_COMPLETE"],
	["Zade BOC:", "TFD_DEBUG_ZADE_BOC_COMPLETE"],
	["Loadout Randomisation:", "TFD_DEBUG_UNIT_VARIATION_COMPLETE"],
	["HEADING", ""], // newline

	["HEADING", "AI:"],
	["Punish Civilian Deaths:", "TFD_DEBUG_CIV_PUNISH_RUNNING"],
	["Custom Difficulty:", "TFD_DEBUG_CUSTOM_DIFFICULTY_RUNNING"],
	["DAC:", "TFD_DEBUG_DAC_RUNNING"],
	["HEADING", ""], // newline

	["HEADING", "MISC:"],
	["Assign Team:", "TFD_DEBUG_ASSIGN_TEAM_COMPLETE"],
	["Fuel Uptake:", "TFD_DEBUG_FUEL_UPTAKE_RUNNING"]
];

hint parseText (_message joinString "<br/>");

};