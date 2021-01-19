/*
	Author: TheTimidShade

	Description:
		Updates player medical info displays 

	Parameters:
		0: ARRAY - Array of stats from admp_fnc_getPlayerMedicalInfo
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYER_MEDICAL_STATUS	4336
#define IDC_ADMINPANEL_PLAYER_MEDICAL_HEART		4333
#define IDC_ADMINPANEL_PLAYER_MEDICAL_BLDPRES	4334
#define IDC_ADMINPANEL_PLAYER_MEDICAL_BLDVOL	4335
#define IDC_ADMINPANEL_PLAYER_MEDICAL_PAIN		4347

params ["_dataArray"];

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

// get all medical status display controls
private _status_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_MEDICAL_STATUS;
private _bpm_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_MEDICAL_HEART;
private _bldpres_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_MEDICAL_BLDPRES;
private _bldvol_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_MEDICAL_BLDVOL;
private _pain_display = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_MEDICAL_PAIN;

// update status on controls
_status_display ctrlSetStructuredText parseText ("<t size='0.8'>Status: " + _dataArray#0 + "</t>");
_bpm_display ctrlSetText ("Heart Rate: " + _dataArray#1);
_bldpres_display ctrlSetText ("Blood Pressure: " + _dataArray#2);
_bldvol_display ctrlSetText (format ["Blood Volume: %1L", _dataArray#3]);
_pain_display ctrlSetText ("Pain Level: " + _dataArray#4);