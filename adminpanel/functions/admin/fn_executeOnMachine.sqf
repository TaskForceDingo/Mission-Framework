/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Executes code from admin panel code box on the selected player's client

	Parameters:
		0: NUMBER - Exec type, 0 for selected client, 1 for server, 2 for local		
	Returns:
		NONE
*/

params ["_execType"];

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_REMOTEEXEC_EDITBOX	4725
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX	4825

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _edit_box = _admp_display displayCtrl IDC_ADMINPANEL_REMOTEEXEC_EDITBOX;
private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

private _code = ctrlText _edit_box;
admp_debug_previousCode pushBack _code;
admp_debug_codeIndex = (count admp_debug_previousCode-1); // set index to be most recent code

switch (_execType) do {
	case 0: { // use selected client
		if (isNull _player) exitWith {systemChat "No target found!"; playSound "addItemFailed";};
		[_code] remoteExec ["admp_fnc_compileAndExec", _player, false];
		systemChat format ["Executed code on %1's client!", name _player];
		playSound "3DEN_notificationDefault";
	};
	case 1: { // use server client
		[_code] remoteExec ["admp_fnc_compileAndExec", 2, false];
		systemChat "Executed code on server!";
		playSound "3DEN_notificationDefault";
	}; 
	case 2: { // use local client
		[_code] remoteExec ["admp_fnc_compileAndExec", player, false];
		systemChat "Executed code on local client!";
		playSound "3DEN_notificationDefault";
	}; 
};
