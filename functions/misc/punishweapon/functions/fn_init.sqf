/*
  Function: -

  Description:
    Initiliases punish unknown weapon script

  Parameters:
    none

  Returns:
    nothing

  Author:
  diwako 2018-06-24
*/

#include "..\settings.hpp"

if !(diwako_unknownwp_enable) exitWith {};

if !(isClass(configFile >> "CfgPatches" >> "ace_overheating")) exitWith {hintC "ACE Overheating not found! Punishing unknown weapons cannot be used!"};
if !(ace_overheating_enabled) exitWith {hintC "ACE Overheating not enabled! Punishing unknown weapons cannot be used!"};

if (missionNamespace getVariable ["diwako_unknownwp_init",false]) exitWith {};
missionNamespace setVariable ["diwako_unknownwp_init",true];

if !(ace_overheating_overheatingDispersion) then {systemChat "===Punishable weapons: Warning, ACE dispersion not enabled!==="};

if (isNil "diwako_unknownwp_local_weapons") then {
  diwako_unknownwp_local_weapons = [];
};

if (diwako_unknownwp_propagation) then {
  [] spawn {
    if (isServer) then {
      waitUntil { sleep 0.1; cba_missiontime > diwako_unknownwp_cooldown };
      diwako_unknownwp_weapon_whitelist = [];

      {
        diwako_unknownwp_weapon_whitelist pushBackUnique toUpper(primaryWeapon _x);
      } forEach ([] call CBA_fnc_players);
      
      if (typeName diwako_unknownwp_add_weapons == typeName "") then {
        diwako_unknownwp_add_weapons = diwako_unknownwp_add_weapons splitString ",";
        {
          diwako_unknownwp_weapon_whitelist pushBackUnique toUpper(_x);
        } forEach diwako_unknownwp_add_weapons;
      };
      publicVariable "diwako_unknownwp_weapon_whitelist";
    } else {
      waitUntil { sleep 1; time > 30 };
      waitUntil { sleep 1; !isNil "diwako_unknownwp_weapon_whitelist" };
      private _weaponUpper = toUpper(primaryWeapon player);
      if (!(_weaponUpper in diwako_unknownwp_weapon_whitelist || {_weaponUpper in diwako_unknownwp_local_weapons}) && (primaryWeapon player) != "") then {
        // add weapon to whitelist
        ["diwako_unknownwp_addWeapon",[primaryWeapon player]] call CBA_fnc_serverEvent;
      };
    };
  };
} else {
  diwako_unknownwp_weapon_whitelist = [];
};

if (isServer) then {
  ["diwako_unknownwp_addWeapon",{
    params ["_weapon"];
    diwako_unknownwp_weapon_whitelist pushBackUnique toUpper(_weapon);
    publicVariable "diwako_unknownwp_weapon_whitelist";

    ["diwako_unknownwp_clearWeaponStat",[_weapon]] call CBA_fnc_globalEvent;
  }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
  if (diwako_unknownwp_briefing) then {
    player createDiaryRecord ["Diary", [localize "STR_unknownwp_briefing_head",
    format ["<font size='25'>%1</font><br/><font size='15'>%2<br/><br/>%3",localize "STR_unknownwp_briefing_body1",localize "STR_unknownwp_briefing_body2",localize "STR_unknownwp_briefing_body3"]]];
  };

  player addEventHandler["Fired",{
    [_this # 1] call diwako_unknownwp_fnc_firedEh;
  }];

  player addEventHandler["Reloaded", {
    _this call diwako_unknownwp_fnc_reloadedEh;
  }];

  ["ace_weaponJammed", {
    _this call diwako_unknownwp_fnc_jammedEh;
  }] call CBA_fnc_addEventHandler;

  ["diwako_unknownwp_clearWeaponStat",{
    params ["_weapon"];
    ace_overheating_cacheWeaponData setVariable [_weapon,nil];
  }] call CBA_fnc_addEventHandler
};