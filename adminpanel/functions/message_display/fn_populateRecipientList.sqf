/*
	Author: TheTimidShade

	Description:
		Fills recipient list with options relevant to current player

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINMESSAGE_PLAYER_SELECTOR	9063

// get display
private _message_display = uiNamespace getVariable ['admp_messageDisplayVar', displayNull];

// get controls
private _recipient_combo = _message_display displayCtrl IDC_ADMINMESSAGE_PLAYER_SELECTOR;

private _recipients = (allPlayers - entities "HeadlessClient_F" - [player]);

// if logged in admin add all players to recipient list
// if not, only add admins to recipient list
if (player call admp_fnc_isAdmin) then {
	private _extraOptions = [
		["All Players", "AllPlayers", -1],
		["Alive Players", "AllAlive", -1],
		["Dead Players", "AllDead", -1]
	];
	
	// add admin options
	{
		_x params ["_displayName", "_name", "_value"];

		_entryIndex = _recipient_combo lbAdd _displayName;
		_recipient_combo lbSetData [_entryIndex, _name];
		_recipient_combo lbSetValue [_entryIndex, _value];
	} forEach _extraOptions;
	
	// add individual players
	{
		_name = name _x;
		_playerIndex =  _forEachIndex;

		_entryIndex = _recipient_combo lbAdd _name;
		_recipient_combo lbSetData [_entryIndex, _name];
		_recipient_combo lbSetValue [_entryIndex, _playerIndex];
	} forEach _recipients;
} else {
	private _extraOptions = [
		["All Admins", "AllAdmins", -1]
	];
	
	{
		_x params ["_displayName", "_name", "_value"];

		_entryIndex = _recipient_combo lbAdd _displayName;
		_recipient_combo lbSetData [_entryIndex, _name];
		_recipient_combo lbSetValue [_entryIndex, _value];
	} forEach _extraOptions;

	// filter only admins
	private _filteredRecipients = [];
	{
		if ((getPlayerUID _x) in admp_authorisedIDs) then {_filteredRecipients pushBack _x;};
	} forEach _recipients;
	_recipients = _filteredRecipients;

	// add individual players
	{
		_name = name _x;
		_playerIndex = _forEachIndex;

		_entryIndex = _recipient_combo lbAdd _name;
		_recipient_combo lbSetData [_entryIndex, _name];
		_recipient_combo lbSetValue [_entryIndex, _playerIndex];
	} forEach _recipients;
};

uiNamespace setVariable ['admp_messageDisplay_validRecipients', _recipients];
_recipient_combo lbSetCurSel 0; // select first valid option