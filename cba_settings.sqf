// ACE Advanced Ballistics
force ace_advanced_ballistics_ammoTemperatureEnabled = true;
force ace_advanced_ballistics_barrelLengthInfluenceEnabled = true;
force ace_advanced_ballistics_bulletTraceEnabled = true;
force ace_advanced_ballistics_enabled = false;
force ace_advanced_ballistics_muzzleVelocityVariationEnabled = false;
force ace_advanced_ballistics_simulationInterval = 0.1;

// ACE Advanced Fatigue
force ace_advanced_fatigue_enabled = true; // false = vanilla stamina, true = ACE stamina
ace_advanced_fatigue_enableStaminaBar = true;
ace_advanced_fatigue_fadeStaminaBar = true;
/*
	ace_advanced_fatigue_loadFactor:
	Ratio of inventory weight to weight used to calculate stamina loss.
	e.g. 0.2 means 1kg = 0.2kg in terms of stamina loss.

	ace_advanced_fatigue_performanceFactor:
	Overall performance of players. Don't set higher than 2, instead reduce load factor
	for better stamina.

	ace_advanced_fatigue_recoveryFactor:
	The speed at which players recover stamina. Players will still become exhausted
	quickly if stamina is constantly being depleted, even if recovery is high. Where
	possible, change settings to reduce stamina consumption instead.

	ace_advanced_fatigue_terrainGradientFactor:
	How much terrain impacts player's stamina consumption. Weight also factors into this,
	lowering the load coefficient will mean this factor has less of an impact. For best
	results, raise the terrainGradient factor when lowering load coefficient.
*/
force ace_advanced_fatigue_loadFactor = 0.2;
force ace_advanced_fatigue_performanceFactor = 1.5;
force ace_advanced_fatigue_recoveryFactor = 2.5; 
force ace_advanced_fatigue_terrainGradientFactor = 3.5;
force ace_advanced_fatigue_swayFactor = 1; // amount of sway when fatigued

// ACE Advanced Throwing
force ace_advanced_throwing_enabled = true;
force ace_advanced_throwing_enablePickUp = true;
force ace_advanced_throwing_enablePickUpAttached = true;
force ace_advanced_throwing_showMouseControls = true;
force ace_advanced_throwing_showThrowArc = true;

// ACE Advanced Vehicle Damage
force ace_vehicle_damage_enableCarDamage = false;
force ace_vehicle_damage_enabled = true;
force ace_vehicle_damage_removeAmmoDuringCookoff = true;

// ACE Arsenal
force ace_arsenal_allowDefaultLoadouts = true;
force ace_arsenal_allowSharedLoadouts = true;
ace_arsenal_camInverted = false;
ace_arsenal_enableIdentityTabs = true;
ace_arsenal_enableModIcons = true;
ace_arsenal_EnableRPTLog = false;
ace_arsenal_fontHeight = 4.5;

// ACE Artillery
ace_artillerytables_advancedCorrections = false;
ace_artillerytables_disableArtilleryComputer = false;
force ace_mk6mortar_airResistanceEnabled = false;
force ace_mk6mortar_allowCompass = true;
force ace_mk6mortar_allowComputerRangefinder = true;
force ace_mk6mortar_useAmmoHandling = false;

// ACE Captives
force ace_captives_allowHandcuffOwnSide = false;
force ace_captives_allowSurrender = true;
force ace_captives_requireSurrender = 2;
force ace_captives_requireSurrenderAi = false;

// ACE Common
ace_common_allowFadeMusic = true;
force ace_common_checkPBOsAction = 0;
force ace_common_checkPBOsCheckAll = false;
force ace_common_checkPBOsWhitelist = "[]";
ace_common_displayTextColor = [0,0,0,0.1];
ace_common_displayTextFontColor = [1,1,1,1];
ace_common_epilepsyFriendlyMode = false;
ace_common_progressBarInfo = 2;
ace_common_settingFeedbackIcons = 1;
ace_common_settingProgressBarLocation = 0;
force ace_noradio_enabled = true;

