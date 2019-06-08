_check = player getVariable ["jsh_adminAmmo", false];
if !(_check) then {
	JSH_ADMIN_INFINITEAMMO_EH = player addEventHandler["Fired", { vehicle player setVehicleAmmoDef 1 }];
	player setVariable ["jsh_adminAmmo", true, true];
	systemChat "Unlimited Ammo On";
} else {
	player removeEventHandler ["Fired", JSH_ADMIN_INFINITEAMMO_EH];
	JSH_ADMIN_INFINITEAMMO_EH = nil;
	player setVariable ["jsh_adminAmmo", false, true];
	systemChat "Unlimited Ammo Off";
};