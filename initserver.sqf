//Below are the GUID's for admins which enables access to the admin panel.
TFD_ADMINS = [
	"76561198007514110",	//Atreus
	"76561197974803128",  	//Mortified
	"76561197996594471",	//Apex
	"76561198005613267",	//Imperator
	"76561198052511971",	//Skillet
	"76561198107936410", 	//Shifty
	"76561198011140335"		//Tonny747
]; publicVariable "TFD_ADMINS";
nul = execVM "adminpanelmk2\fn_adminPanelInit.sqf";

TFD_civ_deaths = 0;
null = [] execVM "scripts\civkill_init.sqf"; //comment this out if you don't want civilian casualties counted