// ACE Cook off
force ace_cookoff_ammoCookoffDuration = 1;
force ace_cookoff_enable = 0;
force ace_cookoff_enableAmmobox = false;
force ace_cookoff_enableAmmoCookoff = false;
force ace_cookoff_enableFire = true;
force ace_cookoff_probabilityCoef = 1;

// ACE Crew Served Weapons
ace_csw_ammoHandling = 2;
ace_csw_defaultAssemblyMode = false;
ace_csw_dragAfterDeploy = false;
ace_csw_handleExtraMagazines = true;
ace_csw_progressBarTimeCoefficent = 1;

// ACE Dragging
force ace_dragging_dragAndFire = true;

// ACE Explosives
ace_explosives_customTimerDefault = 30;
ace_explosives_customTimerMax = 900;
ace_explosives_customTimerMin = 5;
force ace_explosives_explodeOnDefuse = false;
force ace_explosives_punishNonSpecialists = true;
force ace_explosives_requireSpecialist = false;

// ACE Field Rations
force acex_field_rations_affectAdvancedFatigue = false;
force acex_field_rations_enabled = false;
acex_field_rations_hudShowLevel = 0;
acex_field_rations_hudTransparency = -1;
acex_field_rations_hudType = 0;
force acex_field_rations_hungerSatiated = 1;
force acex_field_rations_terrainObjectActions = true;
force acex_field_rations_thirstQuenched = 1;
force acex_field_rations_timeWithoutFood = 2;
force acex_field_rations_timeWithoutWater = 2;
force acex_field_rations_waterSourceActions = 2;

// ACE Fire
force ace_fire_enabled = false;
force ace_fire_enableFlare = true;

// ACE Fortify
acex_fortify_settingHint = 2;

// ACE Fragmentation Simulation
force ace_frag_enabled = true;
force ace_frag_maxTrack = 10;
force ace_frag_maxTrackPerFrame = 10;
force ace_frag_reflectionsEnabled = false;
force ace_frag_spallEnabled = false;

// ACE G-Forces
force ace_gforces_coef = 1;
force ace_gforces_enabledFor = 1;

// ACE Goggles
force ace_goggles_effects = 3;
ace_goggles_showClearGlasses = false;
ace_goggles_showInThirdPerson = false;

// ACE Grenades
ace_grenades_convertExplosives = true;

// ACE Headless
acex_headless_delay = 15;
acex_headless_enabled = false;
acex_headless_endMission = 0;
acex_headless_log = false;
acex_headless_transferLoadout = 0;

// ACE Hearing
force ace_hearing_autoAddEarplugsToUnits = false;
force ace_hearing_disableEarRinging = true;
force ace_hearing_earplugsVolume = 0.5;
force ace_hearing_enableCombatDeafness = false;
force ace_hearing_enabledForZeusUnits = true;
force ace_hearing_unconsciousnessVolume = 0.4;

// ACE Interaction
force ace_interaction_disableNegativeRating = true;
force ace_interaction_enableGroupRenaming = true;
force ace_interaction_enableMagazinePassing = true;
force ace_interaction_enableTeamManagement = true;
force ace_interaction_enableWeaponAttachments = true;
ace_interaction_interactWithTerrainObjects = false;

// ACE Logistics
force ace_cargo_enable = true;
force ace_cargo_enableRename = true;
force ace_cargo_loadTimeCoefficient = 5;
ace_cargo_openAfterUnload = 0;
force ace_cargo_paradropTimeCoefficent = 2.5;
force ace_rearm_distance = 20;
force ace_rearm_level = 0;
force ace_rearm_supply = 0;
force ace_refuel_hoseLength = 20;
force ace_refuel_rate = 12;
force ace_repair_addSpareParts = true;
force ace_repair_autoShutOffEngineWhenStartingRepair = false;
force ace_repair_consumeItem_toolKit = 0;
ace_repair_displayTextOnRepair = true;
force ace_repair_engineerSetting_fullRepair = 2;
force ace_repair_engineerSetting_repair = 1;
force ace_repair_engineerSetting_wheel = 0;
force ace_repair_fullRepairLocation = 2;
force ace_repair_fullRepairRequiredItems = ["ace_repair_anyToolKit"];
force ace_repair_locationsBoostTraining = false;
force ace_repair_miscRepairRequiredItems = ["ace_repair_anyToolKit"];
force ace_repair_repairDamageThreshold = 0.6;
force ace_repair_repairDamageThreshold_engineer = 0.4;
force ace_repair_wheelRepairRequiredItems = [];

