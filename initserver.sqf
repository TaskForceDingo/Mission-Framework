//Initialise Admin Panel
[] execVM "adminpanelmk2\init.sqf";

//Saving disabled without autosave.
enableSaving [false,false];

setViewDistance 3000;
setObjectViewDistance 3000;

//Initialises custom difficulty for all non player units (Uncomment to use)
//Set difficulty in 'functions/misc/fn_customDifficulty.sqf'
//[] spawn TFD_fnc_customDifficulty;

