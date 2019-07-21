/**
These are now the default CBA settings and Mission Settings for TFD Missions, Do not change them unless you make the change of settings known in briefing this will help standardise our missions.
For the Medical settings leave as they are unless you intend to create a mission based around medics.
Please ensure you go to the Medic Unit you wish to use Attributes > Ace Options > Is Medic (Default, None, Regular Medic, Doctor) and choose which applies generally Doctor is a safe bet.
It also helps to enable Squad Leads to have the same capability in case the medic does perish.
That same procedures applies for any engineer changes you require. 
Note Remember to add the required medical items as well as engineering items in your missions. 
Bandages > Morphine > Blood 1000ml > Epi are the items required and in bulk.
Toolkits for engineers.
 */



// ACE Advanced Ballistics
//TFD MM Do not touch.
//Enables Overheating for Weapon (True or False)
force ace_advanced_ballistics_ammoTemperatureEnabled = true;
//Enables Overheating for Weapon (True or False)
force ace_advanced_ballistics_barrelLengthInfluenceEnabled = true;
//Enables Trace effect for supersonic bullets (refraction etc..) (True or False)
force ace_advanced_ballistics_bulletTraceEnabled = true;
//Enables Advanced Ballistics (Keep Disabled hinders performance) (True or False)
force ace_advanced_ballistics_enabled = false;
//Variable muzzle velocity based on powder burn rate and barrel length. (True or False)
force ace_advanced_ballistics_muzzleVelocityVariationEnabled = false;
//How often it takes the simulation into account(Not used)
force ace_advanced_ballistics_simulationInterval = 0.0992275;

// ACE Advanced Fatigue
// ACE Fatigue system refer to wiki (Keep false) (True or False)
ace_advanced_fatigue_enabled = false;
// ACE Stamina Bar (Clean and small) (True or False)
ace_advanced_fatigue_enableStaminaBar = true;
// How much weight affects the player. (Lower means it has less of an Impact. eg. 0 means no performance influence.)
ace_advanced_fatigue_loadFactor = 0.935293;
//This influences the overall performance of players. (Higher = Better)
ace_advanced_fatigue_performanceFactor = 2.5;
// Determines recovery speed of Stamina (Higher = Faster)
ace_advanced_fatigue_recoveryFactor = 2.5;
// Effect of terrain (Higher = Higher Loss of Stamina)
ace_advanced_fatigue_terrainGradientFactor = 1;
//Influences amount of weapon sway (Higher = More sway)
ace_advanced_fatigue_swayFactor = 1;

// ACE Advanced Throwing
//Standard Setting do not touch
force ace_advanced_throwing_enabled = true;
force ace_advanced_throwing_enablePickUp = true;
force ace_advanced_throwing_enablePickUpAttached = true;
force ace_advanced_throwing_showMouseControls = true;
force ace_advanced_throwing_showThrowArc = true;

// ACE Arsenal
//Standard Setting do not touch
force ace_arsenal_allowDefaultLoadouts = true;
force ace_arsenal_allowSharedLoadouts = true;
ace_arsenal_camInverted = false;
ace_arsenal_enableModIcons = true;
ace_arsenal_EnableRPTLog = false;
ace_arsenal_fontHeight = 4.5;

// ACE Captives
//Common sense
force ace_captives_allowHandcuffOwnSide = false;
force ace_captives_allowSurrender = true;
// Settings are 0= Disabled 1= Surrendering Only 2=Surrendering or No Weapon
force ace_captives_requireSurrender = 2;
// Ai are required to surrender before arrested.
force ace_captives_requireSurrenderAi = false;

// ACE Common
//Standard Setting do not touch
ace_common_allowFadeMusic = true;
force ace_common_checkPBOsAction = 0;
force ace_common_checkPBOsCheckAll = false;
force ace_common_checkPBOsWhitelist = "[]";
ace_common_displayTextColor = [0,0,0,0.1];
ace_common_displayTextFontColor = [1,1,1,1];
ace_common_settingFeedbackIcons = 1;
ace_common_settingProgressBarLocation = 0;
force ace_noradio_enabled = true;
force ace_parachute_hideAltimeter = false;

// ACE Cook off
//Common sense set to disable for performance.
//How long cook off lasts (set to 0 for disabled)
ace_cookoff_ammoCookoffDuration = 1;
//Set false for disabled.
ace_cookoff_enable = false;
ace_cookoff_enableAmmobox = false;
ace_cookoff_enableAmmoCookoff = false;
ace_cookoff_probabilityCoef = 1;

