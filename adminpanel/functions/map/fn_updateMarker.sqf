/*
	Author: TheTimidShade

	Description:
		Updates the given marker with the provided parameters from admp_fnc_getMarkerInfo

	Parameters:
		0: STRING - Marker to assign parameters to (marker name)
		1: ARRAY - Array of marker parameters from admp_fnc_getMarkerInfo
		
	Returns:
		NONE
*/

params ["_marker", "_data"];

private _pos = _data#0;
private _dir = _data#1;
private _text = _data#2;
private _type = _data#3;
private _colour = _data#4;
private _alpha = _data#5;
private _size = _data#6;

// load parameters
_marker setMarkerPosLocal _pos;
_marker setMarkerDirLocal _dir;
_marker setMarkerTextLocal _text;
_marker setMarkerTypeLocal _type;
_marker setMarkerColorLocal _colour;
_marker setMarkerAlphaLocal _alpha;
_marker setMarkerSizeLocal _size;