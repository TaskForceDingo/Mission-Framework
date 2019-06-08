//Server Init Only
if (!isServer) exitWith {};

//Update the server FPS Value across the network.
[] spawn {
	while {true} do {
		JSH_ADMIN_SERVERFPS_VALUE = diag_fps; publicVariable "JSH_ADMIN_SERVERFPS_VALUE";
		uiSleep 5;
	};
};