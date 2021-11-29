# 2021-Mission-Framework
## Mission Framework for 2021
Welcome to the TFD Framework, Admins please vet and check code prior to addition, and before merging into master framework copy on GitHub.

Mission makers please make changes you think will benefit the community and add scripts you think will be useful.

## Importing framework into mission file
1. Download latest version of the framework by selecting 'Code > Download ZIP'.
2. Extract the ZIP and copy the entire contents (not including `README.md`) into your local mission folder. This can be accessed by navigating to 'Scenario > Open Scenario Folder' in the Editor's toolbar.
3. Configure the framework to your mission. Most configuration is done in the files located in the main directory, such as `init.sqf`, `description.ext` and `cba_settings.sqf`, etc.
4. Setup any desired scripts from the `!ADDITIONAL_SCRIPTS` folder using `README.txt` instructions inside each folder.
5. **Delete `!ADDITIONAL_SCRIPTS` folder before exporting** to save mission file size.

## Changelog
Read below for complete changelog history.

### PENDING UPDATE
- Added new admin message menu to TFD Admin Panel.
  - Allows direct messages to be sent between players/admins without having to tab out of the game.
  - Message history can be viewed so the message does not get lost.
  - For admins, the new menu can be opened by pressing `SHIFT + PAUSE BREAK`.
    - Admins can use the new message system to send messages to everyone, only alive players, only dead players or individual players.
  - For non-admins, the new menu can be opened by pressing `PAUSE BREAK` (same as opening admin panel for admins).
    - Non-admins can only send messages to all admins, or individual admins.

### 28/11/2021
- Fixed report spam for channel assignment when trying to assign unused channels for the PRC-148.
- Added reporting of loaded mods to admin panel functions.
  - When a player joins with mods that are not in the 'approved' list defined in `adminpanel\mod_validation\approvedMods.hpp` it will be reported in the server log.

### 22/11/2021
Admin panel:
- Added TheTimidShade's Steam ID to admin list and debug console.
- Fixed repair/rearm/refuel using wrong locality, it should now work correctly when used on a player's vehicle that the current player is not on board.
- Changed the way the keyDown event handler is added to hopefully reduce/fix admin panel not opening sometimes.
- Added proper colour for renegade players since it was producing errors.
- Halved resolution of player view PIP display because it drops framerate quite a bit.
- Tweaked teleport controls hint to be a bit clearer.
- Added a confirmation box when teleporting groups to prevent accidentally teleporting whole squads by mistake.
- Infinite ammo now resets weapon heat on every shot to prevent weapon overheating.

