[Back to README](/README.md#documentation)

## Backpack on chest

A script version of the backpack on chest mod is included in the framework to allow players to take both backpacks and parachutes when inserting from the air. The script can be enabled/disabled in the backpack on chest section of `init.sqf`, below the spawn protection section.

By default, the script is disabled and can be enabled by changing the `ENABLE_ZADE_BOC` variable to `true`.

When the script is enabled, all players will have access to the backpack on chest actions.

To help minimise people fiddling with the backpack on chest actions, a slot whitelist can be enabled by setting the `USE_BOC_WHITELIST` variable to `true`. This will only allow units whose variable names are listed in the `BOC_WHITELIST` array to access the backpack on chest actions.

To add more units to the whitelist, simply add their variable name to the array:

```sqf
// Only units 's_3', 's_4' and 's_5' can access backpack on chest actions
BOC_WHITELIST = ["s_3", "s_4", "s_5"];
```