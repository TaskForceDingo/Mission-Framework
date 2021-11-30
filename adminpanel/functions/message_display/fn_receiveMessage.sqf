/*
	Author: TheTimidShade

	Description:
		Local call to save/display message when player receives a message from another player

		Messages are stored in the format:
		[
			"SenderID", 	// Steam64 ID
			"SentAt",		// In game time in format HH:MM
			"SenderName",
			"ReceiverName",
			"Message text"
		]

	Parameters:
		0: ARRAY - Message array in above format
		
	Returns:
		NOTHING
*/

params [
	["_messageData", [], [[]], [5]]
];

if (_messageData isEqualTo []) exitWith {};

admp_message_display_history_local pushBack _messageData; // add message to history

_messageData params ["_senderID", "_sentAt", "_senderName", "_receiverName", "_message"];

private _title = "<t color='#fab03f' size='1.4' align='center' font='PuristaBold' underline='1'>TFD&#160;ADMIN&#160;MESSAGE</t>"; // &#160; == non breaking space
private _from = "<t align='left' font='PuristaSemibold'>FROM: " + _senderName + "</t>";
private _to = "<t align='left' font='PuristaSemibold'>TO: " + _receiverName + "</t>";
private _message = "<t align='left'>" + _message + "</t>";

_formattedMessage = parseText format ["%1<br/><br/>%2<br/>%3<br/><br/>%4", _title, _from, _to, _message];
hint _formattedMessage;

if (!isNull (uiNamespace getVariable ['admp_messageDisplayVar', displayNull])) then {[] call admp_fnc_loadMessageList;};