// ACE Explosives
//Standard Setting do not touch
force ace_explosives_explodeOnDefuse = false;
force ace_explosives_punishNonSpecialists = true;
force ace_explosives_requireSpecialist = false;

// ACE Fragmentation Simulation
//Standard Setting do not touch
//Enables Frag simulation (True or False)
force ace_frag_enabled = true;
//Tracks how many projectiles are tracked. Keep low for FPS! (Do not touch)
force ace_frag_maxTrack = 10;
//As above perframe. (Do not touch)
force ace_frag_maxTrackPerFrame = 10;
force ace_frag_reflectionsEnabled = false;
force ace_frag_spallEnabled = false;

// ACE Goggles
//0 = Disabled 1= Tint 2=Tint + effects
force ace_goggles_effects = 2;
// Third Person Peasant shit leave it.
ace_goggles_showInThirdPerson = false;

// ACE Hearing
// Adds ear plugs automatically (True or False)
force ace_hearing_autoAddEarplugsToUnits = true;
// Enable or disable rining effect (True or False)
force ace_hearing_disableEarRinging = true;
// Volume
force ace_hearing_earplugsVolume = 0.5;
//Player takes hearing damage (true or false)
force ace_hearing_enableCombatDeafness = false;
force ace_hearing_enabledForZeusUnits = true;
//Volume when unconcious
force ace_hearing_unconsciousnessVolume = 0.4;

// ACE Interaction
//Standard Setting do not touch
force ace_interaction_disableNegativeRating = true;
ace_interaction_enableMagazinePassing = true;
force ace_interaction_enableTeamManagement = true;

// ACE Interaction Menu
//Standard Setting do not touch
ace_gestures_showOnInteractionMenu = 2;
ace_interact_menu_actionOnKeyRelease = true;
ace_interact_menu_addBuildingActions = false;
ace_interact_menu_alwaysUseCursorInteraction = false;
ace_interact_menu_alwaysUseCursorSelfInteraction = false;
ace_interact_menu_colorShadowMax = [0,0,0,1];
ace_interact_menu_colorShadowMin = [0,0,0,0.25];
ace_interact_menu_colorTextMax = [1,1,1,1];
ace_interact_menu_colorTextMin = [1,1,1,0.25];
ace_interact_menu_cursorKeepCentered = false;
ace_interact_menu_menuAnimationSpeed = 0;
ace_interact_menu_menuBackground = 0;
ace_interact_menu_shadowSetting = 2;
ace_interact_menu_textSize = 2;
ace_interact_menu_useListMenu = false;

// ACE Logistics
//Enable Ace Cargo
force ace_cargo_enable = true;
//Load time for cargo
ace_cargo_loadTimeCoefficient = 5;
//Modifier for how long it takes to paradrop a cargo item.
force ace_cargo_paradropTimeCoefficent = 2.5;
force ace_refuel_hoseLength = 20.7219;
// How fast fuel is transfered
force ace_refuel_rate = 12.7748;
//Add Spare parts to vehicle (True or False)
force ace_repair_addSpareParts = true;
//Shuts down vehicle on repair (True or False)
force ace_repair_autoShutOffEngineWhenStartingRepair = false;
//Remove toolkit on repair (0=No 1=Yes)
force ace_repair_consumeItem_toolKit = 0;
//Notification of repair
ace_repair_displayTextOnRepair = true;
//Allow Full repair 0=Anyone 1=Engineer Only 2=Advanced Engineer only (Setting must be ticked in unit attributes)
force ace_repair_engineerSetting_fullRepair = 2;
//Who can perform repair actions 0=Anyone 1=Engineer only 2=Advanced Engineer only
force ace_repair_engineerSetting_repair = 0;
//Who can remove and replace wheels 0=Anyone 1=Engineer only 2=Advanced Engineer only
force ace_repair_engineerSetting_wheel = 0;
//Where a full repair can be done 0=Anywhere 1=Repair vehicle only 2= Repair facility only 3= Repair facility or Vehicle 4= disabled
force ace_repair_fullRepairLocation = 2;
//Max damage that can be repaired with a toolkit.
force ace_repair_repairDamageThreshold = 0.6;
//Max damage that can repaired by engineer.
force ace_repair_repairDamageThreshold_engineer = 0.4;
//Does wheel repair require toolkit 0=none 1=toolkit
force ace_repair_wheelRepairRequiredItems = 0;

