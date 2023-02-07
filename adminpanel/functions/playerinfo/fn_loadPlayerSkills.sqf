/*
	Author: TheTimidShade

	Description:
		Updates player skill combo boxes when a player is selected

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

private _medicSkill = _player getVariable ["ace_medical_medicClass", parseNumber (_player getUnitTrait "Medic")];
private _engineerSkill = _player getVariable ["ACE_IsEngineer", parseNumber (_player getUnitTrait "Engineer")];
private _eodSkill = _player getVariable ["ACE_isEOD", _player getUnitTrait "ExplosiveSpecialist"];

if (isNull _player) then {
	_medicSkill = 0;
	_engineerSkill = 0;
	_eodSkill = false;
};

_medic_combo lbSetCurSel _medicSkill;
_engineer_combo lbSetCurSel _engineerSkill;
_eod_checkbox cbSetChecked _eodSkill;