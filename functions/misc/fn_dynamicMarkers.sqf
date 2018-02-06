/*
 * Author: Jam Toast 
 * Modified: 30/09/2016
 *
 * Causes markers to fade in or out depending on map zoom level
 *
 * Arguments:
 * 0: List of large markers <ARRAY>
 * 1: List of small markers <ARRAY>
 * 2: Time/Sleep between fade steps <NUMBER>
 * 3: Min zoom until fade <NUMBER>
 * 4: Max zoom until fade <NUMBER>
 *
 * Return Value:
 * Nil
 *
 * Example:
 * [ [ "marker_0" , "marker_1" ] , [ "marker_2" , "marker_3" ] , 0.005 , 0 , 0.25] spawn TFD_fnc_dynamicMarkers;
 *
 * Public: No
 *
 */
 
 // Define variables
_mL = _this select 0;
_mS = _this select 1;
_speed = _this select 2;
_min = _this select 3;
_max = _this select 4;


// Set small markers to invisible by default
{ 

	_x setMarkerAlphaLocal 0;
	
} forEach _mS;


while { alive player } do {

	// Wait until the players map is zoomed in
	waitUntil { [ [ _min , _max ] ] call BIS_fnc_isInZoom };

	// Fade large markers out
	for "_alpha" from 1.0 to -0.1 step -0.1 do
	{
		{
			_x setMarkerAlphaLocal _alpha;
		} forEach _mL;
		sleep _speed;
	};
	
	// Fade small markers in
	for "_alpha" from 0.0 to 1.0 step 0.1 do
	{
		{
			_x setMarkerAlphaLocal _alpha;
		} forEach _mS;
		sleep _speed;
	};

	
	// Wait until players map is zoomed out
	waitUntil { !([ [ _min , ( _max + 0.05 )] ] call BIS_fnc_isInZoom) };
	
	// Fade small markers out
	for "_alpha" from 1.0 to -0.1 step -0.1 do
	{
		{
			_x setMarkerAlphaLocal _alpha;
		} forEach _mS;
		sleep _speed;
	};
	
	// Fade large markers in
	for "_alpha" from 0.0 to 1.0 step 0.1 do
	{
		{
			_x setMarkerAlphaLocal _alpha;
		} forEach _mL;
		sleep _speed;
	};
};