General:
- Disabled custom profile facewear.
- Replaced 'Lorem ipsum' text in default endings with generic 'Mission complete' and 'Mission failed' messages (this one's for you Slato).
- Removed Diwako Punish Unknown Weapon (Rarely used + going to create smaller script to use new overheating system).
- Service aircraft script should no longer reset the aircraft to default loadout.

### 13/11/2021
Redid ACE settings so all current settings are present and up to date:  
General:
  - ACE fire is disabled (at least until it gets fixed)
  - ACE goggles tint disabled so now only dirt/dust effects are shown
  - Only engineers can repair with toolkit now (previously was anyone)
  - Locations boost training disabled for repair/medical  

Medical:
  - CPR success chance min set to 50% (lost fatal amount of blood)
    - Should mean ~3-4 attempts for successful CPR at worst case
  - CPR success chance max set to 75% (lost small amount of blood)
  - Medics can now PAK as well as Doctors
  - CPR time reduced to 10s

Overheating:
  - Overheating has been re-enabled
  - Ammo cookoff has been disabled
  - Jam chance coefficient set to 1.75
  - Unjam fail chance reduced from 0.2 to 0.1

### 06/11/2021
Medical:
- Adjusted various medical settings to try stop players from bleeding out while in Cardiac Arrest, specifically: 
    - Fatal Injuries changed to *Never*.
    - Added lines that deal with min/max CPR Success Chance.

General:
- Disabled ACE Overheating until weapon cookoff can be dealt with.
- Modified ACE View Distance settings to values in meters instead of preset values.


### 21/07/2021
- Converted `TFD_fnc_FireSupport` into a simpler and more convenient function. See comments in latest version for usage instructions.
- `TFD_fnc_ServiceJet` has been renamed to `TFD_fnc_serviceAircraft` and should now work for ALL air vehicles, not just jets.
- Garrison functions now generate groups of maximum size 8, when group size is exceeded a new group is created instead of having the entire garrison in one group.
- Added the ability to grant players access to the admin panel mid mission without having to use debug console. Only the currently logged in admin is able to grant/revoke admin panel access.

### 23/04/2021
- Updated adminpanel/debug UIDs at admin request.
- Adjusted ACE view distance settings slightly:
  - Increased maximum view distance cap from 3km to 5km.
  - Default infantry view distance changed to 1.5km.
  - Default land vehicle view distance changed to 2km.
  - Default air vehicle view distance changed to 4km.
  - All infantry, land and air view distances are **NOT** forced, so client settings will override these allowing players to change the view distances to suit their hardware/preference if desired. (Still cannot exceed 5km view distance cap)

### 14/03/2021
- Implemented a new auto-assign radio system to avoid the need to manually configure radio assignment in loadouts.
  - This will be enabled by default on new missions using this version of the framework, but can be disabled if you would rather manually add the radios.
  - Radios can be assigned to groups, individual units or squad leaders. See latest `init.sqf` for an example.
- Consolidated all radio related configuration into `init.sqf` to avoid the need to dig through the function folders to setup radios and for ease of configuration.
- Renamed `civpunish` function folder to `civilian` and added new function: `TFD_fnc_customCiv`
  - Can be executed on a civilian unit to randomise their equipment and identity to suit your mission setting, i.e. africa, vietnam, etc
  - Place `[_this] spawn TFD_fnc_customCiv;` in 'Code On Unit Created' box in Civilian Presence module.
  - Custom equipment/face/voice classnames can be added in `functions/civilian/fn_customCiv.sqf`.
- Fixed `fn_civPunish`, now works with Civilian Presence module, also fixed some typos in the civpunish files.
- Added new `fn_unitVariation` function fired from `playerSetup.sqf` which allows you to define helmets/facewear/faces/voices to assign randomly to players on mission start to add a bit of variety without having to manually edit all the loadouts. Units can be blacklisted to avoid this behaviour.
- Added some new QOL functions to help speed up mission editing process:
  - New function `TFD_fnc_generateORBAT`, will allow you to generate a fully formatted copy-paste friendly TFD_ORBAT array, assuming the groups are named correctly and all have 's_n' names assigned. I recommend doing this LAST after you have set up the order of the units in the role list.
  - To use, start the mission in *SINGLEPLAYER* and open the debug console, then execute `[] call TFD_fnc_generateOrbat;`. Then simply use CTRL+V to paste the result into an empty text document.
  - New function `TFD_fnc_getEquipmentClasses`, will allow you to retrieve various equipment classnames from a set of units provided as a paramater. This complements the new unit variation and custom civ functions quite nicely and makes it easier to get weapon classes for Diwako's Punish Unknown Weapon script.
  - To use, start the mission in *SINGLEPLAYER* and open the debug console, then execute `[switchableUnits] call TFD_fnc_getEquipmentClasses;` and paste the result into an empty text file. You can also pass other arrays of units into it if you wanted, such as a group, e.g. `[units yourGroup] call TFD_fnc_getEquipmentClasses;` will get all the classnames from all the units in group 'yourGroup'.

### 03/03/2021
- Tweaked adminpanel functions & `fn_setRadio` to automatically execute on mission start without requiring a manual call in the init scripts.
  - Edit settings in `fn_setRadio` to disable SR, mission start hint or enable custom labels (was previously in `init.sqf`).
- Fixed a typo in `fn_assignChannels`.
- Converted grenade stop to ACE compatible version (did this a while ago but must have forgotten to add it to framework).
- Added `_uptakeIntensity` parameter to `fn_tm4_fuelUptake` to allow easier configuration of fuel drain speed.
- Minor comment/spacer cleanups.

### 26/01/2021
- Minor update to new TFD admin panel:
  - Fixed issues preventing admin panel from being opened after backing out to lobby/JIPing.
  - Added ability to bring selected unit to your position, key combination is ALT+SHIFT+LMB on the map.
  - Tidied up TP instruction box. Teleport key combinations are now in the tooltip instead of the text box.
  - The selected unit's group is now highlighted white on the map display with the leader being highlighted yellow, to allow quick identification of group leader (useful for teleporting JIP players to relevant squad.
  - Unconscious units will now be marked red on the map display. The priority for marker colour is Unconscious > Selected unit group > Side.

### 19/01/2021
- Updated TFD admin panel.
  - Added various new information panels to show selected player's info and medical status.
  - Most controls now affect the selected player not just the player currently using the admin panel.
  - Added new functions:
    - Heal and wake up buttons for ACE medical.
    - Force vehicle dismount and unstuck/unflip button.
    - Repair, refuel and rearm buttons.
  - Added new camera display to show the currently selected player's 1PP/3PP view.
  - Players are now visible/tracked on the map display and can be selected by clicking on the display.
  - End mission button now supports custom endings defined in CfgDebriefing.
  - Now works in spectator so dead admins can now use the admin panel if necessary (can be a bit buggy).
  - Teleport can now be done just by clicking on the map using modifier keys such as SHIFT/CTRL/ALT.
  - Attempting to teleport to a player in a vehicle will put you into the vehicle if there is room, or near the vehicle if no seats are available.
  - UIDs can be added to the authorised ID list mid mission if necessary, will possibly add a button for this in future update.

### 11/01/2021
- Fixed T1 Artillery settings:
  - By default NATO SL units ("B_Soldier_SL_F") and the commander unit (s_1) are authorised to use T1 Artillery.
  - Authorised units can be edited in `cba_settings.sqf`.

### 09/01/2021
- Changed `acre_sys_core_fullDuplex` from `true` to `false`. (Half duplex)

### 22/12/2020
- Updated `fn_setRadio.sqf` to allow more diverse radio configuration.

### 20/12/2020
- Implemented port from TFAR to ACRE.
- Moved TFD_ORBAT from `initPlayerLocal.sqf` to `init.sqf` (required for ACRE settings to work correctly).
- Updated ACE medical settings:
  - Fracture chance from 0.8 to 0.6.
  - IV flow rate from 1.2 to 2.
  - Disabled bleedout while in cardiac arrest.
  - Added PAK settings (only doctors can PAK inside medical building/vehicle).
  - Reduced tourniquet duration from 7 to 3.5 to make them a more viable option.
- Increased NVG effects slightly (balanced out with BettIR).
- Reduced ACE jam clear fail chance to 0.2 from 0.3.
- Moved garrison and zade_boc functions into misc folder to cleanup functions folder and adjusted relative paths.
- Added Diwako Punish Unknown Weapon to framework as script to remove the need for a mod depencency.
- Added civpunish endings to `description.ext`.
- Rebalanced DPUW settings (again)
  - Settings can now be edited in `functions\misc\punishweapon`
  - Jam chance to 4%.
  - Reload failure to 18%.
  - Dispersion to +10.
- Removed usingEstablishingShot variable.
- Changed unjam fail chance to 0.2 from 0.3.
- Added Slato and Yeet's SteamIDs to adminpanel and debug console. (Community managers)

### 29/11/2020
- Fixed civpunish function kill message not showing up in dedicated environment.

### 26/11/2020
- Re-implemented VoN fix. (now working)
- Tweaked Diwako Punish Weapon settings again:
  - Nerfed jam chance and disperion add significantly.
  - Weapons are now semi-usable for the first couple magazines (or first box for mgs) but get worse and worse before becoming effectively unusable within 3-4 mags (120 shots).
  - This allows players to use enemy weapons in a pinch if they run out of ammo but makes the weapon useless fairly quickly.

### 14/11/2020
- Removed view distance settings from `initServer.sqf` and `initPlayerLocal.sqf`. (Controlled by CBA settings)
- Moved some Diwako Punish Weapon stuff from `init.sqf` to it's own function to tidy up a bit.
- Fixed civpunish function counting unconscious soldiers as civilians.
- Added Zade Backpack On Chest script (ripped from mod files).
  - Can choose to use whitelist or no whitelist.
  - When using the whitelist only whitelisted units will be able to use BOC. (To prevent misuse)
  - If whitelist is disabled then all players will be able to place their backpack on their chest.

### 19/10/2020
- Update JEBUS to v1.454 from v1.452

### 28/08/2020
- Removed DAC init script from `init.sqf` (is managed by `initServer.sqf` now).
- Changed ACE litter/blood amounts and cleanup back to what they were before experimental merge (was accidentally overwritten).
- Set 'ace_medical_treatment_allowSharedEquipment' to 1 so medics will now use their own supplies by default when treating a patient instead of using the patient's supplies first.

### 19/08/2020
- Added README files into `!ADDITIONAL_SCRIPTS` folder to explain what it's for and as a reminder to delete it before exporting mission file.
- Added code formatting to file names in `README.md` for readability.
- Added instructions on GitHub page on how to import mission framework.
- Added line to `playerSetup.sqf` to holster player's weapon when spawning.
- Rebalanced Diwako Punish Unknown Weapon settings:
  - Weapons fail frequently enough to be annoying but not completely useless.
  - Dispersion setting lowered to allow better accuracy at close range but still high enough to make it difficult to hit targets 150+ metres away. (Makes it more dangerous for players using unknown weapons since they have to get closer to be effective).
  - New defaults are: 7% jam chance, 22% reload fail chance, +30 dispersion.
- Fixed ACE Advanced Bandages setting being set to 'false' instead of a value on the range 0-2. Now set to 0 (disabled).
  - Different bandages will no longer behave differently (they all show up as basic bandages in ACE interation).
- Updated JEBUS to fix turret issues.

### 01/08/2020
- Added header files containing classnames for NATO M4 style ARs and Russian AK style ARs that can be enabled using the Diwako Punish Unknown Weapon whitelist located in `init.sqf`.
  - If enabled will allow players to use all M4/AK style rifles without being punished.
  - To be extra certain, you should still define the weapons used by players in your mission manually, no duplicates will be created.
  - *Should* only include AR weapons. Marksman rifles, lmgs, launchers, etc all still need to be added manually if you want players to be able to use them without penalty.
- Tweaked Punish Unknown Weapon settings to be slightly more forgiving.
- Fixed duplicate case in `DAC_Config_Units.sqf`.
- Added comments to `cba_settings.sqf` explaining the ACE Fatigue settings.
- Added new default ACE Fatigue settings and re-enabled Advanced fatigue by default.
- Removed HC mission parameter. Now auto-executes DAC on Server/HC automatically.

### 31/07/2020
- Moved Diwako Punish Unknown Weapon whitelist from `initPlayerLocal.sqf` to `init.sqf` (local whitelist should now work correctly)

### 26/07/2020
- Disabled ACE Advanced Fatigue by default.
- Forced Advanced Fatigue settings in `cba_settings.sqf` so they correctly overwrite the server settings.

### 24/07/2020
- Fixed Diwako Punish Unknown Weapon local whitelist in `initPlayerLocal.sqf`. The script requires the uppercase form of the weapon classname.
- Touched up a few comments from various functions.
- Added comments to `fn_customDifficulty.sqf` to help explain what each setting changes.

### 10/07/2020
- Updated DAC config files.

### 07/07/2020
- Moved TFD_fnc_setRadio, TFD_fnc_setPatch and TFD_fnc_forceUniform calls into `playerSetup.sqf` so they work correctly when respawns are enabled.
- Re-introduced DAC example `mission.sqm` which was accidentally removed during experimental merge.
  - To prevent confusion and/or overwritten mission files, it is now located in the DAC additional folder which includes the readme with instructions on how to open the example mission.
- Re-organised functions folder a little bit to seperate 'core' functions and 'misc'.
- Further tidied up `init.sqf`, `initServer.sqf`, `initPlayerLocal.sqf` and `description.ext`.
- Removed Timid's civpop script (forgot to remove before merging from experimental).
- Redesigned Timid's garrison script:
  - Now allows custom loadouts for units.
  - Units can move around and reposition instead of being locked in place (can be disabled).
  - Caches units that are far from players.
  - Markers and triggers can both be used to mark garrison zones now as well.
- Added forceUniform function fired from `playerSetup.sqf`:
  - This allows mission makers to force uniform/headgear/vest on players to prevent them from picking up uniforms and headgear they aren't supposed to have.
  - Units added to the whitelist will not have uniform forced on them, even if it is enabled.
  - Gear added to the whitelist will not be removed even if forced uniform is enabled.
  - Only uniform is forced by default.
- Added civPunish function fired from `init.sqf`. All parameters can be enabled/disabled:
  - Disabled by default, allows mission makers to punish players for killing civilians/non-combatants.
  - Shows a message to the whole server showing which player killed a civilian.
  - Fails mission if too many civilians are killed.
  - Kicks offending player to lobby if they kill too many civilians. (Default is 2)

### 04/07/2020
- Master Branch updated to match the experimental branch created by TimidShade.
- Multiple file movements and cleanups.
- Both DAC and JEBUS ai systems are now implemented in the same framework.
- Happy 4th of July to our lone American member :)

