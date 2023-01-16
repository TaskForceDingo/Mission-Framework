/*
	Author: TheTimidShade

	Description:
		Applies player skills/traits based on selected values

	Parameters:
		NONE

	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX				4825
#define IDC_ADMINPANEL_PLAYER_SKILLS_MEDICAL_COMBO		27210
#define IDC_ADMINPANEL_PLAYER_SKILLS_ENGINEER_COMBO		27211
#define IDC_ADMINPANEL_PLAYER_SKILLS_EOD_CHECKBOX		27910

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _medic_combo = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_SKILLS_MEDICAL_COMBO;
private _engineer_combo = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_SKILLS_ENGINEER_COMBO;
private _eod_checkbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_SKILLS_EOD_CHECKBOX;

private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player
if (isNull _player) exitWith {systemChat "No target found!"; playSound "addItemFailed";}; // if there is no selected target exit

private _medicSkill = _medic_combo lbValue (lbCurSel _medic_combo);
private _engineerSkill = _engineer_combo lbValue (lbCurSel _engineer_combo);
private _eodSkill = cbChecked _eod_checkbox;

if (admp_aceEnabled) then {	
	_player setVariable ["ace_medical_medicClass", _medicSkill, true];
	_player setVariable ["ACE_IsEngineer", _engineerSkill, true];
	_player setVariable ["ACE_isEOD", _eodSkill, true];
}
else 
{
	_player setUnitTrait ["Medic", [false, true]#_medicSkill];
	_player setUnitTrait ["Engineer", [false, true]#_engineerSkill];
	_player setUnitTrait ["ExplosiveSpecialist", _eodSkill];
};

systemChat format ["Applied skills to %1!", name _player];
playSound "3DEN_notificationDefault";