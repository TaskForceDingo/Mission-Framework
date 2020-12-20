params [
	["_useWhitelist", true, [true]]
];

if (hasInterface) then {
     _name = format ["%1", player];
     if (_useWhitelist) then {
          if (_name in BOC_WHITELIST) then {
               player setVariable ['can_BOC',true];
          } else {
               player setVariable ['can_BOC',false];
          }
     }
     else {
          player setVariable ['can_BOC',true];
     }
};

// put backpack on chest action
_action = ["zade_boc_onChest", "Put backpack on chest", "functions\misc\zade_boc\data\actions\onchest_ca.paa",
     {[_player] call zade_boc_fnc_actionOnChest}, // statement
     {!(missionNamespace getVariable ['zade_boc_disabled',false]) && player getVariable ['can_BOC',false] && !(backpack _player isEqualTo '') && ([_player] call zade_boc_fnc_chestpack isEqualTo '')} // condition
] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;

// put backpack on back action
_action = ["zade_boc_onBack", "Put backpack on back", "functions\misc\zade_boc\data\actions\onback_ca.paa",
     {[_player] call zade_boc_fnc_actionOnBack}, // statement
     {!(missionNamespace getVariable ['zade_boc_disabled',false]) && (backpack _player isEqualTo '') && !([_player] call zade_boc_fnc_chestpack isEqualTo '')} // condition
] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;

// swap backpacks front/back action
_action = ["zade_boc_swap", "Swap backpacks", "functions\misc\zade_boc\data\actions\swap_ca.paa",
     {[_player] call zade_boc_fnc_actionSwap}, // statement
     {!(missionNamespace getVariable ['zade_boc_disabled',false]) && !(backpack _player isEqualTo '') && !([_player] call zade_boc_fnc_chestpack isEqualTo '')} // condition
] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;