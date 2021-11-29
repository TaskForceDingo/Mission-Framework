/*
	Author: TheTimidShade

	Description:
		Is executed when admin message interface is opened. Populates controls with relevant data.

	Parameters:
		NONE
		
	Returns:
		NOTHING
*/

disableSerialization;

// get display
private _message_display = uiNamespace getVariable ['admp_messageDisplayVar', displayNull];

// load possible recipients
[] call admp_fnc_populateRecipientList;

// load message history
[] call admp_fnc_loadMessageList;

