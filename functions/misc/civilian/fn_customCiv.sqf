/*
	Author: TheTimidShade

	Description:
		Randomises the loadout of civilians using the headgear, facewear, uniforms, faces and voices specified below
		Best used via 'Code On Unit Created' in the Civilian Presence Module

		[_this] spawn TFD_fnc_customCiv;

	Parameters:
		0: OBJECT - Unit to apply randomisation to
		
	Returns:
		NONE
*/

params [
	["_unit", objNull, [objNull]]
];

/*
	You can get classnames to use here by placing down your civilians, editing their loadouts
	and assigning them to the same group, then setting the group's variable name to something.

	Play the mission and type into the debug console:
		[units yourCivGroupName] call TFD_fnc_getEquipmentClasses;

	This will copy some useful information to your clipboard. Use CTRL+V to paste this into an
	empty text document and you will see the classes used by your civilian units.
*/

private _headgearList = [
	"H_Bandanna_camo",
	"H_Cap_blk_Raven",
	"H_Cap_tan_specops_US",
	"H_StrawHat_dark",
	"",
	"H_Cap_grn"
];
private _facewearList = [
	"G_Squares_Tinted",
	"G_Shades_Black",
	"G_Sport_Blackred",
	""
];
private _uniformList = [
	"U_C_Poloshirt_salmon",
	"U_C_Poor_2",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour"
];
private _facesList = [
	"GreekHead_A3_08",
	"GreekHead_A3_04",
	"Mavros",
	"GreekHead_A3_05"
];
private _voicesList = [
	"male01gre",
	"male02gre",
	"male03gre"
];

if (isNull _unit) exitWith {};

// randomise headgear
private _headgear = selectRandom _headgearList;
removeHeadgear _unit;
if (_headgear != "") then {_unit addHeadgear _headgear;};

// randomise facewear
private _facewear = selectRandom _facewearList;
removeGoggles _unit;
if (_facewear != "") then {_unit addGoggles _facewear;};

// randomise uniform
private _uniform = selectRandom _uniformList;
removeUniform _unit;
if (_uniform != "") then {_unit forceAddUniform _uniform;};

// randomise face
[_unit, selectRandom _facesList] remoteExec ["setFace", 0, _unit];

// randomise voice
[_unit, selectRandom _voicesList] remoteExec ["setSpeaker", 0, _unit];