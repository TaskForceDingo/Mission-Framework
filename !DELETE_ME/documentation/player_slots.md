[Back to README](/README.md#documentation)

## Setting up player slots

There are a couple steps to set up player slots to work correctly with the mission framework:

1. Place player units. It is recommended to start with the command squad and a single rifle squad first. This allows the squad or loadouts to be copy pasted to easily create more squads. **The 'Platoon' compositions from the framework can be used to quickly perform this step if you want to use a standard squad configuration.**
    > **NOTE**  
    > Use vanilla units such as NATO, CSAT, AAF for player slots where possible. This ensures that there are no modded scripts interfering with the unit behaviour or loadout.
    > 
    > Using unit prefabs that match your intended role is also helpful to reduce setup time, e.g. using a NATO 'Combat Life Saver' as a medic role. This ensures that the units already have the relevant ACE skill types and makes it easier to identify different roles in the editor.

2. Set the commander role as the 'player' (red circle around icon), and all other roles as 'playable' (purple circle around icon). This ensures the mission is compatible with both singleplayer and multiplayer for easy testing.

3. Organise slots into the correct lobby order. This can be done using the Lobby Manager which can be opened with <kbd>CTRL</kbd>+<kbd>L</kbd> or `Tools > Lobby Manager`. There are several conventions that should be adhered to when ordering slots:
   - The command squad must be the first squad in the list.
   - The leader of each squad must be at the top of the squad.
   - (Optional) Support squads such as weapons teams/armour/aircraft should be ordered after any standard rifle squads.
   - (Optional) Any other roles inside a squad should be ordered in descending order of importance (e.g. Squad Leader > Medic > Team Leader, etc)

    > **IMPORTANT**  
    > If the first two conventions are not followed, scripts will still work but they may not interpret the commander and squad leader of each squad correctly.

4. Select all player slots, then press <kbd>ALT</kbd>+<kbd>N</kbd> or go to `Tools > Utilities > Name Objects` and set the 'Name' to `s` and 'Start Index' to `1`. 
    
    ![batch name](/!DELETE_ME/images/batch_name.jpg)

    Assuming your lobby order is correct, this will assign each player slot a variable name starting with the commander as `s_1` and other slots beneath that following `s_2`, `s_3`, etc. This allows scripts to easily reference individual player slots.

Your player slots should now be configured correctly. **If you add or remove slots you may need to repeat the last two steps**. You will also need to generate a fresh TFD ORBAT, or you can manually edit the ORBAT to reflect your changes. See [Setting up the TFD ORBAT](/!DELETE_ME/documentation/setting_up_orbat.md) for details.