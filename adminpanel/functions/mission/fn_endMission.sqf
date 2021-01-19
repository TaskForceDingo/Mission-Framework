/*
	Author: TheTimidShade

	Description:
		Ends mission using ending selected from admin panel combobox

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_MISSION_ENDCOMBO		5426

// get admin panel display
private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _ending_combo = _admp_display displayCtrl IDC_ADMINPANEL_MISSION_ENDCOMBO;

private _ending = _ending_combo lbData (lbCurSel _ending_combo); // retrieve selection

// ask for confirmation before ending
private _message = format ["Are you sure you want to end the mission with ending '%1'?", _ending];
private _confirm = [_message, "CONFIRM MISSION ENDING", "END", "CANCEL", _admp_display] call BIS_fnc_guiMessage;

sleep 0.1;

if (_confirm) then {
	[_ending] remoteExec ["BIS_fnc_endMissionServer", 2, false];
	closeDialog 2;
};