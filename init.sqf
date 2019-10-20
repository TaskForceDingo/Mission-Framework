//Saving disabled without autosave.
enableSaving [false,false]; 

//Execute the TFAR settings
[] spawn TFD_fnc_tfar;

//Uncomment below line to enable grenade/fire stop within 150m of "noFire" marker. (Change markername/radius as desired).
//[[["noFire", 150]]] spawn TFD_fnc_grenadeStop;

// Uncomment if you wish to have a set amount of casualties before mission fail (for each side).
//Format: [side, %ofunits, endtype]

// BLUFOR > NATO
// [west,100,1] spawn TFD_fnc_casualtiesCapCheck;

// OPFOR > CSAT
// [east,100,1] spawn TFD_fnc_casualtiesCapCheck;

// INDEPENDENT > AAF
// [independent,100,1] spawn TFD_fnc_casualtiesCapCheck;




///========================= DAC/HC Setup - DO NOT CHANGE =========================== ///
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

/*REMOVE COMMENT IF USING DAC

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

*/// REMOVE COMMENT IF USING DAC

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
[true,30,false,true,60,3,false,[]] spawn TFD_fnc_WerthlesHeadless;





