[Back to README](/README.md#documentation)

## Equipment whitelist/blacklists

The framework contains several scripts to restrict/discourage players from using equipment they are not supposed to use. These whitelisting scripts can be configured in the equipment restriction/allowed weapons sections of `init.sqf`, underneath the intro configuration.

> [!TIP]  
> Classnames for players equipment can be obtained easily using the debug console by executing the commands `uniform player`, `vest player` or `headgear player`. Alternatively to easily obtain equipment classnames for all player slots open the debug console in the editor using <kbd>CTRL</kbd>+<kbd>D</kbd> and execute `[playableUnits] call TFD_fnc_getEquipmentClasses;`. This will copy all equipment classes in player loadouts to your clipboard.

> [!WARNING]  
> Some modded weapons use scripts to change the type of weapon based on conditions such as changing attachments or user actions (e.g. Modded weapons with folding stocks actually change the type of weapon to a folded variant). This can lead to some variants of the weapon experiencing overheating penalties as it's not included in the whitelist.
>
> To prevent against this, you can instead execute the `TFD_fnc_getEquipmentClasses` function in debug console after playing in singleplayer (instead of in the editor) using: `[switchableUnits] call TFD_fnc_getEquipmentClasses;` as this will get the classnames of the weapons after they have been modified by scripts.

## Gear restrictions

By default, the force uniform script will prevent the player from changing their uniform during the mission. If the player drops their uniform or swaps it for another one, it will be replaced with the uniform they were wearing when they first loaded into the mission. This can be disabled by setting the `ENABLE_GEAR_RESTRICTION` variable to `false`.

> [!TIP]  
> The force uniform script is setup to allow it to be disabled mid mission in the event that there is a mistake in it's configuration or something breaks. This can be done by setting the `ENABLE_GEAR_RESTRICTION` variable to false on a specific player (via debug console or via Zeus execute code module) by executing `ENABLE_GEAR_RESTRICTION = false;`.
>
> To disable the force uniform script for everyone, use 'GLOBAL EXEC' in the debug console.

There are two other variables, `GEAR_RESTRICTION_FORCE_VEST` and `GEAR_RESTRICTION_FORCE_HELMET` which control this same behaviour for vests and helmets respectively. These are set to `false` by default.

To exclude units from the gear restriction script, their variable name should be added to the `GEAR_RESTRICTION_UNIT_WHITELIST` array, e.g.

```sqf
// All players except s_1 and s_2 will have gear restriction applied
GEAR_RESTRICTION_UNIT_WHITELIST = ["s_1", "s_2"];
```

Individual equipment can be added to the `GEAR_RESTRICTION_GEAR_WHITELIST` array to allow players to swap to that piece of equipment. e.g. Swap to CBRN equipment part way through a mission. 

```sqf
// If a player swaps to the NATO Woodland CBRN suit it will not be removed
GEAR_RESTRICTION_GEAR_WHITELIST = ["U_B_CBRN_Suit_01_Wdl_F"];
```

## Weapon restrictions

To discourage players from discarding their weapons for enemy ones, weapons that the player did not spawn with will have increased overheating and jam chance. This does not include weapons that other players started with, so weapons from other players can be picked up if required. This can be disabled by setting the `ENABLE_WEAPON_RESTRICTION` variable to `false`.

Weapons classnames can also be manually added the whitelist using the `TFD_WEAPON_WHITELIST_LOCAL` array:

```sqf
// All players can use the default Arma 3 MX or Katiba rifles without penalties
TFD_WEAPON_WHITELIST_LOCAL = [
    "arifle_MX_F",
    "arifle_Katiba_F"
];
```

## Disabling overheating

Due to ACE's overheating calculations, some weapons (particularly large calibre modded weapons with high fire rates) are prone to ridiculous overheating. This can of course be disabled in the ACE settings in `cba_settings.sqf`, however if you want to keep overheating enabled but disable it for certain weapons that are prone to jamming, they can be added to the `TFD_OVERHEAT_WHITELIST_LOCAL` array:

```sqf
TFD_OVERHEAT_WHITELIST_LOCAL = [
    "HLC_wp_M134Painless", // NIArms M134 minigun
    "arifle_MX_F"
];
```

Weapons in this array will have their temperature reset each time they are fired so it is impossible for them to overheat.

## Boobytrapped items

> [!CAUTION]  
> This mechanic can feel extremely unfair to players if they are not made aware of it before hand, so if adding restrictions like this be sure to put warnings in the briefing (or verbally warn players) to ensure they are fully aware of the consequences.

If there are items you *really* don't want players picking up, you can add them to the `BOOBYTRAPPED_ITEMS_LIST` array and set `ENABLE_BOOBYTRAPPED_ITEMS` to `true`. This will create an explosion on the player that picks up the restricted item.

See the [Scripted explosions](/!DELETE_ME/documentation/effects/scripted_explosion.md) page to see what explosion types can be used.

```sqf
// Picking up demo charges will cause an IED explosion
ENABLE_BOOBYTRAPPED_ITEMS = true;
BOOBYTRAP_EXPLOSION_TYPE = "IED_SM";
BOOBYTRAPPED_ITEMS_LIST = [
    "DemoCharge_Remote_Mag"
];
```