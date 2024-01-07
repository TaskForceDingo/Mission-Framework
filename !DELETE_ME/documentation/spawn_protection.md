[Back to README](/README.md#documentation)

## Spawn protection

The framework contains a spawn protection script that will prevent players from firing, throwing grenades or placing explosives inside safe zones. These safe zones are defined by the `SPAWN_PROTECTION_SAFEZONES` array in the spawn protection section of `init.sqf`, below the equipment restriction settings.

Safe zones can be either triggers (a 3D volume) or area markers (a 2D map area).

By default, the marker name 'safezone' is already included in the `SPAWN_PROTECTION_SAFEZONES` array so the only step required to add a protected spawn area is to add an area marker and call it 'safezone'.

To add new safe zones, add them to the `SPAWN_PROTECTION_SAFEZONES` array. If using a marker, the marker name must be surrounded by double quotes. If using a trigger, simply put the variable name of the trigger:

```sqf
// The area marker 'safe_marker' and the trigger 'safe_trigger' are protected areas
SPAWN_PROTECTION_SAFEZONES = ["safezone", safe_trigger];
```

> [!WARNING]  
> The safe zones do not make players invulnerable, they only prevent players from deploying their weapons. They are mainly intended to protect against misclicks/accidental grenade throws. They should not be used in areas where the players are expected to be encountering enemies as this will prevent them from returning fire.