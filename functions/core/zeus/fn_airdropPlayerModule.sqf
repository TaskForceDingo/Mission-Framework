["TFD Framework", "Airdrop Player",
{
    params [["_position", [0,0,0], [[]], 3], ["_attachedObject", objNull, [objNull]]];

	if (isNull _attachedObject) then {
		if (isNull (missionNamespace getVariable ["tfd_airdrop_module_selected", objNull])) exitWith {
			["Place the module on a player to select them for teleport"] call zen_common_fnc_showMessage;
		};

		private _playerToDrop = missionNamespace getVariable "tfd_airdrop_module_selected";
		["WARNING", format ["Are you sure you want to airdrop %1?", name _playerToDrop], {
			params ["_attachedObject", "_position"];
			
			[format ["Airdropped %1", name _unit]] call zen_common_fnc_showMessage;
			
			private _airdropPosition = _position;
			_airdropPosition set [2, 2000];
			_attachedObject setPosATL _airdropPosition;

			false
		},{}, [_playerToDrop, _position]] call zen_common_fnc_messageBox;
	} else {if (isPlayer _attachedObject) then {
		missionNamespace setVariable ["tfd_airdrop_module_selected", _attachedObject];
		[format ["Selected %1 for airdrop", name _attachedObject]] call zen_common_fnc_showMessage;
	} else {
		["Must be placed on a player or terrain"] call zen_common_fnc_showMessage;
	};};

}, ""] call zen_custom_modules_fnc_register;