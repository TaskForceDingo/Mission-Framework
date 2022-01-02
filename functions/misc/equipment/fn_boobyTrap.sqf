/*
	Boobytrap script - Executed locally on each player when they join the mission

	Designed to disincentivise players from obtaining specific weapons from fallen enemies that would negatively impact mission design

	Usage:

	Arguments:
	0: OBJECT - The player
	1: ARRAY[STRING] - List of strings that will trigger the boobytrap
	2: SCALAR: - Added for future upgrade 
	3-5: STRING - Classname of the charge that is to be detonated
*/


params [
	["_player", objNull],
	["_contraband", []],
	["_explosionSize",0],
	["_explosionSML", "DemoCharge_Remote_Ammo_Scripted"],
	["_explosionMED", "SatchelCharge_Remote_Ammo_Scripted"],
	["_explosionLRG", "Bo_GBU12_LGB"]
];


//Declare Global Variables for the Event Handler to use
TFD_BoobyTrap_player = _player;
TFD_BoobyTrap_contraband = _contraband;
TFD_BoobyTrap_explosionSize = _explosionSize;
TFD_BoobyTrap_explosionSML = _explosionSML;
TFD_BoobyTrap_explosionMED = _explosionMED;
TFD_BoobyTrap_explosionLRG = _explosionLRG;

//Fire BoobyTrap Function
TFD_BoobyTrap_boomTime = {
	_player = _this select 0;
	_charge = _this select 1;
	_bomb = _charge createVehicle (position _player);
	_bomb setDamage 1;
};


//Add event handler
_player addEventHandler [
	"Take",
	{
		_item = _this select 2;

		if (_item in TFD_BoobyTrap_contraband) then {
			//Select a random charge size based on the max allowable
			_charge = selectRandom [TFD_BoobyTrap_explosionSML,TFD_BoobyTrap_explosionMED,TFD_BoobyTrap_explosionLRG];

			[TFD_BoobyTrap_player, _charge] spawn TFD_BoobyTrap_boomTime;
		}
	}
]