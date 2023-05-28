/*
	Author: TheTimidShade

	Description:
		Logs a message to the server log, needs to be executed on the server using remoteExec

	Parameters:
		Parameters passed from Hit EH
		https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Hit
		
	Returns:
		NONE

	Example:
		["Hello world!"] remoteExec ["TFD_fnc_logToServer", 2, false];
*/

params [
	["_message", "No log message provided for TFD_fnc_logToServer", [""]]
];

if (!isServer) exitWith {};

diag_log (text _message);