

params ["_adminName"];


if (userInputDisabled) then
{
	disableUserInput false;
	player setVariable ["jsh_adminDisabled", false, true];
	hint format ["Your keyboard & mouse input has been restored by %1", _adminName];
}
else
{
	disableUserInput true;
	player setVariable ["jsh_adminDisabled", true, true];
	hint format ["You have had your keyboard & mouse input locked out by %1", _adminName];
};