// ACE Magazine Repack
force ace_magazinerepack_repackLoadedMagazines = true;
force ace_magazinerepack_timePerAmmo = 1.5;
force ace_magazinerepack_timePerBeltLink = 8;
force ace_magazinerepack_timePerMagazine = 2;

// ACE Map
force ace_map_BFT_Enabled = false;
force ace_map_BFT_HideAiGroups = true;
force ace_map_BFT_Interval = 1;
force ace_map_BFT_ShowPlayerNames = false;
force ace_map_DefaultChannel = -1;
force ace_map_mapGlow = true;
force ace_map_mapIllumination = false;
force ace_map_mapLimitZoom = false;
force ace_map_mapShake = true;
force ace_map_mapShowCursorCoordinates = false;
force ace_markers_moveRestriction = 0;
force ace_markers_timestampEnabled = true;
ace_markers_timestampFormat = "HH:MM";
ace_markers_timestampHourFormat = 24;

// ACE Map Gestures
force ace_map_gestures_allowCurator = true;
force ace_map_gestures_allowSpectator = true;
force ace_map_gestures_briefingMode = 0;
ace_map_gestures_defaultColor = [1,0.88,0,0.7];
ace_map_gestures_defaultLeadColor = [1,0.88,0,0.95];
force ace_map_gestures_enabled = true;
force ace_map_gestures_interval = 0.03;
force ace_map_gestures_maxRange = 10;
force ace_map_gestures_maxRangeCamera = 14;
ace_map_gestures_nameTextColor = [0.2,0.2,0.2,0.3];
force ace_map_gestures_onlyShowFriendlys = true;