### 01/07/2020
- Added Nerfmanic to adminlist and debug console list.

### 17/06/2020
- VON tweaks.
- Added in entries for Diwako's Punish Weapon and Enhanced Movement Rework in `cba_settings.sqf`.
- Enabled ACE advanced fatigue by default so that stamina settings actually take effect.
- Added diwako_unknownwp_local_weapons array to `initPlayerLocal.sqf` so mission makers can manually add more weapons to player's known weapon pools.

### 13/06/2020
- Updated JEBUS to fix `fn_saveVehicle.sqf` error when trying to spawn vehicles.

### 02/06/2020
- Fixed declaring usingEstablishingShot variable before `intro.sqf` since it was causing errors.

### 31/05/2020
- Removed German DAC docs and Sector Fight settings PDF.
- Re-added old VON disable code in `description.ext`.

### 25/04/2020
- Updated VON disable code in `initPlayerLocal.sqf` and removed from `description.ext`.
- JEBUS update

### 28/01/2020
- Tweaked `fn_missionStartHint.sqf` to work correctly when no commander is present
- Removed unnecessary code from `tfar.sqf` (deprecated, now included in CBA settings file)
- Fixed `unitRoster.sqf` displaying local player's role instead of unit's role in ORBAT
- Minor tweaks to `briefing.sqf`

