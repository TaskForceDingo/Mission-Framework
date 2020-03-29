/* VON Configuration
Example: 0 enableChannel [true, false]; 
Enable user ability to send text but disable voice on global channel
*/

0 enableChannel [true, false]; //Global
1 enableChannel [true, false]; //Side
2 enableChannel [false, false]; //Command
3 enableChannel [true, false]; //Group
4 enableChannel [false, false]; //Vehicle
5 enableChannel [false, false]; //Direct
6 enableChannel [false, false]; //System

//Briefing - You will still need to edit your briefing file.  If you use in game modules instead comment this out.
nul = [] execVM "scripts\briefing.sqf";

//Intro sqf file that shows players mission name/time/unit etc.  Comment out if you wish to skip any intro.
nul = [] execVM "scripts\intro.sqf";

//Radio hint settings, do not touch in this file or people will get angry about broken radios. Takes a boolean to determine if mission start hint is shown.
[true] spawn TFD_fnc_setRadio;

//Increases the fuel consumption of a player's vehicle so that support/logistics roles are now more meaningful.  comment out if you want normal fuel consumption for vehicles.
null = [] execVM "scripts\tm4_fuelUptake.sqf"; 

//Saving disabled without autosave.
enableSaving [false,false]; 

//Disable AI radio calls
enableSentences false;

//View Distance.  Turning this off will revert the game to its default MP VD of 1.5km (which looks terrible).  ACE3 module or Eden editor can also handle setting this.
setViewDistance 3000;
setObjectViewDistance 3000;

//Grass Layer - valid values are 50 (No Grass), 25, 12.5, 6.75, 3.25 (Max Grass)
setTerrainGrid 50;
