if (isNull (getAssignedCuratorLogic player)) then {
	player setVariable ["jsh_adminZeus", true, true];
	[player, clientOwner, TFD_ZEUS_GROUP] remoteExec ["APMK2_fnc_createDynamicZeus", 2, false];
	hint "Zeus Module Initialised";
	[] spawn {
		waitUntil {!alive player;};
		waitUntil {alive player;};
		deleteVehicle (getAssignedCuratorLogic player);
		player setVariable ["jsh_adminZeus", false, true];
	};
} else {
	deleteVehicle (getAssignedCuratorLogic player);
	hint "Zeus Module Removed";
	player setVariable ["jsh_adminZeus", false, true];
};