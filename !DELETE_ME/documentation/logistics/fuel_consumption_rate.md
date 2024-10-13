[Back to README](/README.md#documentation)

## Fuel consumption rates

To support the inclusion of logistics roles, additional fuel drain can be enabled to require vehicles to refuel more frequently. This can be configured in the fuel consumption section of `init.sqf`, below the backpack on chest settings.

To enable increased fuel consumption, change the `ENABLE_EXTRA_FUEL_CONSUMPTION` variable to `true`. The strength of the fuel drain can be adjusted by changing the `FUEL_DRAIN_STRENGTH` variable.

```sqf
// Half the default drain rate of the script
FUEL_DRAIN_STRENGTH = 0.5;
```
> [!WARNING]  
> The `FUEL_DRAIN_STRENGTH` variable is not relative to the vehicle's fuel drain rate but the drain rate set by the original script. i.e. `FUEL_DRAIN_STRENGTH = 2` does not mean double the vehicle's normal fuel drain rate. The default setting of `FUEL_DRAIN_STRENGTH = 1` is quite aggressive and can cause some vehicle to run out of fuel very quickly. Make sure to test the setting so it is correctly balanced to your mission.