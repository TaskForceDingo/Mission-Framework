/*
	Author: TheTimidShade

	Description:
		Handles creation/updating of PIP camera display

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX		4825
#define IDC_ADMINPANEL_PLAYER_CAMDISPLAY		4526

#define CAM_OFFSET [0.5, -4, 1.2]
#define CAM_OFFSET_VEHICLE [0.5, -15, 1.5]
#define CAM_FOV 0.5
#define CAM_FOV_VEHICLE 0.5
#define CAM_FOV_1PP 0.8

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
private _cam_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_CAMDISPLAY;
private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;

while {!isNull _admp_display} do {
	
	private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

	if (isNull admp_camera) then { // if camera doesn't exist, create a new one
		admp_camera = "camera" camCreate [0,0,0];
		admp_camera cameraEffect ["Internal", "Back", "admpcamrender"];
		admp_camera_attachedObject = objNull;
	};

	if (admp_camera_firstPersonMode) then { // first person
		if (!isNull attachedTo admp_camera) then { // make sure camera is not attached to anything
			detach admp_camera;
			admp_camera_attachedObject = objNull;
		};

		admp_camera camSetPos ((ASLToAGL eyePos _player) vectorAdd ((getCameraViewDirection _player) vectorMultiply 0.1));
		admp_camera camSetDir (getCameraViewDirection _player);
		admp_camera camSetFov CAM_FOV_1PP;
		admp_camera camCommit 0;
	} else { // third person
		if (admp_camera_attachedObject != vehicle _player) then {

			detach admp_camera;
			
			admp_camera_attachedObject = vehicle _player;

			if (admp_camera_attachedObject == _player) then {
				admp_camera attachTo [_player, CAM_OFFSET];
				admp_camera camSetFov CAM_FOV;
			} else {
				admp_camera attachTo [vehicle _player, CAM_OFFSET_VEHICLE];
				admp_camera camSetFov CAM_FOV_VEHICLE;
			};
		};
	};

	sleep (1/30); // update 30 times per second
};