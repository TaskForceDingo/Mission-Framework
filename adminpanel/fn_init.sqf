/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Initialises TFD adminpanel

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

#include "ADMINLIST.hpp" // set up admin list

admp_authorisedIDs = [];
{admp_authorisedIDs pushBackUnique _x;} forEach ["76561197987496729", "76561198272381832"]; // Make sure JohnnyShootos & TheTimidShade always have admin access for redundancy
{admp_authorisedIDs pushBackUnique _x;} forEach _admins;

// GLOBAL VARIABLES ///////////////////////////////////////////////////////////////////////////////

// general
admp_aceEnabled = isClass(configFile >> "CfgPatches" >> "ace_main");
admp_returnValue = -1; // used to return remote status from clients

// player camera
admp_camera = objNull;
admp_camera_attachedObject = objNull;
admp_camera_firstPersonMode = false;
admp_camera_NVGmode = false;

// player list
admp_playerlist_selectedPlayer = name player; // player should have themselves selected by default
admp_groupcombo_selectedPlayer = name player;
admp_playerlist_playerArray = [];
admp_playerlist_playerCount = 0;

// map/marker display
admp_map_markersActive = false;
admp_map_markerArray = [];

admp_map_selectedMarker = "admp_tracker_selected";
createMarkerLocal [admp_map_selectedMarker, [0,0]];
admp_map_selectedMarker setMarkerShapeLocal "ICON";
admp_map_selectedMarker setMarkerTypeLocal "mil_circle_noShadow";
admp_map_selectedMarker setMarkerColorLocal "ColorRed";
admp_map_selectedMarker setMarkerAlphaLocal 0;

// utilities list
admp_utilities_godmode_enabledUnits = [];
admp_utilities_infammo_enabledUnits = [];
admp_utilities_ghost_enabledUnits = [];
admp_utilities_infammo_EHindex = -1;

// admin
admp_admin_spectator_EHindex = -1;
admp_admin_zeusLogicGroup = grpNull;
admp_admin_serverLockState = false;
admp_admin_commandText = "";
admp_admin_serverFPS = 0;

// debug menu
admp_debug_previousCode = [];
admp_debug_codeIndex = 0;
admp_debug_latestCode = "";

// mission
admp_mission_endTypes = [];
_customDebriefs = "true" configClasses (missionConfigFile >> "CfgDebriefing"); // get custom endings from mission config
{admp_mission_endTypes pushBackUnique (configName _x)} forEach _customDebriefs;
{admp_mission_endTypes pushBackUnique _x} forEach ["CPEndTotalVictory", "loser", "endDeath"]; // add some default endings in case there are no custom ones

///////////////////////////////////////////////////////////////////////////////////////////////////

if (isServer) then { // start tracking server fps
	[] spawn {while {true} do {
		admp_admin_serverFPS = round diag_fps;
		publicVariable "admp_admin_serverFPS";
		sleep 1;
	};};
};