// ACE Magazine Repack
//Time per round
force ace_magazinerepack_timePerAmmo = 1.5;
//Time per belt
force ace_magazinerepack_timePerBeltLink = 8;
//Time per magazine
force ace_magazinerepack_timePerMagazine = 2;

// ACE Map
//Blue Force Tracking (True or False)
force ace_map_BFT_Enabled = true;
//Hide markers for AI groups (true or false)
force ace_map_BFT_HideAiGroups = false;
//Map marker postion update interval (Seconds)
force ace_map_BFT_Interval = 1;
//Show player names on map (True or False)
force ace_map_BFT_ShowPlayerNames = false;
//Chat channel default -1=Disabled 0=Global 1=Side 2=Command 3=Group 4=Vehicle 5=Direct 
force ace_map_defaultChannel = -1;
//Add external glow to players who use flashlight on map(true or false)
force ace_map_mapGlow = true;
//Ambient Map lighting (Disable as is broken currently.)(true or false)
force ace_map_mapIllumination = false;
//Limit zoom (true or false)
force ace_map_mapLimitZoom = false;
//Map shake when walking
force ace_map_mapShake = true;
//GPS on cursor
force ace_map_mapShowCursorCoordinates = false;
//Allow moving markers for -1=Nobody 0=All players 1=Admins 2=Group leaders 3=Group leaders and admins 4=Creator
force ace_markers_moveRestriction = 0;

// ACE Map Gestures
//Standard Setting do not touch
ace_map_gestures_defaultColor = [1,0.88,0,0.7];
ace_map_gestures_defaultLeadColor = [1,0.88,0,0.95];
force ace_map_gestures_enabled = true;
force ace_map_gestures_interval = 0.03;
force ace_map_gestures_maxRange = 10.2098;
ace_map_gestures_nameTextColor = [0.2,0.2,0.2,0.3];

// ACE Map Tools
//Standard Setting do not touch
ace_maptools_drawStraightLines = true;
ace_maptools_rotateModifierKey = 1;