### 27/01/2020
- Updated CBA settings file to 2020 (updated ACE medical and TFAR settings)
- Minor tweaks to `intro.sqf`
- Added `fn_setPatch.sqf` && added to `TFD.hpp`
- Moved TFD_ORBAT array to `initPlayerLocal.sqf` instead of `fn_setRadio.sqf` to allow easier configuration and access from both setRadio and setPatch scripts.
- Added _setAdditional param to `fn_setRadio.sqf` to toggle assignment of additional channels

### 23/10/2019
- Changed 'ace_medical_bleedingCoefficient' to 1.2 in CBA settings (was 1)

### 20/10/2019
- Neatened file structure
- Moved AI/script frameworks such as DAC/JEBUS/EPD to `!ADDITIONAL_SCRIPTS` folder to allow mission makers to pick and choose which frameworks to use.
- Simplified comments to improve readability
- Moved files from `scripts` to `functions` to cleanup scripts folder and defined new functions (tried to provide examples too)
- Reduced 'ace_medical_bleedingCoefficient' to 1 in CBA settings (was 1.5)
- Tweaked wait time for establishing shot to 20s (player can still press space to skip anyway)
- Removed hint after closing setRadio hint
- Added civpop functions
- Added custom difficulty function

### 30/09/2019
Changed Ace view distance from force to unforced. Lowered respawn lives to 2 in cba medical settings also.
### 21/07/2019
CBA Settings updated to a standard file for medical settings and general settings every variable is documented with whats required and what it does. 
### 06/07/2019

