[Back to README](/README.md#documentation)

## Setting up the TFD ORBAT

> [!IMPORTANT]  
> If you have not already done so, you will need to set up your player slots before generating the TFD ORBAT. See [Setting up player slots](../documentation/player_slots.md) for how to do this.

The TFD ORBAT variable in `init.sqf` is a major part of the configuration, as it contains the variable names of each player slot, their squad name and their radio channel assignment. This information is used in many scripts such as team colour, radio assignment and whitelist scripts to apply scripts to individual player slots or squads.

Once your player slots are set up correctly, play the scenario in singleplayer and you should be prompted automatically to copy the newly generated ORBAT:
    
![generate orbat](/!DELETE_ME/images/generate_orbat_prompt.jpg)

If you do not receive a prompt to generate it, you may already have a different TFD ORBAT variable set. If so, you can generate an updated one by opening the debug console and executing `call TFD_fnc_generateORBAT`. This will automatically copy the new ORBAT to your clipboard.

Open your `init.sqf` file and find the line:
```sqf
TFD_ORBAT = [];
```

Select this line and paste the new ORBAT over the top of it using <kbd>CTRL</kbd>+<kbd>V</kbd>. The ORBAT should now look like this:

![generated orbat](/!DELETE_ME/images/generated_orbat.jpg)

The first number in each row is the default short range radio channel for that squad. The second number is the default long range channel. Typically the command squad is assigned to short range channel 8, and other squads are assigned channels in ascending order from channel 1.

You may wish to assign specific units in a squad to a different channel to what is in the ORBAT (e.g. set FAC to LR channel 2 instead of 1). To do this, see [Assigning alternate default radio channel](../documentation/radio_setup.md#assigning-alternate-default-radio-channel).

To update the ORBAT if you have changed your slot configuration, you can do any of the following:
- Manually update the ORBAT (by adding slots, renaming squads, etc).
- Set the `TFD_ORBAT` variable back to `TFD_ORBAT = [];` and play in singleplayer. You will be prompted to generate the ORBAT again.
- Play in singleplayer and execute `call TFD_fnc_generateORBAT` from debug console.