// ACE Medical
// Do not touch medical unless you wish to change from the standard setting now being applied. With the current settings ensure you have Epi + Blood for medics and ensure medics is ticked in attributes.
//Ace Medical AI Enabled for 0=Disabled 1= Server and HC 2=Enabled
force ace_medical_ai_enabledFor = 0;
//Damage AI can take before being killed
force ace_medical_AIDamageThreshold = 1;
//Allow Litter creation eg Bandages, epi etc on ground. (True or False)
force ace_medical_allowLitterCreation = true;
//Enable or Disable Animation (true or false)
force ace_medical_allowUnconsciousAnimationOnTreatment = false;
//Max amount of lives a unit has 0-10 etc -1= Disabled
force ace_medical_amountOfReviveLives = 4;
//How fast the player bleeds
force ace_medical_bleedingCoefficient = 1.5107;
//Blood drops created on bleeding 0=Disabled 1=Players only 2=Enabled
force ace_medical_blood_enabledFor = 2;
//Consume PAK on use (Adv Med Only)
force ace_medical_consumeItem_PAK = 0;
//Consume Surg Kit on use (Adv Med Only)
force ace_medical_consumeItem_SurgicalKit = 0;
//Convert items 0=Enabled 1=Just remove vanilla medical 2= disabled
force ace_medical_convertItems = 0;
//Delay cease fire of AI while player is unconscious for medical reasons (Seconds)
force ace_medical_delayUnconCaptive = 3;
//Allow reopening of wounds (True or False)
force ace_medical_enableAdvancedWounds = false;
//What units medical system will be enabled for 0=Players 1=Players and AI
force ace_medical_enableFor = 0;
//Allow Overdose (true or false)
force ace_medical_enableOverdosing = true;
//Enable Revive 0=Disabled 1=PLayers only 2=Players and AI
force ace_medical_enableRevive = 1;
//Enable Screams (True or False)
force ace_medical_enableScreams = true;
//Allow Ai to go unconscious 0=Disabled 1=50/50 2=Enabled (Always)
force ace_medical_enableUnconsciousnessAI = 1;
//Enable Take damage from vehicle crash (true or flase)
force ace_medical_enableVehicleCrashes = true;
//Bandages restore Hitpoints (True or False)
force ace_medical_healHitPointAfterAdvBandage = false;
//Boost Training in or near vehicles or facilities (Untrained becomes medic etc)(True or false)
force ace_medical_increaseTrainingInLocations = false;
//Keeps Sync (Set to true)
force ace_medical_keepLocalSettingsSynced = true;
//Medical Sim level 0=Disabled 1=Basic 2=Adv
force ace_medical_level = 1;
//Litter clean up delay (seconds) (Can hinder performance)
force ace_medical_litterCleanUpDelay = 360.1;  
//Detail of litter 0=Off 1=Low 2=Med 3= High 4=Ultra (Can hinder performance)
force ace_medical_litterSimulationDetail = 3;
//Max time a unit can spend in revive state until they die (even if stable! be aware)
force ace_medical_maxReviveTime = 240;
//Level of detail for medics 0=Disabled 1=Basic 2=Adv 
force ace_medical_medicSetting = 2;
//Who can use Epi for full heal/Revive 0=Anyone 1=Medics 2=Doctors
force ace_medical_medicSetting_basicEpi = 1;
//Who can use PAK for full heal/Revive 0=Anyone 1=Medics 2=Doctors
force ace_medical_medicSetting_PAK = 1;
//Who can use Surg for full heal/Revive 0=Anyone 1=Medics 2=Doctors
force ace_medical_medicSetting_SurgicalKit = 1;
//Allow clients to use medical menu 0=Disabled 1= Enabled 2= Vehicles Only
force ace_medical_menu_allow = 1;
//Max Range for medical menu (meters)
force ace_medical_menu_maxRange = 3;
//Reopens menu after treatment.
force ace_medical_menu_openAfterTreatment = true;
//Enabled use of Medical Menu through keybind or interaction menu
force ace_medical_menu_useMenu = 1;
//Menu Type 0=Selections 3d 1=Radial 2=Disabled
force ace_medical_menuTypeStyle = 0;
//Show the self interaction medical menu
force ace_medical_menuTypeStyleSelf = true;
//On unconciousness move units from group (true or false)
force ace_medical_moveUnitsFromGroupOnUnconscious = false;
//Same as bleeding Pain coefficient
force ace_medical_painCoefficient = 1;
//Pain effect type 0=Colour Flashing 1= Chromatic Abberation
force ace_medical_painEffectType = 0;
//Pain is only suppressed not removed (True or false)
force ace_medical_painIsOnlySuppressed = true;
//What is the damage a player can take before being killed (Useful for IFA/UNSUNG)
force ace_medical_playerDamageThreshold = 1;
//Prevents Insta Death (True or False)
force ace_medical_preventInstaDeath = true;
//Treat remote controlled units as AI not players (True or false)
force ace_medical_remoteControlledAI = true;
//When a Pak can be used 0=Anytime 1=Stable
force ace_medical_useCondition_PAK = 0;
//When a SurgKit can be used 0=Anytime 1=Stable
force ace_medical_useCondition_SurgicalKit = 0;
//Where Epi can be used 0= Anywhere 1=Medical Vehicles 2=Medical Facility 3=Vehicle and Facility 4= Disabled
force ace_medical_useLocation_basicEpi = 0;
//Where Pak can be used 0= Anywhere 1=Medical Vehicles 2=Medical Facility 3=Vehicle and Facility 4= Disabled
force ace_medical_useLocation_PAK = 0;
//Where Surgkit can be used 0= Anywhere 1=Medical Vehicles 2=Medical Facility 3=Vehicle and Facility 4= Disabled
force ace_medical_useLocation_SurgicalKit = 0;

// ACE Mk6 Mortar
//Standard Setting do not touch
force ace_mk6mortar_airResistanceEnabled = false;
force ace_mk6mortar_allowCompass = true;
force ace_mk6mortar_allowComputerRangefinder = true;
force ace_mk6mortar_useAmmoHandling = false;

// ACE Name Tags
//Standard Setting do not touch
ace_nametags_defaultNametagColor = [0.77,0.51,0.08,1];
force ace_nametags_playerNamesMaxAlpha = 0.8;
force ace_nametags_playerNamesViewDistance = 5;
force ace_nametags_showCursorTagForVehicles = false;
ace_nametags_showNamesForAI = false;
ace_nametags_showPlayerNames = 1;
ace_nametags_showPlayerRanks = true;
ace_nametags_showSoundWaves = 1;
ace_nametags_showVehicleCrewInfo = true;
ace_nametags_tagSize = 2;

// ACE Nightvision
//Standard Setting do not touch
force ace_nightvision_aimDownSightsBlur = 0;
force ace_nightvision_disableNVGsWithSights = false;
force ace_nightvision_effectScaling = 1;
force ace_nightvision_fogScaling = 1;
ace_nightvision_shutterEffects = true;
ace_nightvision_noiseScaling = 1;

