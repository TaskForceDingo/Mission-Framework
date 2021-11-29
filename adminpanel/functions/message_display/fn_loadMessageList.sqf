/*
	Author: TheTimidShade

	Description:
		Fills message list with messages that were sent/recieved previously
		Messages are stored on and fetched from the server so that they are preserved for crash/relog

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
#define IDC_ADMINMESSAGE_MESSAGE_VIEWER_HISTORY_LIST	8463

// get display
private _message_display = uiNamespace getVariable ['admp_messageDisplayVar', displayNull];

// get controls
private _message_history_list = _message_display displayCtrl IDC_ADMINMESSAGE_MESSAGE_VIEWER_HISTORY_LIST;

admp_message_display_history_local = admp_message_display_history_server getOrDefault [getPlayerUID player, []];

private _uid = getPlayerUID player;

// iterate over messages in reverse order (recent first)
for [{_i = (count admp_message_display_history_local - 1)}, {_i >= 0}, {_i = _i - 1}] do {
	private _currentMessage = admp_message_display_history_local#_i;
	_currentMessage params ["_senderID", "_sentAt", "_senderName", "_receiverName", "_message"];
	private ["_prefix", "_nameShown"];

	// if player sent the message show "To: ReceiverName"
	// otherwise show "From: SenderName"
	if (_senderID == _uid) then {
		_prefix = "To";
		_nameShown = _receiverName;
	} else {
		_prefix = "From";
		_nameShown = _senderName;
	};
	private _messageLabel = format ["[%1] %2: %3", _sentAt, _prefix, _nameShown];

	private _entryIndex = _message_history_list lbAdd _messageLabel;
	_message_history_list lbSetValue [_entryIndex, _i];
};

/*

[ 
 ["76561198272381832", "12:34", "TheTimidShade", "Slato", "You using the latest framework?"], 
 ["76561198272381832", "12:35", "TheTimidShade", "Slato", "You better be"], 
 ["-1", "12:36", "Nerfmanic", "All Admins", "Message to all admins"]
]

*/


	

