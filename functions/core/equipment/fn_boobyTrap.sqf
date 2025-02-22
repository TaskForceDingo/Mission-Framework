/*
    Author: TheTimidShade

    Description:
        Creates an explosion when certain items are picked up, to discourage players from picking up items that would negatively affect mission design.
        Uses explosion types from TFD_fnc_explosion.

    Parameter(s):
        NONE

    Returns:
        NONE
*/

if (!hasInterface) exitWith {};

[] spawn { // To prevent suspension from blocking mission initialisation

waitUntil {missionNamespace getVariable ["TFD_INIT_COMPLETE", false]};
if (!(missionNamespace getVariable ["ENABLE_BOOBYTRAPPED_ITEMS", false])) exitWith {};
if (isNil "BOOBYTRAPPED_ITEMS_LIST" || {count BOOBYTRAPPED_ITEMS_LIST == 0}) exitWith {};

private _logMessage = format ["[TFD BOOBYTRAP] Initialised boobytrap script with boobytrapped items: %1", missionNamespace getVariable ["BOOBYTRAPPED_ITEMS_LIST", []]];
[_logMessage] remoteExec ["TFD_fnc_logToServer", 2, false];

// Add event handler
player addEventHandler ["Take", {
    params ["_unit", "_container", "_item"];

    private _explosionType = missionNamespace getVariable ["BOOBYTRAP_EXPLOSION_TYPE", "IED_SM"];
    if (_item in (missionNamespace getVariable ["BOOBYTRAPPED_ITEMS_LIST", []])) then {
        systemChat "You picked up a boobytrapped item!";
        [_explosionType, player] call TFD_fnc_explosion;
        
        private _logMessage = format ["[TFD BOOBYTRAP] Player '%1' picked up boobytrapped item '%2'", name player, _item];
        [_logMessage] remoteExec ["TFD_fnc_logToServer", 2, false];
    }
}];

TFD_DEBUG_BOOBYTRAPPED_ITEMS_COMPLETE = true;

};