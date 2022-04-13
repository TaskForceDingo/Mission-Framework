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
        [0,0,0],
        [0,0,0], [0,0,0], 20,
        "tfd_intro_2"
    ];
};

INTRO_MISSION_INFO params ["_missionName", "_author"];
INTRO_ESTABLISHING_SHOT_PARAMS params ["_marker", "_introText", "_altitude", "_radius", "_viewAngle", "_useNVG"];
INTRO_CAMERA_PAN_PARAMS params ["_cameraTargetPos", "_cameraStartPos", "_cameraEndPos", "_panDuration", "_soundEffect"];

if (_panDuration < 10) then {_panDuration = 10;};

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
    // Create camera
    _camera = "camera" camCreate [0,0,0];
    _camera cameraEffect ["internal", "back"];

    // Prepare camera start
    _camera camPrepareTarget _cameraTargetPos;
    _camera camPreparePos _cameraStartPos;
    _camera camPrepareFOV 0.700;
    _camera camCommitPrepared 0;
    
    if (_soundEffect != "") then {playSound _soundEffect;};
    titleCut ["", "BLACK IN", 3];

    // Wait until camera is ready, then start the pan
    waitUntil {camCommitted _camera};
    _camera camPrepareTarget _cameraTargetPos;
    _camera camPreparePos _cameraEndPos;
    _camera camPrepareFOV 0.700;
    _camera camCommitPrepared _panDuration;

    sleep (_panDuration/3);

    // Display text
    private _textDuration = (_panDuration*2/3) - 3;
    [parseText format ["<t font='PuristaBold' size='4'>%1</t><br /><t size = '1.2'>by %2</t>", _missionName, _author], [0.2,-0.1,1,1], _textDuration, 7, 3, 0] spawn BIS_fnc_textTiles; 
    sleep _textDuration;

    // Fade into mission
    titleCut ["", "BLACK OUT", 3];
    sleep 3;
    _camera cameraEffect ["terminate", "back"];
    camDestroy _camera;
    titleCut ["", "BLACK IN", 3];
    sleep 3;
    INTRO_DONE = true;
};

};