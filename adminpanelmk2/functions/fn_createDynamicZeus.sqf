/*

Creates a dynamic Zeus Module.
This code must be either run on the server machine or remoteExec from a client & targeting the server machine.

Syntax:
	[params] call 

Parameters:

	0: The player to be assigned the curator module
	1: The machine ID of the player to be assigned the zeus module
	2: The group to add the curator module into (i.e. createGroup sideLogic)

Example:

	TFD_ZEUS_GROUP = createGroup sideLogic;
	[player, clientOwner, TFD_ZEUS_GROUP] remoteExec ["JSH_fnc_createZeus", 2, false];

*/

params ["_player","_owner","_curatorGroup"];	

	//Prevent spawning unecessary curators
	if ((getAssignedCuratorLogic _player) isEqualTo objNull) then {

	//Spawn and configure the zeus
	_curatorModule = _curatorGroup createunit ["ModuleCurator_F", [0, 90, 90], [], 0.5, "NONE"];
	_player assignCurator _curatorModule;
	_player setVariable ['curatorModule', _curatorModule];

	//Set Zeus Varaibles
	_curatorModule setVariable ["owner", str _owner, true];
	_curatorModule setVariable ["curatorUnitOwner", str _owner];
	_curatorModule addeventhandler ["curatorObjectDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
	_curatorModule addeventhandler ["curatorGroupDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
	_curatorModule addeventhandler ["curatorWaypointDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
	_curatorModule addeventhandler ["curatorMarkerDoubleClicked",{(_this select 1) call bis_fnc_showCuratorAttributes;}];
	_curatorModule addeventhandler ["curatorFeedbackMessage",{_this call bis_fnc_showCuratorFeedbackMessage;}];
	_curatorModule addeventhandler ["curatorPinged",{_this call bis_fnc_curatorPinged;}];
	_curatorModule addeventhandler ["curatorObjectPlaced",{_this call bis_fnc_curatorObjectPlaced;}];
	_curatorModule addeventhandler ["curatorObjectEdited",{_this call bis_fnc_curatorObjectEdited;}];
	_curatorModule addeventhandler ["curatorWaypointPlaced",{_this call bis_fnc_curatorWaypointPlaced;}];


	//Loop to add all objects to the curator module
	[_curatorModule, _player] spawn {
		params ["_player", "_curatorModule"];
		while {alive _player} do {
			sleep 10;
			{
				_player addCuratorEditableObjects [[_x], true];
			} forEach entities [[], ["Logic"], true];
		};
	};

	//Waituntil loop to remove the module on player death (module does not persist through death as it is assigned to the player unit)
	[_player, _curatorModule] spawn {
		params ["_player","_curatorModule"];
		waitUntil {sleep 5; !alive _player};
		deleteVehicle _curatorModule;
	};
};
