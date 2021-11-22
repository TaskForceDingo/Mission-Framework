/*
	Author: TheTimidShade

	Description:
		Gets and formats relevant info for use in admp_fnc_updateMapMarkers

	Parameters:
		0: OBJECT - Unit to retrieve marker info for
		
	Returns:
		ARRAY - [playerPos, playerDir, "markerText", "markerType", "markerColour", markerAlpha, _markerSize]
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825

params [
	["_unit", objNull, [objNull]]
];

if (isNull _unit) then {
	private _data = [[0,0,0], 0, "null", false, false];
	_data
};

private _markerText = "";
private _markerType = "";
private _markerColour = "";
private _inVehicle = false;
private _markerAlpha = 1;

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _selectedPlayer = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

private _vehicle = vehicle _unit;
private _playerCrew = [];
{if (_x in admp_playerlist_playerArray) then {_playerCrew pushBackUnique _x;};} forEach crew _vehicle;

if (_vehicle == _unit) then {
	_markerText = name _unit;
} else {
	_inVehicle = true;

	if (driver _vehicle == _unit) then { // if the unit is the driver their name should be used
		_passengers = ({alive _x} count crew _vehicle)-1; // get number of units in vehicle to display
		if (_passengers == 0) then { // dont display passenger count if there are none
			_markerText = name _unit;
		} else {
			_markerText = name _unit + format [" +%1", _passengers];
		};
		_markerAlpha = 1;

	} else {
		// if the unit is not the driver but the driver is a player, hide their marker
		if ( driver (vehicle _unit) in admp_playerlist_playerArray) then {
			_markerAlpha = 0;

		} else { // if the driver is not a player check if they are the first person in the crew array
			
			if (_playerCrew#0 == _unit) then { // display the marker if they are the first in the array
				_passengers = ({alive _x} count crew _vehicle)-1; // get number of units in vehicle to display
				if (_passengers == 0) then { // dont display passenger count if there are none
					_markerText = name _unit;
				} else {
					_markerText = name _unit + format [" +%1", _passengers];
				};
				_markerAlpha = 1;
			} else { // hide the marker if they are not the first
				_markerAlpha = 0;
			};
		};
	};
};

private _playerPos = if (_inVehicle) then {getPos _vehicle} else {getPos _unit};
private _playerDir = if (_inVehicle) then {getDir _vehicle} else {getDir _unit};

private _markerType = if (_inVehicle) then {"mil_arrow2_noShadow"} else {"mil_triangle_noShadow"};

private _markerColour = if (side _unit == sideEnemy) then {"ColorCivilian"} else {format ["Color%1", str side _unit];};
if (_unit in (units group _selectedPlayer)) then {_markerColour = "ColorWhite";}; // highlight players in players group
if (_unit == leader (group _selectedPlayer)) then {_markerColour = "ColorYellow";}; // highlight selected player's squad leader
if (_unit == leader (group _selectedPlayer)) then {_markerColour = "ColorYellow";}; // highlight selected player's squad leader

if (admp_aceEnabled) then {
	if (_unit getVariable ["ACE_isUnconscious", false]) then {_markerColour = "ColorRed";}; // highlight unconscious units if ACE is enabled
};

private _markerSize = if (_inVehicle) then {[0.75, 0.75]} else {[1, 1]};

private _dataArray = [_playerPos, _playerDir, _markerText, _markerType, _markerColour, _markerAlpha, _markerSize];
_dataArray