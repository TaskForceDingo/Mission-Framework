//Saving disabled without autosave.
enableSaving [false,false];

/* REMOVE COMMENT TO USE DAC

// HC Setup for DAC, do not edit
_allHCs = entities "HeadlessClient_F";

if (count _allHCs > 0) then {
    HCPresent = true; publicVariable "HCPresent";
    HCUnit = _allHCs select 0; publicVariable "HCUnit";
    HCName = name HCUnit; publicVariable "HCName";
} else {
    HCPresent = false; publicVariable "HCPresent";
    HCUnit = objNull; publicVariable "HCUnit";
    HCName = "NOONE"; publicVariable "HCName";
};

// Execute DAC on HC if present, otherwise on Server
if (HCPresent && (!isNull HCUnit)) then {
    [[], {
        //Message to indicate location of DAC init executions
        systemChat format ["DAC Init Scripts will be fired on %1", ["Server", HCName] select HCPresent];

        _nul = [] execVM "DAC\DAC_Config_Creator.sqf";
        systemChat "Config Creator fired";

        // Fire initzones after config creator completes
        _nul = [] execVM "DAC\initZones.sqf";
        systemChat "InitZones fired";

        

    }] remoteExec ["spawn", HCUnit];
} else {
    //Message to indicate location of DAC init executions
    systemChat format ["DAC Init Scripts will be fired on %1", ["Server", HCName] select HCPresent];

    _nul = [] execVM "DAC\DAC_Config_Creator.sqf";
    systemChat "Config Creator fired";

    // Fire initzones after config creator completes
    _nul = [] execVM "DAC\initZones.sqf";
    systemChat "InitZones fired";
};

REMOVE COMMENT TO USE DAC */