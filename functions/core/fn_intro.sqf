/*
	Author: TheTimidShade

	Description:
		Handles mission intro
        Settings for this function are configured in init.sqf

	Parameters:
		NONE

	Returns:
		NONE
*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["ENABLE_INTRO", false])) exitWith {INTRO_DONE = true;};

INTRO_DONE = false;

// Check to make sure variables exist
if (isNil "INTRO_USE_CAMERA_PAN") then {INTRO_USE_CAMERA_PAN = false;};
if (isNil "INTRO_MISSION_INFO") then {INTRO_MISSION_INFO = ["Mission Name", "Author Name"];};

if (isNil "INTRO_ESTABLISHING_SHOT_PARAMS") then {
    INTRO_ESTABLISHING_SHOT_PARAMS = [
        "intro_marker", "Intro text",
        80, 80, 0,
        false
    ];
};

if (isNil "INTRO_CAMERA_PAN_PARAMS") then {
    INTRO_CAMERA_PAN_PARAMS = [
        [
            [0,0,0],
            [0,0,0], [0,0,0], 20,
            "tfd_intro_2"
        ]
    ];
};

INTRO_MISSION_INFO params ["_missionName", "_author"];
INTRO_ESTABLISHING_SHOT_PARAMS params ["_marker", "_introText", "_altitude", "_radius", "_viewAngle", "_useNVG"];

// Wait for game to pre load
["BIS_introPreload", "onPreloadFinished", {
    ["BIS_introPreload", "onPreloadFinished"] call BIS_fnc_removeStackedEventHandler;
    missionNamespace setVariable ["BIS_readyForIntro", true];
}] call BIS_fnc_addStackedEventHandler;
waitUntil {!isNil { missionNamespace getVariable "BIS_readyForIntro" } && { !isNull (findDisplay 46) }};

TFD_DEBUG_INTRO_COMPLETE = true;

if (!INTRO_USE_CAMERA_PAN) then { // Establishing shot intro
    camUseNVG _useNVG; // Enable nightvision

    // Play establishing shot
    [getMarkerPos _marker, _introText, _altitude, _radius, _viewAngle, 0] spawn BIS_fnc_establishingShot;
    waitUntil {!isNil "BIS_fnc_establishingShot_playing" && {!BIS_fnc_establishingShot_playing}};

    camUseNVG false;
    
    // Fade in and show mission text
    titleCut ["", "BLACK IN", 5];
    sleep 5;

    INTRO_DONE = true;
    [_missionName,1,1,9,1] spawn BIS_fnc_dynamicText;
    sleep 5;

    [format ["By %1", _author],1,1,9,1] spawn BIS_fnc_dynamicText;
    sleep 10;

} else { // Camera pan intro
    titleCut ["", "BLACK OUT", 0.01];

    sleep 2;

    [] spawn {
        INTRO_MISSION_INFO params ["_missionName", "_author"];

        sleep INTRO_CAMERA_PAN_TEXT_DELAY;

        [parseText format ["<t font='PuristaBold' size='2'>%1<br/></t>", _missionName], 0, 0.05, INTRO_CAMERA_PAN_TEXT_DURATION, 1, 0, 6970] spawn BIS_fnc_dynamicText;
        [parseText format ["<t font='PuristaBold' size='1'>By %1<br/></t>", _author], 0, 0.2, INTRO_CAMERA_PAN_TEXT_DURATION, 1, 0, 6971] spawn BIS_fnc_dynamicText;
    };
    
    // Create camera
    _camera = "camera" camCreate [0,0,0];
    _camera cameraEffect ["internal", "back"];
    

    {
        _x params ["_cameraTargetPos", "_cameraStartPos", "_cameraEndPos", "_panDuration", "_soundEffect"];

        // Prepare camera start
        _camera camPrepareTarget _cameraTargetPos;
        _camera camPreparePos _cameraStartPos;
        _camera camCommitPrepared 0;
        
        // Wait until camera is ready, then start the pan
        waitUntil {camCommitted _camera};
        _camera camPrepareTarget _cameraTargetPos;
        _camera camPreparePos _cameraEndPos;
       
        if (_soundEffect != "") then {playSound _soundEffect;};
        titleCut ["", "BLACK IN", 2];
        _camera camCommitPrepared _panDuration;

        sleep (_panDuration - 2);
        titleCut ["", "BLACK OUT", 2];
        sleep 2;
        waitUntil {camCommitted _camera};
    } forEach INTRO_CAMERA_PAN_PARAMS;  

    // Fade into mission
    _camera cameraEffect ["terminate", "back"];
    camDestroy _camera;
    titleCut ["", "BLACK IN", 2];
    sleep 3;
    INTRO_DONE = true;
};

};