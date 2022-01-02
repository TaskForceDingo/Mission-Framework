/*
	Author: TheTimidShade

	Description:
		Handles the CBA key press for the admin panel actions

	Parameters:
		0: ARRAY - Keypress info passed by key press event
		
	Returns:
		NOTHING
*/

private _shift = _this#2;

if (player call admp_fnc_isAdmin) then {
	if (_shift) then {
		createDialog "TFD_AdminMessage";
	} else {
		createDialog "TFD_AdminPanel";
	};
} else {
	createDialog "TFD_AdminMessage";
};