[Back to README](/README.md#documentation)

## Scripted explosion

A function has been created to allow for easily creating explosions without requiring much scripting knowledge. There are several explosion types that can be used.

| Type          | Description      |
| ------------- | ---------------- |
| "FRAG"        | Frag/mine        |
| "DEMO_CHARGE" | Demolition block |
| "IED_SM"      | Small IED        |
| "IED_LG"      | Large IED        |
| "RKT_60"      | 60mm Rocket      |
| "RKT_80"      | 80mm Rocket      |
| "SH_120"      | 120mm Shell      |
| "SH_82"       | 82mm Shell       |
| "GBU"         | GBU Bomb         |

> [!WARNING]  
> Be careful of where this function is called from, as it can cause duplicated explosions in multiplayer if used incorrectly. For usage in triggers, use `if (isServer)` to protect against this.

Examples:
```sqf
// Create a small frag explosion from the 'ammo_box' object
if (isServer) then {
    ["FRAG", ammo_box] call TFD_fnc_explosion;
};

// Create a GBU explosion at a specific position
if (isServer) then {
    ["GBU", [1792.08, 6042.1, 0]] call TFD_fnc_explosion;
};
```