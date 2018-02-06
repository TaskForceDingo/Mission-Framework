[] spawn

{

    //CamUseNVG true; // Turns NVG vision on

    [getmarkerPos "respawn","FOB Medusa, NW Altis",80,80,230,1] spawn BIS_fnc_establishingShot; // Your establishing shot where you define the location of the camera via a named marker - default is the required respawn marker.  The next part of the array covers the text that will be displayed.

    waitUntil {!isNil "BIS_fnc_establishingShot_playing" && {!BIS_fnc_establishingShot_playing}}; // Wait until establishing shot has stopped playing

	    //CamUseNVG false; // Turns NVG vision off

10 fadeSound 3;
10 fadeMusic 3;
titleCut ["", "BLACK IN", 20]; // Length of time it takes to become completely visible from black.
sleep 3;
["Main Text Here",1,1,9,1] spawn BIS_fnc_dynamicText; // This is the first line of text and should be used for your mission name
sleep 5;
["By Author Name",1,1,9,1] spawn BIS_fnc_dynamicText; //This is for the author
sleep 10;
["Start time", str(date select 2) + "/" + str(date select 1) + "/" + str(date select 0)] call BIS_fnc_infoText; //Enter the time of your mission start here.  This is not autodetecting for time however the date is.
["Additional Text"] call BIS_fnc_infoText; //2nd line of text used to identify who you are generally, keep it short to avoid disappearing text
["Additional Text"] call BIS_fnc_infoText; //Third line of text, mainly used for location hint, keep it short to avoid disappearing text
	
	

};