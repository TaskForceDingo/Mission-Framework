closeDialog 0;
disableSerialization;
_check = player getVariable ["jsh_adminSpectator", false];
if !(_check) then {
	["Initialize", [player,[],true]] spawn BIS_fnc_EGSpectator;
	player setVariable ["jsh_adminSpectator", true, true];
	sleep 1;
	_ctrl = findDisplay 60492 ctrlCreate ["RscButton", -1]; 
	_ctrl ctrlSetPosition [0.35,1.1,0.3,0.1]; 
	_ctrl ctrlSetText "Exit Spectator"; 
	_ctrl ctrlCommit 0; 
	_ctrl ctrlAddEventHandler ["ButtonDown",{[] spawn APMK2_fnc_spectator}];		
} else {
	["Terminate"] spawn BIS_fnc_EGSpectator;
	player setVariable ["jsh_adminSpectator", false, true];
};