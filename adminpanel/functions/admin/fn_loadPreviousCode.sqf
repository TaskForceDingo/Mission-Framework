/*
	Author: TheTimidShade

	Description:
		Executed after pressing the cycle previous/next code buttons to update editbox text

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_REMOTEEXEC_EDITBOX	4725

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _edit_box = _admp_display displayCtrl IDC_ADMINPANEL_REMOTEEXEC_EDITBOX;

_edit_box ctrlSetText admp_debug_previousCode#admp_debug_codeIndex;