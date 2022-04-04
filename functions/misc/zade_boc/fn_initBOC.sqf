/*
	Author: DerZade (Adapted for TFD Framework by TheTimidShade)

	Description:
		Initialises Zade Backpack on Chest script

	Parameters:
		NONE
		
	Returns:
		NONE

*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!ENABLE_ZADE_BOC) exitWith {};

if (!USE_BOC_WHITELIST || vehicleVarName player in BOC_WHITELIST) then {
     player setVariable ['BOC_ALLOWED', true, true];
} else {
     player setVariable ['BOC_ALLOWED', false, true];
};

private ["_action"];

// put backpack on chest action
_action = ["zade_boc_onChest", "Put backpack on chest", "functions\misc\zade_boc\data\actions\onchest_ca.paa",
     {[_player] call zade_boc_fnc_actionOnChest}, // statement
     {missionNamespace getVariable ['ENABLE_ZADE_BOC', false] && _player getVariable ["BOC_ALLOWED", false] && !(backpack _player isEqualTo '') && ([_player] call zade_boc_fnc_chestpack isEqualTo '')} // condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;

// put backpack on back action
_action = ["zade_boc_onBack", "Put backpack on back", "functions\misc\zade_boc\data\actions\onback_ca.paa",
     {[_player] call zade_boc_fnc_actionOnBack}, // statement
     {missionNamespace getVariable ['ENABLE_ZADE_BOC', false] && (backpack _player isEqualTo '') && !([_player] call zade_boc_fnc_chestpack isEqualTo '')} // condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;

// swap backpacks front/back action
_action = ["zade_boc_swap", "Swap backpacks", "functions\misc\zade_boc\data\actions\swap_ca.paa",
     {[_player] call zade_boc_fnc_actionSwap}, // statement
     {missionNamespace getVariable ['ENABLE_ZADE_BOC', false] && !(backpack _player isEqualTo '') && !([_player] call zade_boc_fnc_chestpack isEqualTo '')} // condition
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;

TFD_DEBUG_ZADE_BOC_COMPLETE = true;

};