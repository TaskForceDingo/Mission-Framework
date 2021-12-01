/*
	Author: TheTimidShade

	Description:
		Updates player info displays + group name

	Parameters:
		0: ARRAY - Array of stats from admp_fnc_getPlayerInfo
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYER_INFO_NAME				4327
#define IDC_ADMINPANEL_PLAYER_INFO_GRID				4328
#define IDC_ADMINPANEL_PLAYER_INFO_SIDE				4331
#define IDC_ADMINPANEL_PLAYER_INFO_FPS				4342
#define IDC_ADMINPANEL_PLAYER_INFO_VEHICLE_INFO		4329

//#define IDC_ADMINPANEL_PLAYER_GROUP_GROUPNAME		4330

params ["_dataArray"];

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

// get all playerInfo display controls
private _name_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_INFO_NAME;
private _side_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_INFO_SIDE;
private _grid_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_INFO_GRID;
private _fps_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_INFO_FPS;
private _vehicleState_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_INFO_VEHICLE_INFO;
//private _groupname_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_GROUP_GROUPNAME;

// update status on controls
_name_display ctrlSetText ("Name: " + _dataArray#0);
_side_display ctrlSetText ("Side: " + _dataArray#1);
_grid_display ctrlSetText ("Grid: " + _dataArray#2);
_fps_display ctrlSetStructuredText parseText ("<t size='0.8'>FPS: " + _dataArray#3 + "</t>");
_vehicleState_display ctrlSetText ("In Vehicle: " + _dataArray#4);
//_groupname_display ctrlSetText ("Group: " + _dataArray#5);