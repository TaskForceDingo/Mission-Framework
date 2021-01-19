/*
	Author: TheTimidShade

	Description:
		Server stat displays for admin panel

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_ADMIN_SERVERFPS		4443
#define IDC_ADMINPANEL_ADMIN_ACTIVEAI		4444

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _sfps_display = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_SERVERFPS;
private _ai_display = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_ACTIVEAI;

private _sfps = admp_admin_serverFPS;
private _sfpsColour = "";

if (_sfps > 40) then {
	_sfpsColour = "#47ed00"; // green
} else {
	if (_sfps > 30) then {
		_sfpsColour = "#ffd92e"; // yellow
	} else {
		if (_sfps > 20) then {
			_sfpsColour = "#ff972e"; // orange
		}
		else {
			_sfpsColour = "#ff0000"; // red
		};
	};
};
private _sfpsStr = format ["<t color='%1'>%2</t>", _sfpsColour, _sfps];

private _ai = ({!isPlayer _x} count allUnits);
private _aiColour = "";

if (_ai < 110) then {
	_aiColour = "#47ed00"; // green
} else {
	if (_ai < 140) then {
		_aiColour = "#ffd92e"; // yellow
	} else {
		if (_ai < 170) then {
			_aiColour = "#ff972e"; // orange
		}
		else {
			_aiColour = "#ff0000"; // red
		};
	};
};
private _aiStr = format ["<t color='%1'>%2</t>", _aiColour, _ai];

_sfps_display ctrlSetStructuredText parseText ("<t size='1'>SFPS: " + _sfpsStr + "</t>");
_ai_display ctrlSetStructuredText parseText ("<t size='1'>AI: " + _aiStr + "</t>");