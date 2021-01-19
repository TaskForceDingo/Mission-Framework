/*
	Author: TheTimidShade

	Description:
		Finds the nearest player to select based on map click position
		Returns objNull if no player can be found

	Parameters:
		0: ARRAY - Map click position [_xPos, _yPos] (map coordinates not world position)

	Returns:
		ARRAY - [_nearestPlayer, _playerArrayIndex] - [objNull, -1] if player cannot be found
*/

params ["_clickPos"];

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825
#define IDC_ADMINPANEL_MAP					4525

if (admp_playerlist_playerCount == 0) then {[objNull, -1]}; // if there are no selectable players, ignore map click

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) then {[objNull, -1]}; // check display exists

private _map_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_MAP;
private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;

_worldPos = _map_ctrl ctrlMapScreenToWorld _clickPos; // convert to world coordinates

private _closestPlayer = admp_playerlist_playerArray#0; // start with first unit in player array
private _closestDistance = _worldPos distance2D _closestPlayer;
private _closestIndex = 0;
{
	if (_worldPos distance2D _x < _closestDistance) then {_closestPlayer = _x; _closestDistance = _worldPos distance2D _x; _closestIndex = _forEachIndex;};
} forEach admp_playerlist_playerArray;

private _deadZone = (15 + 100*(ctrlMapScale _map_ctrl));
if (_closestDistance > _deadZone) then { // if the click is not close to a player, return objNull
	[objNull, -1]
} else {
	// if the player is in a vehicle and is not the driver, select the driver or the first player in the crew
	private _vehicle = vehicle _closestPlayer;

	if (_vehicle != _closestPlayer && (driver _vehicle) != _closestPlayer) then { 
		if ((driver _vehicle) in admp_playerlist_playerArray) then { // driver is a player, select them instead
			_closestPlayer = driver _vehicle;
			_closestIndex = admp_playerlist_playerArray find _closestPlayer;
		} else { // driver is not a player or there is no driver, select first player in crew
			private _playerCrew = [];
			{if (_x in admp_playerlist_playerArray) then {_playerCrew pushBackUnique _x;};} forEach crew _vehicle;
			_closestPlayer = _playerCrew#0;
			_closestIndex = admp_playerlist_playerArray find _closestPlayer;
		}
	};

	// find and select the player in the listbox
	private _foundPlayer = false;
	for "_i" from 0 to (admp_playerlist_playerCount - 1) do {
		if (_admp_playerlist_listbox lbValue (_i) == _closestIndex) then {
			_admp_playerlist_listbox lbSetCurSel _i; // select the player
			_foundPlayer = true;
		};
	};

	[_closestPlayer, _closestIndex]
};