// ACE Medical
force ace_medical_ai_enabledFor = 2;
force ace_medical_AIDamageThreshold = 1;
force ace_medical_bleedingCoefficient = 0.8;
force ace_medical_blood_bloodLifetime = 600;
force ace_medical_blood_enabledFor = 2;
force ace_medical_blood_maxBloodObjects = 100;
force ace_medical_deathChance = 1;
force ace_medical_enableVehicleCrashes = true;
force ace_medical_fatalDamageSource = 0;
ace_medical_feedback_bloodVolumeEffectType = 0;
ace_medical_feedback_enableHUDIndicators = true;
ace_medical_feedback_painEffectType = 0;
force ace_medical_fractureChance = 0.6;
force ace_medical_fractures = 1;
ace_medical_gui_bloodLossColor_0 = [1,1,1,1];
ace_medical_gui_bloodLossColor_1 = [1,0.95,0.64,1];
ace_medical_gui_bloodLossColor_2 = [1,0.87,0.46,1];
ace_medical_gui_bloodLossColor_3 = [1,0.8,0.33,1];
ace_medical_gui_bloodLossColor_4 = [1,0.72,0.24,1];
ace_medical_gui_bloodLossColor_5 = [1,0.63,0.15,1];
ace_medical_gui_bloodLossColor_6 = [1,0.54,0.08,1];
ace_medical_gui_bloodLossColor_7 = [1,0.43,0.02,1];
ace_medical_gui_bloodLossColor_8 = [1,0.3,0,1];
ace_medical_gui_bloodLossColor_9 = [1,0,0,1];
ace_medical_gui_damageColor_0 = [1,1,1,1];
ace_medical_gui_damageColor_1 = [0.75,0.95,1,1];
ace_medical_gui_damageColor_2 = [0.62,0.86,1,1];
ace_medical_gui_damageColor_3 = [0.54,0.77,1,1];
ace_medical_gui_damageColor_4 = [0.48,0.67,1,1];
ace_medical_gui_damageColor_5 = [0.42,0.57,1,1];
ace_medical_gui_damageColor_6 = [0.37,0.47,1,1];
ace_medical_gui_damageColor_7 = [0.31,0.36,1,1];
ace_medical_gui_damageColor_8 = [0.22,0.23,1,1];
ace_medical_gui_damageColor_9 = [0,0,1,1];
ace_medical_gui_enableActions = 0;
ace_medical_gui_enableMedicalMenu = 1;
ace_medical_gui_enableSelfActions = true;
force ace_medical_gui_interactionMenuShowTriage = 1;
force ace_medical_gui_maxDistance = 3;
ace_medical_gui_openAfterTreatment = true;
force ace_medical_ivFlowRate = 2;
force ace_medical_limping = 1;
force ace_medical_painCoefficient = 1;
force ace_medical_painUnconsciousChance = 0.1;
force ace_medical_playerDamageThreshold = 2;
force ace_medical_spontaneousWakeUpChance = 0.5;
force ace_medical_spontaneousWakeUpEpinephrineBoost = 1;
force ace_medical_statemachine_AIUnconsciousness = false;
force ace_medical_statemachine_cardiacArrestBleedoutEnabled = false;
force ace_medical_statemachine_cardiacArrestTime = 240;
force ace_medical_statemachine_fatalInjuriesAI = 0;
force ace_medical_statemachine_fatalInjuriesPlayer = 2;
force ace_medical_treatment_advancedBandages = 0;
force ace_medical_treatment_advancedDiagnose = 2;
force ace_medical_treatment_advancedMedication = true;
force ace_medical_treatment_allowBodyBagUnconscious = false;
force ace_medical_treatment_allowLitterCreation = true;
force ace_medical_treatment_allowSelfIV = 1;
force ace_medical_treatment_allowSelfPAK = 0;
force ace_medical_treatment_allowSelfStitch = 0;
force ace_medical_treatment_allowSharedEquipment = 1;
force ace_medical_treatment_clearTrauma = 1;
force ace_medical_treatment_consumePAK = 0;
force ace_medical_treatment_consumeSurgicalKit = 0;
force ace_medical_treatment_convertItems = 0;
force ace_medical_treatment_cprSuccessChanceMax = 0.7;
force ace_medical_treatment_cprSuccessChanceMin = 0.5;
force ace_medical_treatment_holsterRequired = 0;
force ace_medical_treatment_litterCleanupDelay = 75;
force ace_medical_treatment_locationEpinephrine = 0;
force ace_medical_treatment_locationIV = 0;
force ace_medical_treatment_locationPAK = 0;
force ace_medical_treatment_locationsBoostTraining = false;
force ace_medical_treatment_locationSurgicalKit = 0;
force ace_medical_treatment_maxLitterObjects = 50;
force ace_medical_treatment_medicEpinephrine = 0;
force ace_medical_treatment_medicIV = 1;
force ace_medical_treatment_medicPAK = 1;
force ace_medical_treatment_medicSurgicalKit = 1;
force ace_medical_treatment_timeCoefficientPAK = 1;
force ace_medical_treatment_treatmentTimeAutoinjector = 5;
force ace_medical_treatment_treatmentTimeBodyBag = 15;
force ace_medical_treatment_treatmentTimeCPR = 10;
force ace_medical_treatment_treatmentTimeIV = 12;
force ace_medical_treatment_treatmentTimeSplint = 7;
force ace_medical_treatment_treatmentTimeTourniquet = 3.5;
force ace_medical_treatment_woundReopenChance = 1;
force ace_medical_treatment_woundStitchTime = 5;

