/*
	Author: TheTimidShade

	Description:
		Assigns player engineer skill based on combo selection

	Parameters:
		NONE

	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX				4825
#define IDC_ADMINPANEL_PLAYER_SKILLS_ENGINEER_COMBO		27211

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _engineer_combo = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_SKILLS_ENGINEER_COMBO;

private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

//private _engineerSkill = _player getVariable ["ACE_IsEngineer", parseNumber (_player getUnitTrait "Engineer")];

private _skillSelection = _engineer_combo lbValue (lbCurSel _engineer_combo);

if (admp_aceEnabled) then {
	_player setVariable ["ACE_IsEngineer", _skillSelection, true];
}
else 
{
	_player setUnitTrait ["Engineer", [false, true]#_skillSelection];
};