// ACE Overheating
//Standard Setting do not touch
ace_overheating_displayTextOnJam = true;
force ace_overheating_enabled = true;
force ace_overheating_overheatingDispersion = true;
ace_overheating_showParticleEffects = true;
ace_overheating_showParticleEffectsForEveryone = false;
force ace_overheating_unJamFailChance = 0.317885;
force ace_overheating_unJamOnreload = false;

// ACE Pointing
//Standard Setting do not touch
force ace_finger_enabled = true;
ace_finger_indicatorColor = [0.83,0.68,0.21,0.75];
ace_finger_indicatorForSelf = true;
force ace_finger_maxRange = 10;

// ACE Pylons
//Standard Setting do not touch
force ace_pylons_enabled = true;
force ace_pylons_rearmNewPylons = false;
force ace_pylons_requireEngineer = false;
force ace_pylons_requireToolkit = true;
force ace_pylons_searchDistance = 15;
force ace_pylons_timePerPylon = 5;

// ACE Quick Mount
//Standard Setting do not touch
force ace_quickmount_distance = 3;
force ace_quickmount_enabled = true;
ace_quickmount_priority = 0;
force ace_quickmount_speed = 18;

// ACE Rearm
//Standard Setting do not touch
force ace_rearm_level = 0;
force ace_rearm_supply = 0;

// ACE Respawn
//Standard Setting do not touch
force ace_respawn_removeDeadBodiesDisconnected = true;
force ace_respawn_savePreDeathGear = false;

// ACE Scopes
//Standard Setting do not touch
force ace_scopes_correctZeroing = true;
force ace_scopes_deduceBarometricPressureFromTerrainAltitude = false;
force ace_scopes_defaultZeroRange = 100;
force ace_scopes_enabled = true;
force ace_scopes_forceUseOfAdjustmentTurrets = false;
force ace_scopes_overwriteZeroRange = false;
force ace_scopes_simplifiedZeroing = false;
ace_scopes_useLegacyUI = false;
force ace_scopes_zeroReferenceBarometricPressure = 1013.25;
force ace_scopes_zeroReferenceHumidity = 0;
force ace_scopes_zeroReferenceTemperature = 15;

// ACE Spectator
//Standard Setting do not touch
force ace_spectator_enableAI = false;
force ace_spectator_restrictModes = 0;
force ace_spectator_restrictVisions = 0;

// ACE Switch Units
//Standard Setting do not touch
force ace_switchunits_enableSafeZone = true;
force ace_switchunits_enableSwitchUnits = false;
force ace_switchunits_safeZoneRadius = 100;
force ace_switchunits_switchToCivilian = false;
force ace_switchunits_switchToEast = false;
force ace_switchunits_switchToIndependent = false;
force ace_switchunits_switchToWest = false;

// ACE Tagging
//Standard Setting do not touch
ace_tagging_quickTag = 1;

// ACE Uncategorized
force ace_gforces_enabledFor = 1;
force ace_hitreactions_minDamageToTrigger = 0.1;
ace_inventory_inventoryDisplaySize = 0;
force ace_laser_dispersionCount = 2;
ace_fastroping_requireRopeItems = false;
force ace_microdagr_mapDataAvailable = 2;
ace_optionsmenu_showNewsOnMainMenu = true;
force ace_overpressure_distanceCoefficient = 1;
ace_weaponselect_displayText = true;

// ACE User Interface
//Standard Setting do not touch
force ace_ui_allowSelectiveUI = true;
ace_ui_ammoCount = false;
ace_ui_ammoType = true;
ace_ui_commandMenu = true;
ace_ui_firingMode = true;
ace_ui_groupBar = false;
ace_ui_gunnerAmmoCount = true;
ace_ui_gunnerAmmoType = true;
ace_ui_gunnerFiringMode = true;
ace_ui_gunnerLaunchableCount = true;
ace_ui_gunnerLaunchableName = true;
ace_ui_gunnerMagCount = true;
ace_ui_gunnerWeaponLowerInfoBackground = true;
ace_ui_gunnerWeaponName = true;
ace_ui_gunnerWeaponNameBackground = true;
ace_ui_gunnerZeroing = true;
ace_ui_magCount = true;
ace_ui_soldierVehicleWeaponInfo = true;
ace_ui_staminaBar = true;
ace_ui_stance = true;
ace_ui_throwableCount = true;
ace_ui_throwableName = true;
ace_ui_vehicleAltitude = true;
ace_ui_vehicleCompass = true;
ace_ui_vehicleDamage = true;
ace_ui_vehicleFuelBar = true;
ace_ui_vehicleInfoBackground = true;
ace_ui_vehicleName = true;
ace_ui_vehicleNameBackground = true;
ace_ui_vehicleRadar = true;
ace_ui_vehicleSpeed = true;
ace_ui_weaponLowerInfoBackground = true;
ace_ui_weaponName = true;
ace_ui_weaponNameBackground = true;
ace_ui_zeroing = true;

