 //This .sqf is used to setup TaskForce Arrowhead Radio mod in our missions.
 //#include "\task_force_radio\functions\common.sqf";
 

 //Codes and frequencies
 //These 3 below are to do with encryption
 tf_west_radio_code = "bluefor"; // This is the default encryption code for Bluefor
 tf_east_radio_code = "opfor"; // This is the default encryption code for OpFor
 tf_guer_radio_code = "independent"; // This is the default encryption code for Independent - changing this to either Bluefor/OpFor will allow them to hear each other if allied.
 
 
 //This section should not be changed as this defines which channel in TeamSpeak is used 
 tf_radio_channel_name = "TaskForceRadio";
 tf_radio_channel_password = "123";
 
 //This defines how much interference the terrain/mountains gives during a mission - ranges from 0-10.
 TF_terrain_interception_coefficient = 10;
 //Equipment
 //Long Range radios
 tf_no_auto_long_range_radio = true; //change this to true to stop TFR from auto assigning lr backpacks
 TF_defaultWestBackpack = "tf_rt1523g_big"; // This defines the standard long range radio that is automatically given to team leaders on BlueFor
 TF_defaultEastBackpack = "tf_mr3000"; // This defines the standard long range radio that is automatically given to team leaders on OpFor
 TF_defaultGuerBackpack = "tfanprc155"; // This defines the standard long range radio that is automatically given to team leaders on Independent


 //Short range team leader radios
 TF_give_personal_radio_to_regular_soldier = false; //setting this to true gives all soldiers the team lead radio which can be re-programmed
 TF_defaultWestPersonalRadio = "tf_anprc152";
 TF_defaultEastPersonalRadio = "tf_fadak";
 TF_defaultGuerPersonalRadio = "tf_anprc148jem";

 //Rifleman radios
 TF_defaultWestRiflemanRadio = "tf_rf7800str";
 TF_defaultEastRiflemanRadio = "tf_pnr1000a";
 TF_defaultGuerRiflemanRadio = "tf_anprc154";

 //DAGR reprogrammer
 TF_give_microdagr_to_soldier = false; // Set to true if you want the DAGR short range radio programmer to be given to riflemen
 
 
 
 

 
//Edit below only if you are aware of TFAR settings and what the below represents
 tf_same_sw_frequencies_for_side = true;                             // same SW freqs for each side
publicVariable "tf_same_sw_frequencies_for_side";
 
tf_same_lr_frequencies_for_side = true;                               // same LR freqs for each side
publicVariable "tf_same_lr_frequencies_for_side";
  
		// WEST
//Set SW frequencies for West
_settingsSwest = false call TFAR_fnc_generateSwSettings;                         
_settingsSwest set [2, ["311","312","313","314","315","316","317","318"]];
tf_freq_west = _settingsSWest;
publicVariable "tf_freq_west";
 //Set LR frequencies for West
_settingsLRwest = false call TFAR_fnc_generateLRSettings;                           
_settingsLRwest set [2, ["50","51","52","53","54","55","56","57","58"]]; 
tf_freq_west_lr = _settingsLRwest; 
publicVariable "tf_freq_west_lr";


		//EAST
//Set SW frequencies for East
_settingsSweast = false call TFAR_fnc_generateSwSettings;                         
_settingsSweast set [2, ["311","312","313","314","315","316","317","318"]];
tf_freq_east = _settingsSwEast;
publicVariable "tf_freq_east";
 //Set LR frequencies for East
_settingsLReast = false call TFAR_fnc_generateLRSettings;                           
_settingsLReast set [2, ["50","51","52","53","54","55","56","57","58"]]; 
tf_freq_east_lr = _settingsLReast; 
publicVariable "tf_freq_east_lr";


		//Independent
 //Set SW frequencies for Independent
_settingsSwguer = false call TFAR_fnc_generateSwSettings;                         
_settingsSwguer set [2, ["311","312","313","314","315","316","317","318"]];
tf_freq_guer = _settingsSwguer;
publicVariable "tf_freq_guer";
 //Set LR frequencies for Independent
_settingsLRguer = false call TFAR_fnc_generateLRSettings;                           
_settingsLRguer set [2, ["50","51","52","53","54","55","56","57","58"]]; 
tf_freq_guer_lr = _settingsLRguer; 
publicVariable "tf_freq_guer_lr";
 
 
 
  //========================================Do not touch below - this deals with spectator mode TFR.
 private["_unit"];

_unit = player;

// ====================================================================================

// SET SPECTATOR MODE
// If the player is alive and hence not a JIP player, the spectator voice chat will be
// disabled. If the player is dead, and hence a JIP player that hasn't selected an
// active slot, spectator chat will be enabled.

if(alive _unit) then {

	// Disable spectator chat
	[_unit, false] call TFAR_fnc_forceSpectator;

} else {

  // Enable spectator chat
  [_unit, true] call TFAR_fnc_forceSpectator;

};
 