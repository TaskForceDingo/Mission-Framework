/*
	Designed to disincentivise players from obtaining specific weapons from fallen enemies that would negatively impact mission design

	Usage:

	Arguments:
	0: SCALAR: - Explosion size
	1-3: STRING - Classname of the charge that is to be detonated
*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["ENABLE_BOOBYTRAPPED_ITEMS", false])) exitWith {};
if (isNil "BOOBYTRAPPED_ITEMS_LIST" || {count BOOBYTRAPPED_ITEMS_LIST == 0}) exitWith {};

//Declare Global Variables for the Event Handler to use
TFD_BoobyTrap_explosionSize = 0;
TFD_BoobyTrap_explosionSML = "DemoCharge_Remote_Ammo_Scripted";
TFD_BoobyTrap_explosionMED = "SatchelCharge_Remote_Ammo_Scripted";
TFD_BoobyTrap_explosionLRG = "Bo_GBU12_LGB";

//Fire BoobyTrap Function
TFD_BoobyTrap_boomTime = {
	_charge = _this select 0;
	_bomb = _charge createVehicle (position player);
	_bomb setDamage 1;
};

//Add event handler
player addEventHandler [
	"Take",
	{
		_item = _this select 2;

		if (_item in BOOBYTRAPPED_ITEMS_LIST) then {
			//Select a random charge size based on the max allowable
			_charge = selectRandom [TFD_BoobyTrap_explosionSML,TFD_BoobyTrap_explosionMED,TFD_BoobyTrap_explosionLRG];

			[_charge] spawn TFD_BoobyTrap_boomTime;
		}
	}
];

TFD_DEBUG_BOOBYTRAPPED_ITEMS_COMPLETE = true;

};