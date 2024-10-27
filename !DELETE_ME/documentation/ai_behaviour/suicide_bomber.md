[Back to README](/README.md#documentation)

## Suicide bomber

> [!NOTE]  
> Civilian units can not be used as suicide bombers, otherwise the player might lose score/be punished for killing civilians, and the suicide bomber will not be able to automatically determine nearby targets.

A script is included to create suicide bombers by placing some code in the unit's init field. Using the default options, the suicide bomber will search for targets within a 300m radius and create a small explosion within 8m of the target.

```sqf
// A basic example using the default settings
[this] spawn TFD_fnc_suicideBomber;
```

The full options are:
```sqf
[_unit, _explosionType, _deadman, _targetDistance, _target] spawn TFD_fnc_suicideBomber;
```

| Input            | Type     | Default    | Description                                                                                                                                                              |
| ---------------- | -------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `_unit`          | `OBJECT` | `objNull`  | The unit to convert to a suicide bomber.                                                                                                                                 |
| `_explosionType` | `STRING` | `"IED_SM"` | The type of explosion to create when the bomb detonates. Must be an explosion type used by [TFD_fnc_explosion](/!DELETE_ME/documentation/effects/scripted_explosion.md). |
| `_deadman` | `BOOLEAN` | `false` | Whether or not the unit should detonate when shot/killed. |
| `_targetDistance` | `NUMBER` | `8` | The distance in metres from the target that the suicide bomber will detonate the vest. |
| `_target` | `NUMBER`/`OBJECT` | `300` | If `NUMBER` is provided, the suicide bomber will search for a target within this range (metres). If `OBJECT` is provided, the suicide bomber will attempt to reach and detonate their vest near the provided object. |

Examples (placed in unit init):
```sqf
// The bomber will create a 120mm HE explosion when getting within 12 metres of the `hq` object
[this, "SH_120", false, 12, hq] spawn TFD_fnc_suicideBomber;

// The bomber will attempt to blow up within 8 metres the `hvt` unit, or when shot
[this, "IES_LG", true, 8, hvt] spawn TFD_fnc_suicideBomber;

// The bomber will search for targets within 200 metres
[this, "IED_SM", false, 8, 200] spawn TFD_fnc_suicideBomber;
```