/*
	Author: TheTimidShade

	Description:
		Updates toggleable button controls for admin panel

	Parameters:
		0: OJECT - Currently selected player
		
	Returns:
		NONE
*/

disableSerialization;

params ["_player"];

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX		4825

// util
#define IDC_ADMINPANEL_UTILITIES_GODMODE_BACK	4354
#define IDC_ADMINPANEL_UTILITIES_GODMODE		4932
#define IDC_ADMINPANEL_UTILITIES_INFAMMO_BACK	4352
#define IDC_ADMINPANEL_UTILITIES_INFAMMO		4933
#define IDC_ADMINPANEL_UTILITIES_GHOST_BACK		4356
#define IDC_ADMINPANEL_UTILITIES_GHOST			4934
#define IDC_ADMINPANEL_UTILITIES_ARSENAL		4936

// admin
#define IDC_ADMINPANEL_ADMIN_ZEUS_BACK		4353
#define IDC_ADMINPANEL_ADMIN_ZEUS			4942
#define IDC_ADMINPANEL_ADMIN_SERVERLOCK		4940
#define IDC_ADMINPANEL_ADMIN_SPECTATE_BACK	4359
#define IDC_ADMINPANEL_ADMIN_SPECTATE		4935
#define IDC_ADMINPANEL_ADMIN_PROMOTE_BACK	4361
#define IDC_ADMINPANEL_ADMIN_PROMOTE		4950

// colour macros // [0.98,0.69,0.25,1]
#define COL_BUTTON_TEXT_ACTIVE [1,1,1,1]
#define COL_BUTTON_TEXT_INACTIVE [1,1,1,1]
#define COL_BUTTON_ACTIVE [0.98,0.69,0.25,1]
#define COL_BUTTON_INACTIVE [0,0,0,0]

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

// get all utility controls that need updating
private _godmode_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_UTILITIES_GODMODE;
private _godmode_back = _admp_display displayCtrl IDC_ADMINPANEL_UTILITIES_GODMODE_BACK;
private _ammo_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_UTILITIES_INFAMMO;
private _ammo_back = _admp_display displayCtrl IDC_ADMINPANEL_UTILITIES_INFAMMO_BACK;
private _ghost_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_UTILITIES_GHOST;
private _ghost_back = _admp_display displayCtrl IDC_ADMINPANEL_UTILITIES_GHOST_BACK;

private _lock_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_SERVERLOCK;
private _zeus_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_ZEUS;
private _zeus_back = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_ZEUS_BACK;
private _spectate_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_SPECTATE;
private _spectate_back = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_SPECTATE_BACK;

private _promote_ctrl = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_PROMOTE;
private _promote_back = _admp_display displayCtrl IDC_ADMINPANEL_ADMIN_PROMOTE_BACK;

// update status on controls
private _godmode = _player in admp_utilities_godmode_enabledUnits;
if (_godmode && !isNull _player) then { // if selected target not found set button to inactive
	_godmode_ctrl ctrlSetTextColor COL_BUTTON_TEXT_ACTIVE;
	_godmode_back ctrlSetBackgroundColor COL_BUTTON_ACTIVE;
} else {
	_godmode_ctrl ctrlSetTextColor COL_BUTTON_TEXT_INACTIVE;
	_godmode_back ctrlSetBackgroundColor COL_BUTTON_INACTIVE;
};

private _infammo = _player in admp_utilities_infammo_enabledUnits;
if (_infammo && !isNull _player) then {
	_ammo_ctrl ctrlSetTextColor COL_BUTTON_TEXT_ACTIVE;
	_ammo_back ctrlSetBackgroundColor COL_BUTTON_ACTIVE;
} else {
	_ammo_ctrl ctrlSetTextColor COL_BUTTON_TEXT_INACTIVE;
	_ammo_back ctrlSetBackgroundColor COL_BUTTON_INACTIVE;
};

private _ghost = _player in admp_utilities_ghost_enabledUnits;
if (_ghost && !isNull _player) then {
	_ghost_ctrl ctrlSetTextColor COL_BUTTON_TEXT_ACTIVE;
	_ghost_back ctrlSetBackgroundColor COL_BUTTON_ACTIVE;
} else {
	_ghost_ctrl ctrlSetTextColor COL_BUTTON_TEXT_INACTIVE;
	_ghost_back ctrlSetBackgroundColor COL_BUTTON_INACTIVE;
};

private _hasZeus = !isNull(getAssignedCuratorLogic _player);
if (_hasZeus && !isNull _player) then {
	_zeus_ctrl ctrlSetTextColor COL_BUTTON_TEXT_ACTIVE;
	_zeus_back ctrlSetBackgroundColor COL_BUTTON_ACTIVE;
} else {
	_zeus_ctrl ctrlSetTextColor COL_BUTTON_TEXT_INACTIVE;
	_zeus_back ctrlSetBackgroundColor COL_BUTTON_INACTIVE;
};

private _spectatorActive = !isNull (findDisplay 60492);
if (_spectatorActive) then {
	_spectate_ctrl ctrlSetTextColor COL_BUTTON_TEXT_ACTIVE;
	_spectate_back ctrlSetBackgroundColor COL_BUTTON_ACTIVE;
} else {
	_spectate_ctrl ctrlSetTextColor COL_BUTTON_TEXT_INACTIVE;
	_spectate_back ctrlSetBackgroundColor COL_BUTTON_INACTIVE;
};

if (admp_admin_serverLockState) then {
	_lock_ctrl ctrlSetText "UNLOCK SERVER";
} else {
	_lock_ctrl ctrlSetText "LOCK SERVER";
};

if ((getPlayerUID _player) in admp_authorisedIDs) then {
	_promote_ctrl ctrlSetTextColor COL_BUTTON_TEXT_ACTIVE;
	_promote_back ctrlSetBackgroundColor COL_BUTTON_ACTIVE;
	_promote_ctrl ctrlSetText "REVOKE ADMIN";
} else {
	_promote_ctrl ctrlSetTextColor COL_BUTTON_TEXT_INACTIVE;
	_promote_back ctrlSetBackgroundColor COL_BUTTON_INACTIVE;
	_promote_ctrl ctrlSetText "GRANT ADMIN";
};