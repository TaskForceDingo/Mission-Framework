/*
	Author: TheTimidShade

	Description:
		Asigns names to all groups as defined in the TFD_ORBAT array
		Operates locally

	Parameters:
		NONE
		
	Returns:
		NONE

*/

{
	_n = format ["%1", _x];
	_p = _x;
	{
		
		if (_n in _x) then {
			(group _p) setGroupId [(_x select 0)];
		};

	} forEach TFD_ORBAT;

} forEach playableUnits;