// ACE Name Tags
ace_nametags_ambientBrightnessAffectViewDist = 1;
ace_nametags_defaultNametagColor = [0.77,0.51,0.08,1];
ace_nametags_nametagColorBlue = [0.67,0.67,1,1];
ace_nametags_nametagColorGreen = [0.67,1,0.67,1];
ace_nametags_nametagColorMain = [1,1,1,1];
ace_nametags_nametagColorRed = [1,0.67,0.67,1];
ace_nametags_nametagColorYellow = [1,1,0.67,1];
force ace_nametags_playerNamesMaxAlpha = 0.8;
force ace_nametags_playerNamesViewDistance = 5;
force ace_nametags_showCursorTagForVehicles = false;
ace_nametags_showNamesForAI = false;
ace_nametags_showPlayerNames = 1;
force ace_nametags_showPlayerRanks = false;
ace_nametags_showSoundWaves = 1;
ace_nametags_showVehicleCrewInfo = true;
ace_nametags_tagSize = 2;

// ACE Nightvision
force ace_nightvision_aimDownSightsBlur = 0;
force ace_nightvision_disableNVGsWithSights = false;
force ace_nightvision_effectScaling = 0.4;
force ace_nightvision_fogScaling = 0.4;
force ace_nightvision_noiseScaling = 0.4;
force ace_nightvision_shutterEffects = false;

// ACE Overheating
force ace_overheating_cookoffCoef = 0;
force ace_overheating_displayTextOnJam = true;
force ace_overheating_enabled = true;
force ace_overheating_heatCoef = 1;
force ace_overheating_jamChanceCoef = 1.75;
force ace_overheating_overheatingDispersion = true;
force ace_overheating_overheatingRateOfFire = true;
ace_overheating_particleEffectsAndDispersionDistance = 3000;
ace_overheating_showParticleEffects = true;
ace_overheating_showParticleEffectsForEveryone = false;
force ace_overheating_unJamFailChance = 0.1;
force ace_overheating_unJamOnreload = false;
force ace_overheating_unJamOnSwapBarrel = false;

// ACE Pointing
force ace_finger_enabled = true;
ace_finger_indicatorColor = [0.83,0.68,0.21,0.75];
force ace_finger_indicatorForSelf = true;
force ace_finger_maxRange = 10;

// ACE Pylons
force ace_pylons_enabledForZeus = true;
force ace_pylons_enabledFromAmmoTrucks = true;
force ace_pylons_rearmNewPylons = false;
force ace_pylons_requireEngineer = false;
force ace_pylons_requireToolkit = true;
force ace_pylons_searchDistance = 15;
force ace_pylons_timePerPylon = 5;

// ACE Quick Mount
force ace_quickmount_distance = 3;
force ace_quickmount_enabled = true;
ace_quickmount_enableMenu = 3;
ace_quickmount_priority = 0;
force ace_quickmount_speed = 18;

// ACE Respawn
force ace_respawn_removeDeadBodiesDisconnected = false;
force ace_respawn_savePreDeathGear = false;

// ACE Scopes
force ace_scopes_correctZeroing = true;
force ace_scopes_deduceBarometricPressureFromTerrainAltitude = false;
force ace_scopes_defaultZeroRange = 100;
force ace_scopes_enabled = true;
force ace_scopes_forceUseOfAdjustmentTurrets = true;
force ace_scopes_overwriteZeroRange = false;
force ace_scopes_simplifiedZeroing = true;
ace_scopes_useLegacyUI = false;
force ace_scopes_zeroReferenceBarometricPressure = 1013.25;
force ace_scopes_zeroReferenceHumidity = 0;
force ace_scopes_zeroReferenceTemperature = 15;

// ACE Sitting
force acex_sitting_enable = true;

// ACE Spectator
force ace_spectator_enableAI = false;
force ace_spectator_maxFollowDistance = 20;
force ace_spectator_restrictModes = 0;
force ace_spectator_restrictVisions = 0;

// ACE Switch Units
force ace_switchunits_enableSafeZone = true;
force ace_switchunits_enableSwitchUnits = false;
force ace_switchunits_safeZoneRadius = 100;
force ace_switchunits_switchToCivilian = false;
force ace_switchunits_switchToEast = false;
force ace_switchunits_switchToIndependent = false;
force ace_switchunits_switchToWest = false;

