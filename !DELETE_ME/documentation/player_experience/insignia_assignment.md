[Back to README](/README.md#documentation)

## Insignia/patch assignment

By default, the mission framework tries to assign an patch that matches the name of the squad that unit is in. This means that units in squad 'Alpha' will be assigned patch 'Alpha' if it exists, etc. If the unit has ACE medical skill, a medic patch that overwrites the squad patch will be assigned. This can be manually overwritten or disabled in the patch assignment section of `init.sqf` which should be just below the team assignment section.

- Set `ENABLE_PATCHES` to `false` to disable patch assignment. You will have to manually assign unit patches in the editor if you do this.
- Set `AUTOASSIGN_MEDIC_PATCH` to `false` to only assign squad patches.

To overwrite a slot's patch manually, add one or more rows to the `TFD_PATCH_ASSIGNMENT` array like so:

```sqf
TFD_PATCH_ASSIGNMENT = [
  [["s_1", "s_2"], "Command"],
  [["s_3", "s_4"], "Charlie"]
];
```

This will set slots `s_1` and `s_2` to have the 'Command' patch and `s_3` and `s_4` to have the 'Charlie' patch.

To add your own custom patches to the mission, see [Adding custom patches](../documentation/adding_insignias.md).