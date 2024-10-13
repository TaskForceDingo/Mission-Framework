[Back to README](/README.md#documentation)

## Radio setup

Radio configuration is an important step in setting up your mission. The TFD framework is set up to make configuring radio assignment simple using arrays in `init.sqf` without requiring radio items to be added to individual loadouts.

> [!WARNING]  
> Since TFD framework scripts automatically add radio items to player loadouts, adding radios into loadouts via the arsenal is not recommended as it may cause players to have more radios than intended. This can also be caused by an incorrect radio assignment settings. See the [Radio assignment](#radio-assignment) section below for more info.

## Radio assignment

Depending on your mission, you may wish to assign different types of radios to players or have a customised radio channel configuration. You can do this using the radio assignment and radio programming sections located beneath the patch assignment section of `init.sqf`.

> [!IMPORTANT]  
> In order to avoid overfilling players inventories, radios are only added if there is space in the loadout. A message will be displayed to the player and printed to the log if their radio is not able to be added.  
> 
> **Ensure that there is enough space in the loadout for the radios you want to add.** Large radios such as the AN/PRC-117F may require a backpack.

- `TFD_CLEAR_RADIOS` is a broken setting and can be ignored. It will likely be removed in a future update.
- `TFD_AUTOASSIGN_RADIOS` can be set to `false` to disable automatic radio assignment. Radios will need to be manually added to loadouts if this is disabled, but **this is not recommended**.
- `TFD_USING_SR` can be set to `false` if playing a mission with only long range radios (like vietnam/WW2). This changes the message displayed in the mission start hint to say that there are no short range radios available.

The default configuration is to assign an AN/PRC-343 to everyone as a short range radio and an AN/PRC-152 to squad leaders as a long range:

```sqf
TFD_SRRADIOS = ["ACRE_PRC343", "ACRE_PRC148"];
TFD_LRRADIOS = ["ACRE_PRC152", "ACRE_SEM52SL", "ACRE_PRC117F"];

TFD_RADIO_ASSIGNMENT = [
    ["ACRE_PRC343", ["All"]],
    ["ACRE_PRC152", ["Leaders"]]
];
```

'Squad leaders' are considered to be the first unit in each row of the TFD ORBAT.

The radios that can be assigned are:
- `ACRE_PRC343` - Not programmed
- `ACRE_PRC148`
- `ACRE_PRC152`
- `ACRE_PRC117F`
- `ACRE_PRC77` - Not programmed
- `ACRE_SEM52SL`
- `ACRE_SEM70` - Not programmed

> [!NOTE]  
> The AN/PRC-343 is not included in the programming script since it does not have a display so it makes no difference what the channels are programmed to. 
> 
> The AN/PRC-77 and SEM 70 radios are not included in the channel assignment/radio programming scripts as they do not have channels that can be assigned the same way as the other radios.

The assignment rules available are:
- `"GroupName"` - Assign this radio to each member of the group. e.g. `"Alpha"`
- `"varname"` - Assign this radio to a specific unit. e.g. `"s_3"`
- `"Leaders"` - Assign this radio to squad leaders.
- `"All"` - Assign this radio to everyone.

To add multiple rules for the same radio, add them to the rule array. e.g. To assign a AN/PRC-343 to all units, a AN/PRC-152 to squad leaders and a AN/PRC-117F to the commander (`s_1`) and FAC (`s_2`):

```sqf
TFD_RADIO_ASSIGNMENT = [
    ["ACRE_PRC343", ["All"]],
    ["ACRE_PRC152", ["Leaders"]],
    ["ACRE_PRC152", ["s_1", "s_2"]]
];
```

> [!WARNING]  
> If a rule overlaps the same slot twice, the unit may be assigned duplicate radios. e.g. If using the configuration:
> ```sqf
> TFD_RADIO_ASSIGNMENT = [
>     ["ACRE_PRC343", ["All", "s_3"]]
> ];
> ```
> Slot `s_3` will be assigned two radios since it matches both the `"All"` and `"s_3"` rules.

To change if a radio is programmed as a short range or a long range, move it to the corresponding `TFD_SRRADIOS` or `TFD_LRRADIOS` array. e.g. To change the AN/PRC-152 to be programmed as a short range radio instead:

```sqf
TFD_SRRADIOS = ["ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC152"];
TFD_LRRADIOS = ["ACRE_SEM52SL", "ACRE_PRC117F"];
```

[Back to README](/README.md#documentation)

## Assigning alternate default radio channel

To assign specific units to radio channels separate from the TFD ORBAT configuration, you can use the `TFD_ALTERNATE_CHANNEL_ASSIGNMENT` array underneath the radio assignment section of `init.sqf`.

To do this, add one or more rows to the array like so:

```sqf
TFD_ALTERNATE_CHANNEL_ASSIGNMENT = [
    [["s_1", "s_2"], -1, 2],
    [["s_3", "s_4"], 3, -1]
];
```
Each row consists of the units whose channels you want to overwrite and the new short range and long range channel to assign. A value of `-1` will leave the channel as it was configured in the ORBAT.

The configuration from the example above will overwrite `s_1` and `s_2`'s default long range channel to be channel 2 but leave their short range channel unaffected, as well as changing `s_3` and `s_4`'s default short range channel to channel 3 while not affecting their long range channel.

[Back to README](/README.md#documentation)

## Custom radio programming

If your radios have displays, you might want to configure custom labels or change which frequency the radios are programmed to. This can be done using the radio programming section of `init.sqf`, underneath the radio assignment section.

The channel labels for SR channels are left blank as by default they will be set to the name of the squad the channel is assigned to in the TFD ORBAT.

Setting `TFD_CUSTOM_SR_LABELS` to `true` will disable this behaviour and force the radio programming scripts to use the label from the `TFD_SR_CHANNELS` array.

The default configuration is:

```sqf
TFD_SR_CHANNELS = [
    [1, 311, ""],
    [2, 312, ""],
    [3, 313, ""],
    [4, 314, ""],
    [5, 315, ""],
    [6, 316, ""],
    [7, 317, ""],
    [8, 318, ""]
];

TFD_LR_CHANNELS = [
    [1, 50, "PLTNET 1"],
    [2, 51, "PLTNET 2"],
    [3, 52, "AIRNET"],
    [4, 53, "CAS"],
    [5, 54, "FIRES"],
    [6, 55, "AUX 1"],
    [7, 56, "AUX 2"]
];
```

The first item in each row is the channel number, the second is the frequency in MHz and the third is the channel label.

Different radios have different frequency ranges in ACRE (modelled based off the real radios). Radios without overlapping frequency ranges will not be able to communicate to each other.

| Radio | Frequency Range (MHz) |
| --- | --- |
| AN/PRC-343 | 2400 - 2483 | 
| AN/PRC-152 | 30 - 512 |
| AN/PRC-148 | 30 - 512 |
| AN/PRC-117F | 30 - 512 |
| AN/PRC-77 | 30 - 52.95 (Low band)<br>53 - 95.95 (High band) |
| SEM 52-SL | 46 - 65,975 |
| SEM 70 | 30 - 79,975 |

> [!CAUTION]  
> Attempting to program a radio to a frequency outside it's frequency range will cause errors and may prevent the radio from functioning properly.