// ACE Trenches
force ace_trenches_bigEnvelopeDigDuration = 25;
force ace_trenches_bigEnvelopeRemoveDuration = 15;
force ace_trenches_smallEnvelopeDigDuration = 20;
force ace_trenches_smallEnvelopeRemoveDuration = 12;

// ACE Uncategorized
force ace_fastroping_requireRopeItems = false;
force ace_gunbag_swapGunbagEnabled = true;
force ace_hitreactions_minDamageToTrigger = 0.1;
ace_inventory_inventoryDisplaySize = 0;
force ace_laser_dispersionCount = 2;
force ace_microdagr_mapDataAvailable = 2;
force ace_microdagr_waypointPrecision = 3;
ace_optionsmenu_showNewsOnMainMenu = true;
force ace_overpressure_distanceCoefficient = 1;
force ace_parachute_failureChance = 0;
force ace_parachute_hideAltimeter = false;
ace_tagging_quickTag = 1;

// ACE Vehicle Lock
force ace_vehiclelock_defaultLockpickStrength = 10;
force ace_vehiclelock_lockVehicleInventory = false;
force ace_vehiclelock_vehicleStartingLockState = -1;

// ACE Vehicles
ace_vehicles_hideEjectAction = true;
force ace_vehicles_keepEngineRunning = false;
ace_vehicles_speedLimiterStep = 5;

// ACE View Distance Limiter
force ace_viewdistance_enabled = true;
force ace_viewdistance_limitViewDistance = 5000;
ace_viewdistance_objectViewDistanceCoeff = 5;
ace_viewdistance_viewDistanceAirVehicle = 3000;
ace_viewdistance_viewDistanceLandVehicle = 3000;
ace_viewdistance_viewDistanceOnFoot = 2000;

// ACE Weapons
ace_common_persistentLaserEnabled = false;
force ace_laserpointer_enabled = true;
ace_reload_displayText = true;
ace_reload_showCheckAmmoSelf = false;
ace_weaponselect_displayText = true;

// ACE Weather
force ace_weather_enabled = false;
ace_weather_showCheckAirTemperature = true;
force ace_weather_updateInterval = 60;
force ace_weather_windSimulation = false;

// ACE Wind Deflection
force ace_winddeflection_enabled = false;
force ace_winddeflection_simulationInterval = 0.05;
force ace_winddeflection_vehicleEnabled = false;

// ACE Zeus
force ace_zeus_autoAddObjects = true;
force ace_zeus_canCreateZeus = -1;
force ace_zeus_radioOrdnance = false;
force ace_zeus_remoteWind = false;
force ace_zeus_revealMines = 0;
force ace_zeus_zeusAscension = false;
force ace_zeus_zeusBird = false;

// ACRE2
force acre_sys_core_automaticAntennaDirection = true;
force acre_sys_core_defaultRadioVolume = 0.8;
force acre_sys_core_fullDuplex = false;
acre_sys_core_godVolume = 1;
force acre_sys_core_ignoreAntennaDirection = true;
force acre_sys_core_interference = true;
acre_sys_core_postmixGlobalVolume = 1;
acre_sys_core_premixGlobalVolume = 1;
force acre_sys_core_revealToAI = 1;
acre_sys_core_spectatorVolume = 1;
force acre_sys_core_terrainLoss = 1;
force acre_sys_core_ts3ChannelName = "ACRE";
force acre_sys_core_ts3ChannelPassword = "";
force acre_sys_core_ts3ChannelSwitch = true;
acre_sys_core_unmuteClients = true;
force acre_sys_signal_signalModel = 1;

// ACRE2 Animations
force radioAnims_cba_ads = true;
force radioAnims_cba_Earpieces = "[""G_WirelessEarpiece_F""]";
force radioAnims_cba_main = true;
force radioAnims_cba_preference_Others = "Hand";
force radioAnims_cba_preference_PRC148 = "Hand";
force radioAnims_cba_preference_PRC152 = "Vest";
force radioAnims_cba_preference_PRC343 = "Vest";
force radioAnims_cba_preference_SEM52SL = "Vest";
force radioAnims_cba_vehicles = true;
force radioAnims_cba_vestarmor = true;
force radioAnims_cba_vests = "[]";

