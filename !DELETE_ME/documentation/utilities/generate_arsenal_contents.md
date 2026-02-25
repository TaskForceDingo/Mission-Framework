[Back to README](/README.md#documentation)

## Generate arsenal contents

Sometimes you may want players to build their own loadouts from a restricted set of items. This can reduce the amount of time spent curating loadouts, particularly in multi-mission campaigns.

The `TFD_fnc_generateArsenalContents` function can be used to create an ACE arsenal from the equipment loadout of already placed units.

Some common items are always included such as:
- Basic equipment like maps, compass, watches, GPS
- CTAB devices and UAV terminals
- ACRE radios
- ACE medical supplies
- ACE equipment like defusal kits, range cards and detonators

You can always remove items from the arsenal manually after it has been generated if you want to restrict certain items.

You can generate an ACE arsenal from the editor by opening the debug console using <kbd>CTRL</kbd> + <kbd>D</kbd> and then executing any of the following commands:

```sqf
// Generate an arsenal from player loadouts
[playableUnits] call TFD_fnc_generateArsenalContents;

// Generate an arsenal from the units in group 'my_group'
[units my_group] call TFD_fnc_generateArsenalContents;

// Generate an arsenal from the units 's_1', 's_2', 's_3'
[[s_1, s_2, s_3]] call TFD_fnc_generateArsenalContents;
```

This will copy an array to your clipboard containing a list of all the items from those units.

Next, open the vehicle or crate you want to create an arsenal on and press the 'IMPORT' button in the ACE Arsenal options:

![ace arsenal import](/!DELETE_ME/images/ace_arsenal_import.jpg)

You should see the items appear in the arsenal and you can now add or remove any items as desired.

> [!TIP]  
> You may want to export the arsenal after you are satisfied with it using the 'EXPORT' button and paste the output into a `.txt` file inside your mission folder. This will give you a backup in case you want to revert any changes and allows you to easily import it into other missions if you want to reuse it.


