/*
	Author: TheTimidShade

	Description:
		Is executed when admin panel interface is closed.

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_REMOTEEXEC_EDITBOX			4725

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull]; // temp
private _edit_box = _admp_display displayCtrl IDC_ADMINPANEL_REMOTEEXEC_EDITBOX;

admp_debug_latestCode = ctrlText _edit_box;