// ACRE2 Zeus
force acre_sys_zeus_zeusCanSpectate = true;
force acre_sys_zeus_zeusCommunicateViaCamera = true;
force acre_sys_zeus_zeusDefaultVoiceSource = false;

// BettIR
force BettIR_ViewDistance = 300;

// Enhanced Movement Rework
force emr_main_allowMidairClimbing = false;
force emr_main_blacklistStr = "";
force emr_main_climbingEnabled = true;
force emr_main_climbOnDuty = 3.4;
force emr_main_climbOverDuty = 3;
force emr_main_dropDuty = 0.7;
force emr_main_enableWalkableSurface = true;
force emr_main_enableWeightCheck = true;
force emr_main_jumpDuty = 1.5;
force emr_main_jumpingEnabled = true;
force emr_main_jumpingLoadCoefficient = 1;
force emr_main_jumpVelocity = 2;
force emr_main_maxClimbHeight = 2;
force emr_main_maxDropHeight = 5;
force emr_main_maxWeightClimb1 = 100;
force emr_main_maxWeightClimb2 = 40;
force emr_main_maxWeightClimb3 = 10;
force emr_main_maxWeightJump = 100;
force emr_main_preventHighVaulting = false;
force emr_main_staminaCoefficient = 1.5;
force emr_main_whitelistStr = "";

// GRAD Trenches
force grad_trenches_functions_allowBigEnvelope = true;
force grad_trenches_functions_allowCamouflage = true;
force grad_trenches_functions_allowDigging = true;
force grad_trenches_functions_allowGiantEnvelope = true;
force grad_trenches_functions_allowLongEnvelope = true;
force grad_trenches_functions_allowShortEnvelope = true;
force grad_trenches_functions_allowSmallEnvelope = true;
force grad_trenches_functions_allowVehicleEnvelope = true;
force grad_trenches_functions_bigEnvelopeDigTime = 40;
force grad_trenches_functions_buildFatigueFactor = 0.5;
force grad_trenches_functions_camouflageRequireEntrenchmentTool = false;
force grad_trenches_functions_giantEnvelopeDigTime = 90;
force grad_trenches_functions_LongEnvelopeDigTime = 100;
force grad_trenches_functions_shortEnvelopeDigTime = 20;
force grad_trenches_functions_smallEnvelopeDigTime = 30;
force grad_trenches_functions_stopBuildingAtFatigueMax = false;
force grad_trenches_functions_vehicleEnvelopeDigTime = 120;

// NIArms
force niarms_accswitch = true;
force niarms_magSwitch = true;

// Tier 1 Artillery Mod
force T1AM_AllowMapClick = false;
force T1AM_AuthorizedClasses = "B_Soldier_SL_F"; // NATO SL unit is authorised
force T1AM_AuthorizedVariables = "s_1"; // commander is authorised for artillery, can add other units here if you want
force T1AM_AuthorizeEveryone = false;
T1AM_DEBUG_DisableInitialMiss = false;
T1AM_DEBUG_DisableRandomSpread = false;
T1AM_Debug_Mode = false;
T1AM_DEBUG_ShowRounds = false;
force T1AM_ExcludedArtyClasses = "";
force T1AM_ExcludedArtyVariables = "";
force T1AM_ModEnabled = true;
force T1AM_PrepTimes = 1;
force T1AM_ShowOtherRadioMessages = 1;

// Turret Enhanced
force Fat_Lurch_Grid = true;
Fat_Lurch_GridNum = 6;
force Fat_Lurch_MapSlew = true;
force Fat_Lurch_Markers = true;
force Fat_Lurch_Measure = true;
force Fat_Lurch_ShowAz = true;
force Fat_Lurch_ShowEl = true;
force Fat_Lurch_ShowNorth = true;
force Fat_Lurch_ShowTarget = true;