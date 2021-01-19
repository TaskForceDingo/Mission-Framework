/*
	Author: TheTimidShade

	Description:
		Populates mission ending drop down/combo box with endings when panel is opened

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

lbClear _ending_combo;
{
	_endType = _x;

	_entryIndex = _ending_combo lbAdd _endType;
	_ending_combo lbSetData [_entryIndex, _endType];
} forEach (admp_mission_endTypes);
_ending_combo lbSetCurSel 0;