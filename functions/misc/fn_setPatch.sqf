params [
	["_autoAssignMedicPatch", true, [true]]
];

/* Possible insignias are:
	
- CMD
- Alpha
- Bravo
- Charlie
- Delta
- Echo
- Medic
- TFDLogo

To add your own insignias, create an insignia of size 128x128px
and convert to .paa format, place in media folder, then create
a class in insignia.hpp (see existing examples in insignia.hpp)*/

/* Insignia is assigned based on squad from TFD_ORBAT array in
initPlayerLocal.sqf, i.e. first squad in TFD_ORBAT gets insignia
0, second gets insignia 1, etc. */

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