**ADMINPANEL**
- Zeus Remote control funciton now fixed and working
- removed annoying missing texture error
- arsenal now can be opened on target players machine without putting everyone in arsenal (some times requires a second click or two - timing issue)
- teleport script reworked (tested in dedicated environment)

**GENERAL FIXES**
- seperated mission start dialog hint into a seperate function that can be commented out if mission makers dont want it
- radio channel setting tested and working
- squad leaders now have their shortwave additional channel set to hidden channel 9 by default so all SL's can have shortwave comms to each other without clusterfucking LongRange comms
- service jet script modified to function in multiplayer with a server only trigger (removes unecessary objects being created on clients)
- instruction comments added to service jet script
- garrison funciton and header moved to its own folder as requested
- server viewdistance and objectviewdistance pushed out to 3000m
- player viewdistance set to the same
- grass layer has been set to and off setting (mission maker can change this in initPlayerLocal.sqf)

**DAC**
 - artillery script modified to work with illum rounds / smoke rounds / HE rounds properly
 - 'lieutenant' error rechecked and fixed

**TODO in next patch**
- reorganise folder structure to be more intuitive


### 18/06/2019
**Updated Admin Panel functions**
- Fixed Teleport script and tested as working
**TFAR Fixes**
- fixed fn_setRadio.sqf script
    - now sets channel 8 on shortrange radios as additional for all squad leaders (at mission start)
**General Changes**
- added a basic Virtual Room mission with one functioning DAC zone for people to use as a 'test' room


