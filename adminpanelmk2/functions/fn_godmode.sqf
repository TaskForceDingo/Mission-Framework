_check = player getVariable ["jsh_adminGodMode", false];
if !(_check) then {
	player allowDamage false; 
	player setVariable ["jsh_adminGodMode", true, true];
	systemChat "GodMode On";
} else {
	player allowDamage true;
	player setVariable ["jsh_adminGodMode", false, true];
	systemChat "GodMode Off";
};