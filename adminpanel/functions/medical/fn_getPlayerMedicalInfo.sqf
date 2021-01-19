/*
	Author: TheTimidShade

	Description:
		Gets selected player's medical stats
		Returns N/A if ace is disabled

	Parameters:
		0: OBJECT - Unit to retrieve stats from
		
	Returns:
		ARRAY - ["conscious", "bpm", "bldpres", "bldvol", "pain"]
*/

params [
	["_unit", objNull, [objNull]]
];

if (!admp_aceEnabled || isNull _unit) then {
	["N/A", "N/A", "N/A", "N/A", "N/A"]
};

private _conscious = if (_unit getVariable ["ACE_isUnconscious", false]) then {"<t color='#ff0000'>Unconscious</t>"} else {"<t color='#47ed00'>Conscious</t>"};
private _bpm = str round (_unit getVariable ["ACE_medical_heartrate", 0]);

private _pressure = _unit getVariable ["ACE_medical_bloodpressure", [0,0]];
private _bldpres = format ["%1/%2", _pressure#0, _pressure#1];

private _bldvol = (_unit getVariable ["ACE_medical_bloodvolume", 0]); 
_bldvol = (_bldvol toFixed 2);

private _pain = (_unit getVariable ["ACE_medical_pain", 0]);
private _pain = (_pain toFixed 2);

private _medInfo = [_conscious, _bpm, _bldpres, _bldvol, _pain];

_medInfo