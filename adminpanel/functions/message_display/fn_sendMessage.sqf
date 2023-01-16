/*
	Author: TheTimidShade

	Description:
		Sends a message out to all receiving players

		Messages are stored in the format:
		[
			"SenderID", 	// Steam64 ID
			"SentAt",		// In game time in format HH:MM
			"SenderName",
			"ReceiverName",
			"Message text"
		]

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINMESSAGE_PLAYER_SELECTOR	9063
#define IDC_ADMINMESSAGE_MESSAGE_EDIT_BOX	8363

// get display
private _message_display = uiNamespace getVariable ['admp_messageDisplayVar', displayNull];

// get controls
private _recipient_combo = _message_display displayCtrl IDC_ADMINMESSAGE_PLAYER_SELECTOR;
private _message_edit_box = _message_display displayCtrl IDC_ADMINMESSAGE_MESSAGE_EDIT_BOX;

private _recipient = _recipient_combo lbData (lbCurSel _recipient_combo);
private _playerIndex = _recipient_combo lbValue (lbCurSel _recipient_combo);

private _allRecipients = (allPlayers - entities "HeadlessClient_F");

private _receivingPlayers = [];
switch (_recipient) do {
	case "AllPlayers": {
		_receivingPlayers = _allRecipients - [player];
	};
	case "AllAlive": {
		{
			if (alive _x && _x != player) then {
				_receivingPlayers pushBack _x;
			};
		} forEach _allRecipients;
	};
	case "AllDead": {
		{
			if (!alive _x && _x != player) then {
				_receivingPlayers pushBack _x;
			};
		} forEach _allRecipients;
	};
	case "AllAdmins": {
		{
			if ((_x call admp_fnc_isAdmin) && _x != player) then {
				_receivingPlayers pushBack _x;
			};
		} forEach _allRecipients;
	};
	default {
		private _selectionOptions = uiNamespace getVariable ['admp_messageDisplay_validRecipients', []];
		if (count _selectionOptions == 0) exitWith {hintSilent "No valid recipient!"; playSound "addItemFailed";};

		_receivingPlayers = [_selectionOptions#_playerIndex];
	};
};

private _senderID = getPlayerUID player;
private _sentAt = [dayTime, "HH:MM"] call BIS_fnc_timeToString; 

// if the message is a general announcement set sender name to 'TFD Admin' instead
private _senderName = name player;
if (_recipient in ["AllPlayers", "AllAlive", "AllDead"]) then {_senderName = "TFD Admin";};

private _recipientName = _recipient_combo lbText (lbCurSel _recipient_combo);
private _messageText = ctrlText _message_edit_box;
if (_messageText == "") exitWith {hintSilent "Cannot send empty message!"; playSound "addItemFailed";};

private _messageData = [_senderID, _sentAt, _senderName, _recipientName, _messageText];

{
	[_messageData] remoteExecCall ["admp_fnc_receiveMessage", _x, false];
} forEach _receivingPlayers;

admp_message_display_history_local pushBack _messageData;
hintSilent "Message sent!"; playSound "3DEN_notificationDefault";

if (!isNull (uiNamespace getVariable ['admp_messageDisplayVar', displayNull])) then {[] call admp_fnc_loadMessageList;};