_check = player getVariable ["jsh_adminGhosting", false];
if !(_check) then {
	_p = player;
	_p setCaptive true;
	[_p, true] remoteExec ["hideObject", 0];
	player setVariable ["jsh_adminGhosting", true, true];
	systemChat "Ghosting On";
} else {
	_p = player;
	_p setCaptive false;
	[_p, false] remoteExec ["hideObject", 0];
	player setVariable ["jsh_adminGhosting", false, true];
	systemChat "Ghosting Off";
};