////////////////////////////////////////////////// DO NOT EDIT BELOW THIS LINE //////////////////////////////////////////////////
if (isNil "paramsArray") then { paramsArray=[0,0,0] };

// Get mission parameter to see if HeadlessClient is present and assign its name
if ("HeadlessClient" call BIS_fnc_getParamValue isEqualTo 1) then {
	
	if (isServer) then {
		HCPresent = true;
		publicVariable "HCPresent";
	};
	
	if (!hasInterface && !isServer) then {
		HCName = name player; 
		publicVariable "HCName";
	};

	} else {
	
	if (isServer) then {
		HCPresent = false;
		HCName = "NOONE";
		publicVariable "HCPresent";
		publicVariable "HCName";
	};
};

DAC_Zone = compile preprocessFile "DAC\Scripts\DAC_Init_Zone.sqf";
DAC_Objects	= compile preprocessFile "DAC\Scripts\DAC_Create_Objects.sqf";
execVM "DAC\DAC_Config_Creator.sqf";
DAC_Basic_Value = 0;

// Execute DAC on HC if present, otherwise on Server
if (HCPresent) then {
	dac_on = false;
	if (!hasInterface && !isServer) then {
		execVM "DAC\initZones.sqf";
	};
} else {
		if (isServer) then {
			execVM "DAC\initZones.sqf";
		};
};
////////////////////////////////////////////////// DO NOT EDIT ABOVE THIS LINE //////////////////////////////////////////////////

//Execute the TFAR settings
_handle = [] execVM "scripts\tfar.sqf";
waitUntil { scriptDone _handle };

//Starts the script that prevents firing/grenades/explosives at the chosen marker position
execVM "scripts\grenadeStop.sqf";

ace_cookoff_enable = false;
ace_cookoff_ammoCookoffDuration = 0;



// The below is to be used if you want to have a casualty cap for a particular side during your mission.  If not leave commented to avoid execution.
// ====================================================================================
// This section is to be pasted into your init.sqf
// [[GroupName or SIDE],100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";
// [[GroupName or SIDE],100,{code}] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// BLUFOR > NATO
// [west,100,1] execVM "functions\misc\casualtiesCapCheck.sqf";

// OPFOR > CSAT
// [east,100,1] execVM "functions\misc\casualtiesCapCheck.sqf";

// INDEPENDENT > AAF
// [independent,100,1] execVM "functions\misc\casualtiesCapCheck.sqf";



//Do not edit below and do not place any code after this point unless you don't mind waiting 120 seconds
//====================================================================================
// Werthles Headless Script Parameters
// 1. Repeating - true/Once - false,
// 2. Time between repeats (seconds),
// 3. Debug on - true/off - false,
// 4. Advanced balancing - true/Simple balancing - false,
// 5. Delay before executing (seconds),
// 6. Additional syncing time between groups transferred to try to reduce bad unit transfer caused by desyncs (seconds)
// 7. Display an initial setup report after the first cycle, showing the number of units moved to HCs,
// 8. Addition phrases to look for when checking whether to ignore.
// Unit names, group names, unit's current transport vehicle, modules synced to units and unit class names will all be checked for these phrases
// Format:
// ["UnitName","GroupCallsignName","SupportProviderModule1","TypeOfUnit"]
// E.g. ["BLUE1","AlphaSquad","B_Heli_Transport_01_camo_F"]
// Specifying "B_Heli" would stop all units with that class type from transferring to HCs
// However, if you specify "BLUE1", "NAVYBLUE10" will also be ignored
//sleep 120;
//[true,30,true,true,10,3,true,[]] execVM "scripts\WerthlesHeadless.sqf";