### 08/06/2019
- **Updated Admin Panel functions**
    - Added dynamic zeus modules so all adminpanel users can now have their own zeus
    - removed the need for pre requisite editor placed zeus modules
    - fixed teleport script so it should no longer teleport a player AND his vehicle - just the player
    - fixed performance dropping loops
    - lock server button now actually works
    - kick ban buttons should work but untested in dedicated environment
    - disable button works but needs testing in dedicated environment
    - decoupled all functions into seperate files that compile on mission load to remain in memory and thus have faster access and run times
    - admin list now in a seperate header file so people dont accidentally break the code ``` \adminpanelmk2\ADMINLIST.hpp ```
    
    *TODO:* 
        - Remove adminpanel from framework and develop it as a standalone mod and post to steam workshop

- **OTHER FIXES**
    - Moved definition of CfgUnitInsignia from description.ext to its own header file now located with the insignia themselves in ```'media\insignia\insignia.hpp'```
    - corrected filenames to meet Arma standards (**camelCaseIsImportant**)
    - corrected copy/paste error with incorrect double quotes in initPlayerLocal.sqf
    - cleaned out initServer.sqf
    - corrected case sensitivity in headless client call - probably unecessary but just in case
    - updated **README.md**

### 22/04/19
- Added new DAC Behaviour and Units
- Updated CBA Settings
- Add jet service script documentation inside

### 06/02/18
- EPD (Ied Scripted Used by Atreus in older missions creates awesome particle affects and realist IED's Ask him for assistance for usage **Can Be performance hindering if not careful**)
- Johnnyshootos Boobytrap script ( Enables mission maker to spawn x size explosion onto player if they pick up x weapon **Use to prevent players from looting enemy weapons again be smart about it.)
- Added DAC Documentation in PDF's 

### 21/12/17
- added civilian kill counter
- added Stalk script
- added Fire Support script 
- added increased fuel consumption script
- removed tonny's duplicate guid for the admin panel
- updated framework to support TFAR beta via cba_settings.sqf
- updated compositions and set radio fnc to have s_x where x = unit number.  makes for easier copy/paste of units

### 14/12/17
- changed text in intro.sqf to placeholder text
- updated briefing.sqf with examples of markers and page breaks
- disabled ACE cook off in init.sqf
- added first implementation of civilian kill counter

### 29/03/17
-fixed admin panel issue in playersetup.sqf

### 16/03/2017
- updated to admin panel mk2 
- updated orbat journal entry code from newer framework by JS&JT
- minor comment changes in some sqf files
- updated dynamic markers function
- minor updates to Framework Check list

### 29/08/16
- added grenade stop script.
- removed setobjectVD to allow players self settings
- added example end classes in the description.ext

### 18/06/16
- Changed how insginia are now handled by creating some example config classes in the description.ext.  This allows far easier implementation of custom patches if desired by mission maker
- setpatch.sqf removed
- Removed redundant stgestures code
- updated EGspectator function call in the playerkilled.sqf

### 12/05/16
 - Updated fn_setradio.sqf function to include a full generic 26 man platoon layout supporting the new TFD mission making compositions

### 06/04/16
- Removed css spectator script and replaced with vanilla - this will now require a simple respawn marker created

### 08/03/16
- Removed playerkit.sqf and transfered radio function to initplayerlocal.sqf
- Deleted truckgear.sqf
- edited TFD.hpp class configs to remove redundant functions
- moved briefing.sqf, werthless.sqf and intro.sqf into scripts folder and adjusted initplayerlocal.sqf accordingly
- removed author, onloadname, onloadmission, loadscreen, overviewtext from description.ext
- retaining debugconsole, disableAI and joinunassigned as these will override any changes made by mission makers in eden
- Updated mission makers guide to reflect new eden changes.  Will update this further at a later date.

### 21/09/15
- Skilletkid added ST Gestures colouring defined in assigngroups.sqf
- Also fixed up error in DAC_units_config 

### 19/09/15
- Added werthless headless client script, set 120 seconds in init to let DAC initialise
- Skillet added LOPFOR new units

### 09/09/15
- Tonny747 updated fn radio to have SW channels preset based on assigngroups.sqf at mission start

### 27/08/15
- fixed fuck ups relating to commenting (now using notepad++!)
- tested casualty cap - working when executing custom code in array
- tested and created 1 additional parameter in desc.ext and init.sqf
- fn_f_casualtycap fixed in hpp and .sqf file to properly call
- created framework on VR map with ACE module settings place and an example DAC zone

### 24/08/2015 - Imperator
- Large amounts of changes/re-jigging of previous framework primarily to accommodate the return to TFAR and to make rookie user friendly.
