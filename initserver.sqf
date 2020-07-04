//Initialise Admin Panel
[] execVM "adminpanelmk2\init.sqf";

usingEstablishingShot = true; //Set to false if you are not using establishing shot (tells other scripts not to wait)
publicVariable "usingEstablishingShot";

//Saving disabled without autosave.
enableSaving [false,false];

setViewDistance 3000;
setObjectViewDistance 3000;

//Initialises custom difficulty for all non player units (Uncomment to use)
//Set difficulty in 'functions/misc/fn_customDifficulty.sqf'
//[] spawn TFD_fnc_customDifficulty;

