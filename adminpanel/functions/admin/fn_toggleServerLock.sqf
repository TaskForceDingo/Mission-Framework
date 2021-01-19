/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Sets server lock state

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_ADMIN_SERVERLOCK		4940

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _lock_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_SERVERLOCK;

if (call BIS_fnc_admin != 2) exitWith {systemChat "You must be the currently logged in admin to perform this action!"; playSound "addItemFailed";};

if (!admp_admin_serverLockState) then {
	serverCommand "#lock";
	systemChat "Server locked!";
	playSound "3DEN_notificationDefault";
	_lock_ctrl ctrlSetText "UNLOCK SERVER";
	admp_admin_serverLockState = true; publicVariable "admp_admin_serverLockState";
} else {
	serverCommand "#unlock";
	systemChat "Server unlocked!";
	playSound "3DEN_notificationDefault";
	_lock_ctrl ctrlSetText "LOCK SERVER";
	admp_admin_serverLockState = false; publicVariable "admp_admin_serverLockState";
};