// ACE Vehicle Lock
//Standard Setting do not touch
force ace_vehiclelock_defaultLockpickStrength = 10;
force ace_vehiclelock_lockVehicleInventory = false;
force ace_vehiclelock_vehicleStartingLockState = -1;

// ACE View Distance Limiter
force ace_viewdistance_enabled = true;
ace_viewdistance_limitViewDistance = 5000;
ace_viewdistance_objectViewDistanceCoeff = 0;
//View Distance Setting 1 = 500m 2=1000m etc 500m increments.
ace_viewdistance_viewDistanceAirVehicle = 10;
force ace_viewdistance_viewDistanceLandVehicle = 5;
force ace_viewdistance_viewDistanceOnFoot = 5;

// ACE Weapons
//Standard Setting do not touch
ace_common_persistentLaserEnabled = false;
force ace_laserpointer_enabled = true;
ace_reload_displayText = true;

// ACE Weather
//Standard Setting do not touch
force ace_weather_enabled = false;
force ace_weather_updateInterval = 60;
force ace_weather_windSimulation = false;

// ACE Wind Deflection
//Standard Setting do not touch
force ace_winddeflection_enabled = false;
force ace_winddeflection_simulationInterval = 0.05;
force ace_winddeflection_vehicleEnabled = false;

// ACE Zeus
//Standard Setting do not touch
force ace_zeus_autoAddObjects = true;
force ace_zeus_radioOrdnance = false;
force ace_zeus_remoteWind = false;
force ace_zeus_revealMines = 0;
force ace_zeus_zeusAscension = false;
force ace_zeus_zeusBird = false;

// CBA Weapons
cba_disposable_dropUsedLauncher = 2;
force cba_disposable_replaceDisposableLauncher = true;
cba_events_repetitionMode = 1;
cba_optics_usePipOptics = true;

// GRAD Trenches
//Allow Big envelope trench (True or False)
force grad_trenches_functions_allowBigEnvelope = true;
//Allow interaction and camouflage (true or false)
force grad_trenches_functions_allowCamouflage = true;
//Allow digging with entrenchment tool (true or false)
force grad_trenches_functions_allowDigging = true;
//Allow Giant envelope trench (True or False)
force grad_trenches_functions_allowGiantEnvelope = true;
//Allow Short envelope trench (True or False)
force grad_trenches_functions_allowShortEnvelope = true;
//Allow Small envelope trench (True or False)
force grad_trenches_functions_allowSmallEnvelope = true;
//Allow Vehicle envelope trench (True or False)
force grad_trenches_functions_allowVehicleEnvelope = true;
//Build time in seconds for Big Envelopement Trench
force grad_trenches_functions_bigEnvelopeDigTime = 90;
//Stamina Factor for digging 0=Disabled Higher = More impact on Fatigue
force grad_trenches_functions_buildFatigueFactor = 1.48822;
//Require entrenchment tool for camouflage (true or false)
force grad_trenches_functions_camouflageRequireEntrenchmentTool = true;
//Mod will try and fill in an automatic path and prefix for texture files (Can cause errors keep False)
force grad_trenches_functions_enableAutomaticFilePath = false;
//Build time in seconds for Giant Envelopement Trench
force grad_trenches_functions_giantEnvelopeDigTime = 90;
//Build time in seconds for Short Envelopement Trench
force grad_trenches_functions_shortEnvelopeDigTime = 30;
//Build time in seconds for Small Envelopement Trench
force grad_trenches_functions_smallEnvelopeDigTime = 30;
//Player will stop digging on reaching 0 Fatigue (True or False)
force grad_trenches_functions_stopBuildingAtFatigueMax = false;
//Build time in seconds for Vehicle Envelopement Trench
force grad_trenches_functions_vehicleEnvelopeDigTime = 220;

// NIArms
//Standard Setting do not touch
force niarms_accswitch = true;
force niarms_magSwitch = true;


