//Logic to assign the correct group name to the player and their group. Note: This is only very basic and missions with respawns will most likely break its functionality.
{
	_n = format ["%1", _x];
	_p = _x;
	{
		
		if (_n in _x) then {
			(group _p) setGroupId [(_x select 0)];
		};

	} forEach TFD_ORBAT;

} forEach playableUnits;

