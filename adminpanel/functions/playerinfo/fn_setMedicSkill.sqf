/*
	Author: TheTimidShade

	Description:
		Assigns player medical skill based on combo selection

	Parameters:
		NONE
		
	Returns:
		NONE
*/

disableSerialization;

// elements from ui\elements.hpp
#define IDC_ADMINPANEL_PLAYERLIST_LISTBOX				4825
#define IDC_ADMINPANEL_PLAYER_SKILLS_MEDICAL_COMBO		27210

private _admp_display = uiNamespace getVariable ['admp_displayVar', displayNull];
if (isNull _admp_display) exitWith {}; // check display exists

private _admp_playerlist_listbox = _admp_display displayCtrl IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
private _medic_combo = _admp_display displayCtrl IDC_ADMINPANEL_PLAYER_SKILLS_MEDICAL_COMBO;

private _player = [_admp_playerlist_listbox] call admp_fnc_playerFromSelection; // get selected player

private _skillSelection = _medic_combo lbValue (lbCurSel _medic_combo);

if (admp_aceEnabled) then {
	_player setVariable ["ace_medical_medicClass", _skillSelection, true];
}
else 
{
	_player setUnitTrait ["Medic", [false, true]#_skillSelection];
};
