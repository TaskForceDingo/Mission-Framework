/*
	Author: TheTimidShade

	Description:
		Assigns player a patch based on TFD_ORBAT array.

		Called from 'playerSetup.sqf'

		Custom patches can be created in the 'media\insignia\insignia.hpp' file
		File needs to be 128x128px and file type .paa.

		Patches are assigned in the same order as the TFD_ORBAT array,
		e.g. insignia at index 0 will be used for the 0th squad in the ORBAT (Command)

		Default insignias are:
		- CMD
		- Alpha
		- Bravo
		- Charlie
		- Delta
		- Echo
		- Medic
		- TFDLogo

	Parameters:
		0: BOOL - Whether or not to automatically assign the medic patch to units that are medics
		
	Returns:
		NONE
*/

params [
	["_autoAssignMedicPatch", true, [true]]
];

_insignias = [
	"CMD", 		//0
	"Alpha",	//1
	"Bravo",	//2
	"Charlie",	//3
	"Delta",	//4
	"Echo"		//5
];

_name = format ["%1", player];

{
	if (_name in _x) then {
		_squadID = _forEachIndex;
		_insigniaClass = _insignias select _squadID;
		
		if (_autoAssignMedicPatch && player getVariable ["ACE_medical_medicClass", 0] > 0) then {
			[player, "Medic"] call BIS_fnc_setUnitInsignia;
		}
		else {
			[player, _insigniaClass] call BIS_fnc_setUnitInsignia;
		};
	};			
}  forEach TFD_ORBAT;