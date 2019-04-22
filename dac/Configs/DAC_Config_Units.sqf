//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
// NATO (A3) (BLUFOR)
	case 0:
		{
			_Unit_Pool_S = ["B_Soldier_F", "B_Helipilot_F", "B_Soldier_SL_F", "B_Soldier_F", "B_soldier_LAT_F", "B_Soldier_GL_F", "B_soldier_AR_F", "B_HeavyGunner_F", "B_medic_F"];
			_Unit_Pool_V = ["B_MRAP_01_F", "B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_Truck_01_transport_F","B_Truck_01_covered_F"];
			_Unit_Pool_T = ["B_MBT_01_TUSK_F","B_MBT_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","B_MBT_01_mlrs_F",""];
			_Unit_Pool_A = ["B_Heli_Transport_01_F"];
		};
//-------------------------------------------------------------------------------------------------
// FIA (A3) (BLUFOR)
	case 1:
		{
			_Unit_Pool_S = ["B_G_Soldier_F", "B_G_Soldier_F", "B_G_Soldier_SL_F", "B_G_Soldier_F", "B_G_Soldier_LAT_F", "B_G_Soldier_GL_F", "B_G_Soldier_AR_F", "B_G_medic_F"];
			_Unit_Pool_V = ["B_G_Offroad_01_F", "B_G_Offroad_01_F", "B_G_Van_01_transport_F"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// US Army (Woodland) (RHS) (BLUFOR)
	case 2:
		{
			_Unit_Pool_S = ["rhsusf_army_ucp_combatcrewman", "rhsusf_army_ucp_helipilot", "rhsusf_army_ucp_squadleader", "rhsusf_army_ucp_rifleman", "rhsusf_army_ucp_riflemanat", "rhsusf_army_ucp_grenadier", "rhsusf_army_ucp_autorifleman", "rhsusf_army_ucp_medic"];
			_Unit_Pool_V = ["rhsusf_m1025_w_m2", "rhsusf_m1025_w_mk19", "rhsusf_m1025_w", "rhsusf_m998_w_4dr"];
			_Unit_Pool_T = ["rhsusf_m113_usarmy", "rhsusf_m113_usarmy_M240", "rhsusf_m113_usarmy_MK19", "", "RHS_M2A3_wd", "rhsusf_m1a1aimwd_usarmy"];
			_Unit_Pool_A = ["RHS_UH60M", "RHS_CH_47F", "RHS_AH64D_wd_GS"];
		};
//-------------------------------------------------------------------------------------------------
// US Army (Desert) (RHS) (BLUFOR)
	case 3:
		{
			_Unit_Pool_S = ["rhsusf_army_ocp_combatcrewman", "rhsusf_army_ocp_helipilot", "rhsusf_army_ocp_squadleader", "rhsusf_army_ocp_rifleman", "rhsusf_army_ocp_riflemanat", "rhsusf_army_ocp_grenadier", "rhsusf_army_ocp_autorifleman", "rhsusf_army_ocp_medic"];
			_Unit_Pool_V = ["rhsusf_m1025_d_m2", "rhsusf_m1025_d_mk19", "rhsusf_m1025_d", "rhsusf_m998_d_4dr"];
			_Unit_Pool_T = ["rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240", "rhsusf_m113d_usarmy_MK19", "rhsusf_m998_d_4dr", "RHS_M2A3", "rhsusf_m1a1aimd_usarmy"];
			_Unit_Pool_A = ["RHS_UH60M_d", "RHS_CH_47F_10", "RHS_AH64D_GS"];
		};
//-------------------------------------------------------------------------------------------------
// US Marines (Woodland) (RHS) (BLUFOR)
	case 4:
		{
			_Unit_Pool_S = ["rhsusf_usmc_marpat_wd_combatcrewman", "rhsusf_usmc_marpat_wd_helipilot", "rhsusf_usmc_marpat_wd_squadleader", "rhsusf_usmc_marpat_wd_rifleman", "rhsusf_usmc_marpat_wd_riflemanat", "rhsusf_usmc_marpat_wd_grenadier", "rhsusf_usmc_marpat_wd_autorifleman_m249", "rhsusf_navy_marpat_wd_medic"];
			_Unit_Pool_V = ["rhsusf_m1025_w_s_m2", "rhsusf_m1025_w_s_Mk19", "rhsusf_m1025_w_s", "rhsusf_m998_w_s_4dr"];
			_Unit_Pool_T = ["rhsusf_m998_w_s_4dr", "rhsusf_m1a1fep_wd"];
			_Unit_Pool_A = ["RHS_UH1Y_UNARMED", "RHS_UH1Y", "RHS_AH1Z_wd_GS"];
		};
//-------------------------------------------------------------------------------------------------
// US Marines (Desert) (RHS) (BLUFOR)
	case 5:
		{
			_Unit_Pool_S = ["rhsusf_usmc_marpat_d_combatcrewman", "rhsusf_usmc_marpat_d_helipilot", "rhsusf_usmc_marpat_d_squadleader", "rhsusf_usmc_marpat_d_rifleman", "rhsusf_usmc_marpat_d_riflemanat", "rhsusf_usmc_marpat_d_grenadier", "rhsusf_usmc_marpat_d_autorifleman_m249", "rhsusf_navy_marpat_d_medic"];
			_Unit_Pool_V = ["rhsusf_m1025_d_s_m2", "rhsusf_m1025_d_s_Mk19", "rhsusf_m1025_d_s", "rhsusf_m998_d_s_4dr"];
			_Unit_Pool_T = ["rhsusf_m1a1fep_d"];
			_Unit_Pool_A = ["RHS_UH1Y_UNARMED_d", "RHS_UH1Y_d", "RHS_AH1Z_GS"];
		};
//-------------------------------------------------------------------------------------------------
// Afghan Army (LOP) (BLUFOR)
	case 6:
		{
			_Unit_Pool_S = ["LOP_AA_Infantry_Crewman", "LOP_AA_Infantry_Crewman", "LOP_AA_Infantry_SL", "LOP_AA_Infantry_Rifleman", "LOP_AA_Infantry_AT", "LOP_AA_Infantry_GL", "LOP_AA_Infantry_MG", "LOP_AA_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_AA_M1025_W_M2", "LOP_AA_M1025_W_Mk19", "LOP_AA_M1025_D", "LOP_AA_M998_D_4DR", "LOP_AA_Truck"];
			_Unit_Pool_T = ["LOP_AA_BMP1", "LOP_AA_BMP2", "LOP_AA_M113_W", "LOP_AA_ZSU234"];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// Afghan Police (LOP) (BLUFOR)
	case 7:
		{
			_Unit_Pool_S = ["LOP_AA_Police_TL", "LOP_AA_Police_TL", "LOP_AA_Police_SL", "LOP_AA_Police_Rifleman", "LOP_AA_Police_MG", "LOP_AA_Police_Corpsman"];
			_Unit_Pool_V = ["LOP_AA_Offroad_Police", "LOP_AA_Offroad_M2_Police"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// Chernarus Defence Force (LOP) (BLUFOR)
	case 8:
		{
			_Unit_Pool_S = ["LOP_CDF_Infantry_Crewman", "LOP_CDF_Infantry_Pilot", "LOP_CDF_Infantry_TL", "LOP_CDF_Infantry_Rifleman", "LOP_CDF_Infantry_AT", "LOP_CDF_Infantry_GL", "LOP_CDF_Infantry_MG", "LOP_CDF_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_CDF_KAMAZ_Transport", "LOP_CDF_KAMAZ_Covered", "LOP_CDF_KAMAZ_Covered", "LOP_CDF_UAZ_Open", "LOP_CDF_Ural", "LOP_CDF_Ural_open"];
			_Unit_Pool_T = ["LOP_CDF_BMD1", "LOP_CDF_BMD2", "LOP_CDF_BMP1", "LOP_CDF_BMP1D", "LOP_CDF_BMP2", "LOP_CDF_BMP2D", "LOP_CDF_BTR60", "LOP_CDF_BTR70", "LOP_CDF_T72BA", "LOP_CDF_T72BB", "LOP_CDF_ZSU234"];
			_Unit_Pool_A = ["LOP_CDF_Mi24V_FAB", "LOP_CDF_Mi8MT_Cargo"];
		};
//-------------------------------------------------------------------------------------------------
// Iraqi Army (LOP) (BLUFOR)
	case 9:
		{
			_Unit_Pool_S = ["LOP_IA_Infantry_Crewman", "LOP_IA_Infantry_Crewman", "LOP_IA_Infantry_SL", "LOP_IA_Infantry_Rifleman", "LOP_IA_Infantry_AT", "LOP_IA_Infantry_GL", "LOP_IA_Infantry_MG", "LOP_IA_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_IA_HEMTT_Transport_D", "LOP_IA_M1025_W_M2", "LOP_IA_M1025_W_Mk19", "LOP_IA_M1025_D", "LOP_IA_M998_D_4DR"];
			_Unit_Pool_T = ["LOP_IA_BMP1", "LOP_IA_BMP2", "LOP_IA_M113_W", "LOP_IA_M1A1_AIM_D", "LOP_IA_ZSU234"];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// CSAT (A3) (OPFOR)
	case 10:
		{
			_Unit_Pool_S = ["O_crew_F", "O_helipilot_F", "O_Soldier_SL_F", "O_Soldier_F", "O_Soldier_LAT_F", "O_Soldier_GL_F", "O_Soldier_AR_F", "O_HeavyGunner_F", "O_medic_F"];
			_Unit_Pool_V = ["O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F", "O_Truck_03_covered_F", "O_Truck_02_transport_F"];
			_Unit_Pool_T = ["O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_F", "O_MBT_02_cannon_F", "O_APC_Tracked_02_AA_F"];
			_Unit_Pool_A = ["O_Heli_Light_02_F", "O_Heli_Transport_04_box_F", "O_Heli_Attack_02_F"];
		};
//-------------------------------------------------------------------------------------------------
// FIA (A3) (OPFOR)
	case 11:
		{
			_Unit_Pool_S = ["O_G_Soldier_F", "O_G_Soldier_F", "O_G_Soldier_SL_F", "O_G_Soldier_F", "O_G_Soldier_LAT_F", "O_G_Soldier_GL_F", "O_G_Soldier_AR_F", "O_G_medic_F"];
			_Unit_Pool_V = ["O_G_Offroad_01_F", "O_G_Offroad_01_F", "O_G_Van_01_transport_F"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// Russia (EMR) (RHS) (OPFOR)
	case 12:
		{
			_Unit_Pool_S = ["rhs_vdv_combatcrew", "rhs_pilot", "rhs_vdv_sergeant", "rhs_vdv_rifleman", "rhs_vdv_grenadier_rpg", "rhs_vdv_grenadier", "rhs_vdv_machinegunner", "rhs_vdv_medic"];
			_Unit_Pool_V = ["rhs_btr60_vdv","rhs_btr70_vdv"];
			_Unit_Pool_T = ["rhs_btr80a_vdv","rhs_bmd1", "rhs_bmd2", "rhs_bmd4_vdv"];
			_Unit_Pool_A = ["RHS_Mi24P_CAS_vdv","RHS_Mi24V_vdv","RHS_Mi8AMT_vdv","RHS_Mi8MTV3_vdv"];
		};
//-------------------------------------------------------------------------------------------------
// Russia (Flora) (RHS)  (OPFOR)
	case 13:
		{
			_Unit_Pool_S = ["rhs_vdv_flora_combatcrew", "rhs_pilot", "rhs_vdv_flora_sergeant", "rhs_vdv_flora_rifleman", "rhs_vdv_flora_grenadier_rpg", "rhs_vdv_flora_grenadier", "rhs_vdv_flora_machinegunner", "rhs_vdv_flora_medic"];
			_Unit_Pool_V = ["rhs_btr60_vdv","rhs_btr70_vdv"];
			_Unit_Pool_T = ["rhs_btr80a_vdv","rhs_bmd1", "rhs_bmd2", "rhs_bmd4_vdv"];
			_Unit_Pool_A = ["RHS_Mi24P_CAS_vdv","RHS_Mi24V_vdv","RHS_Mi8AMT_vdv","RHS_Mi8MTV3_vdv"];
		};
//-------------------------------------------------------------------------------------------------
// Russia (Mountain Flora) (RHS) (OPFOR)
	case 14:
		{
			_Unit_Pool_S = ["rhs_vdv_mflora_combatcrew", "rhs_pilot", "rhs_vdv_mflora_sergeant", "rhs_vdv_mflora_rifleman", "rhs_vdv_mflora_grenadier_rpg", "rhs_vdv_mflora_grenadier", "rhs_vdv_mflora_machinegunner", "rhs_vdv_mflora_medic"];
			_Unit_Pool_V = ["rhs_btr60_vdv","rhs_btr70_vdv"];
			_Unit_Pool_T = ["rhs_btr80a_vdv","rhs_bmd1", "rhs_bmd2", "rhs_bmd4_vdv"];
			_Unit_Pool_A = ["RHS_Mi24P_CAS_vdv","RHS_Mi24V_vdv","RHS_Mi8AMT_vdv","RHS_Mi8MTV3_vdv"];
		};
//-------------------------------------------------------------------------------------------------
// ChDKZ (LOP) (OPFOR)
	case 15:
		{
			_Unit_Pool_S = ["LOP_ChDKZ_Infantry_Crewman", "LOP_ChDKZ_Infantry_Pilot", "LOP_ChDKZ_Infantry_SL", "LOP_ChDKZ_Infantry_Rifleman", "LOP_ChDKZ_Infantry_AT", "LOP_ChDKZ_Infantry_GL", "LOP_ChDKZ_Infantry_MG", "LOP_ChDKZ_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_ChDKZ_UAZ", "LOP_ChDKZ_UAZ_Open", "LOP_ChDKZ_Ural", "LOP_ChDKZ_Ural_open", "LOP_ChDKZ_BTR60"];
			_Unit_Pool_T = ["LOP_ChDKZ_BMP1", "LOP_ChDKZ_BMP2", "LOP_ChDKZ_T72BA"];
			_Unit_Pool_A = ["LOP_ChDKZ_Mi8MT_Cargo"];
		};
//-------------------------------------------------------------------------------------------------
// Sarahani Liberation Army (LOP) (OPFOR)
	case 16:
		{
			_Unit_Pool_S = ["LOP_SLA_Infantry_Crewman", "LOP_SLA_Infantry_Pilot", "LOP_SLA_Infantry_SL", "LOP_SLA_Infantry_Rifleman", "LOP_SLA_Infantry_AT", "LOP_SLA_Infantry_GL", "LOP_SLA_Infantry_MG", "LOP_SLA_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_SLA_UAZ", "LOP_SLA_UAZ_Open", "LOP_SLA_Ural", "LOP_SLA_Ural_open", "LOP_SLA_BTR60"];
			_Unit_Pool_T = ["LOP_SLA_BMP1", "LOP_SLA_BMP2", "LOP_SLA_BMP2"];
			_Unit_Pool_A = ["LOP_SLA_Mi8MT_Cargo"];
		};
//-------------------------------------------------------------------------------------------------
// Novorussian Forces (LOP) (OPFOR)
	case 17:
		{
			_Unit_Pool_S = ["LOP_US_Infantry_Crewman", "LOP_US_Infantry_Crewman", "LOP_US_Infantry_SL", "LOP_US_Infantry_Rifleman", "LOP_US_Infantry_AT", "LOP_US_Infantry_GL", "LOP_US_Infantry_MG", "LOP_US_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_US_UAZ", "LOP_US_UAZ_Open", "LOP_US_Ural", "LOP_US_Ural_open", "LOP_US_BTR60"];
			_Unit_Pool_T = ["LOP_US_BMP1", "LOP_US_BMP2", "LOP_US_T72BA"];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// AAF (A3) (INDFOR)
	case 18:
		{
			_Unit_Pool_S = ["I_crew_F", "I_helipilot_F", "I_Soldier_SL_F", "I_soldier_F", "I_Soldier_LAT_F", "I_Soldier_GL_F", "I_Soldier_AR_F", "I_medic_F"];
			_Unit_Pool_V = ["I_MRAP_03_F", "I_MRAP_03_gmg_F", "I_MRAP_03_hmg_F", "I_Truck_02_transport_F", "I_Truck_02_transport_F"];
			_Unit_Pool_T = ["I_APC_tracked_03_cannon_F", "I_MBT_03_cannon_F", "I_APC_Wheeled_03_cannon_F"];
			_Unit_Pool_A = ["I_Heli_Transport_02_F", "I_Heli_light_03_F", "I_Heli_light_03_unarmed_F"];
		};
//-------------------------------------------------------------------------------------------------
// FIA (A3) (INDFOR)
	case 19:
		{
			_Unit_Pool_S = ["I_G_Soldier_F", "I_G_Soldier_F", "I_G_Soldier_SL_F", "I_G_Soldier_F", "I_G_Soldier_LAT_F", "I_G_Soldier_GL_F", "I_G_Soldier_AR_F", "I_G_medic_F"];
			_Unit_Pool_V = ["I_G_Offroad_01_F", "I_G_Offroad_01_F", "I_G_Van_01_transport_F"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// PMC (LOP) (INDFOR)
	case 20:
		{
			_Unit_Pool_S = ["LOP_PMC_Infantry_Cam", "LOP_PMC_Infantry_Pilot", "LOP_PMC_Infantry_SL", "LOP_PMC_Infantry_Rifleman", "LOP_PMC_Infantry_AT", "LOP_PMC_Infantry_GL", "LOP_PMC_Infantry_MG", "LOP_PMC_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_PMC_SUV", "LOP_PMC_Offroad", "LOP_PMC_Offroad_M2", "LOP_PMC_Truck"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = ["LOP_PMC_MH9", "LOP_PMC_M900", "LOP_PMC_MH9_armed", "LOP_PMC_Mi8AMT"];
		};
//-------------------------------------------------------------------------------------------------
// Insurgents (ChDKZ) (RHS) (INDFOR)
	case 21:
		{
			_Unit_Pool_S = ["rhs_g_Crew_F", "rhs_g_Crew_F", "rhs_g_Soldier_SL_F", "rhs_g_Soldier_SL_F", "rhs_g_Soldier_AT_F", "rhs_g_Soldier_GL_F", "rhs_g_Soldier_AR_F", "rhs_g_medic_F"];
			_Unit_Pool_V = ["RHS_UAZ_chdkz", "rhs_uaz_open_chdkz", "rhs_btr70_chdkz", "rhs_ural_chdkz"];
			_Unit_Pool_T = ["rhs_bmd2_chdkz", "rhs_bmd2_chdkz"];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// African Militia (LOP) (INDFOR)
	case 22:
		{
			_Unit_Pool_S = ["LOP_AFR_Driver", "LOP_AFR_Driver", "LOP_AFR_Infantry_SL", "LOP_AFR_Infantry_Rifleman", "LOP_AFR_Infantry_AT", "LOP_AFR_Infantry_GL", "LOP_AFR_Infantry_AR", "LOP_AFR_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_AFR_Landrover", "LOP_AFR_Offroad", "LOP_AFR_Truck"];
			_Unit_Pool_T = ["LOP_AFR_Landrover_M2", "LOP_AFR_Offroad_M2"];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// Afghan Militia (LOP) (INDFOR)
	case 23:
		{
			_Unit_Pool_S = ["LOP_AM_Driver", "LOP_AM_Driver", "LOP_AM_Infantry_SL", "LOP_AM_Infantry_Rifleman", "LOP_AM_Infantry_AT", "LOP_AM_Infantry_GL", "LOP_AM_Infantry_AR", "LOP_AM_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_AM_Landrover", "LOP_AM_Offroad", "LOP_AM_Truck"];
			_Unit_Pool_T = ["LOP_AM_Landrover_M2", "LOP_AM_Offroad_M2"];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// Terrorists (ISTS) (LOP) (INDFOR)
	case 24:
		{
			_Unit_Pool_S = ["LOP_ISTS_Infantry_Rifleman", "LOP_ISTS_Infantry_Rifleman", "LOP_ISTS_Infantry_SL", "LOP_ISTS_Infantry_Rifleman", "LOP_ISTS_Infantry_AT", "LOP_ISTS_Infantry_GL", "LOP_ISTS_Infantry_AR", "LOP_ISTS_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_ISTS_Landrover", "LOP_ISTS_Landrover_M2", "LOP_ISTS_M1025_W_M2", "LOP_ISTS_M1025_W_Mk19", "LOP_ISTS_M1025_D", "LOP_ISTS_M998_D_4DR", "LOP_ISTS_Offroad", "LOP_ISTS_Offroad_M2", "LOP_ISTS_Truck"];
			_Unit_Pool_T = ["LOP_ISTS_BMP1", "LOP_ISTS_BMP2", "LOP_ISTS_BTR60", "LOP_ISTS_M113_W", "LOP_ISTS_T72BA"];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// Royal Army Corps of Sarahani (RACS) (LOP) (INDFOR)
	case 25:
		{
			_Unit_Pool_S = ["LOP_RACS_Infantry_Crewman", "LOP_RACS_Infantry_Pilot", "LOP_RACS_Infantry_SL", "LOP_RACS_Infantry_Rifleman", "LOP_RACS_Infantry_AT", "LOP_RACS_Infantry_GL", "LOP_RACS_Infantry_MG", "LOP_RACS_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_RACS_Landrover", "LOP_RACS_Landrover_M2", "LOP_RACS_Truck"];
			_Unit_Pool_T = ["LOP_RACS_M113_W", "LOP_RACS_T72BA"];
			_Unit_Pool_A = ["LOP_RACS_MH9_armed", "LOP_RACS_MH9", "LOP_RACS_UH60M"];
		};
//-------------------------------------------------------------------------------------------------
// Ultranationalists (LOP) (INDFOR)
	case 26:
		{
			_Unit_Pool_S = ["LOP_UA_Infantry_Crewman", "LOP_UA_Infantry_Pilot", "LOP_UA_Infantry_SL", "LOP_UA_Infantry_Rifleman", "LOP_UA_Infantry_AT", "LOP_UA_Infantry_GL", "LOP_UA_Infantry_MG", "LOP_UA_Infantry_Corpsman"];
			_Unit_Pool_V = ["LOP_UA_Infantry_Corpsman", "LOP_UA_Ural", "LOP_UA_Ural_open"];
			_Unit_Pool_T = ["LOP_UA_BMP1", "LOP_UA_BMP2", "LOP_UA_T72BA"];
			_Unit_Pool_A = ["LOP_UA_T72BA"];
		};
//-------------------------------------------------------------------------------------------------
// Chernarussian National Party Guerrillas NAPA (LOP) (INDFOR)
	case 27:
		{
			_Unit_Pool_S = ["LOP_NAPA_Infantry_Rifleman","LOP_NAPA_Infantry_Rifleman","LOP_NAPA_Infantry_SL","LOP_NAPA_Infantry_Rifleman","LOP_NAPA_Infantry_Rifleman","LOP_NAPA_Infantry_GL", "LOP_NAPA_Infantry_Corpsman", "LOP_NAPA_Infantry_AR", "LOP_NAPA_Infantry_AR", "LOP_NAPA_Infantry_AT", "LOP_NAPA_Infantry_AT"];
			_Unit_Pool_V = ["LOP_NAPA_UAZ","LOP_NAPA_UAZ_Open","LOP_NAPA_Ural","LOP_NAPA_Ural_open"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------
// United Nations Security Forces (INDFOR)
	case 28:
		{
			_Unit_Pool_S = ["LOP_UN_Infantry_Crewman","LOP_UN_Infantry_Pilot","LOP_UN_Infantry_SL","LOP_UN_Infantry_Rifleman","LOP_UN_Infantry_Rifleman","LOP_UN_Infantry_GL", "LOP_UN_Infantry_Corpsman", "LOP_UN_Infantry_MG", "LOP_UN_Infantry_MG", "LOP_UN_Infantry_MG_Asst", "LOP_UN_Infantry_AT"];
			_Unit_Pool_V = ["LOP_UN_UAZ","LOP_UN_UAZ_Open","LOP_UN_Ural","LOP_UN_Ural_open"];
			_Unit_Pool_T = ["LOP_UN_BTR60", "LOP_UN_BTR70", "LOP_UN_BMP1", "LOP_UN_BMP1D", "LOP_UN_BMP2", "LOP_UN_BMP2D", "LOP_UN_ZSU234"];
			_Unit_Pool_A = ["LOP_UN_Mi8MT_Cargo", "LOP_UN_Mi8MTV3_FAB", "LOP_UN_Mi8MTV3_UPK23"];
		};
//-------------------------------------------------------------------------------------------------
// Takistani Army (OPFOR)
	case 29:
		{
			_Unit_Pool_S = ["LOP_TKA_Infantry_Crewman","LOP_TKA_Infantry_Pilot","LOP_TKA_Infantry_SL","LOP_TKA_Infantry_Rifleman","LOP_TKA_Infantry_Rifleman","LOP_TKA_Infantry_GL", "LOP_TKA_Infantry_Corpsman", "LOP_TKA_Infantry_MG", "LOP_TKA_Infantry_MG", "LOP_TKA_Infantry_MG_Asst", "LOP_TKA_Infantry_AT"];
			_Unit_Pool_V = ["LOP_TKA_UAZ","LOP_TKA_UAZ_Open","LOP_TKA_Ural","LOP_TKA_Ural_open"];
			_Unit_Pool_T = ["LOP_TKA_BTR60", "LOP_TKA_BTR70", "LOP_TKA_BMP1", "LOP_TKA_BMP1D", "LOP_TKA_BMP2", "LOP_TKA_BMP2D", "LOP_TKA_ZSU234"];
			_Unit_Pool_A = ["LOP_TKA_Mi24V_AT", "LOP_TKA_Mi24V_FAB", "LOP_TKA_Mi24V_UPK23", "LOP_TKA_Mi8MT_Cargo", "LOP_TKA_Mi8MTV3_FAB", "LOP_TKA_Mi8MTV3_UPK23"];
		};
//-------------------------------------------------------------------------------------------------
// Greek Civilian (A3) (CIVILIAN)
	case 30:
		{
			_Unit_Pool_S = ["C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_3_F","C_man_polo_3_F","C_man_polo_3_F"];
			_Unit_Pool_V = ["C_Offroad_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_transport_F"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = ["C_Heli_Light_01_civil_F"];
		};
//-------------------------------------------------------------------------------------------------
// African Civilian (A3) (CIVILIAN)
	case 31:
		{
			_Unit_Pool_S = ["C_man_polo_1_F_afro","C_man_polo_2__afro","C_man_polo_3__afro","C_man_polo_3__afro","C_man_polo_3__afro","C_man_polo_3__afro"];
			_Unit_Pool_V = ["C_Offroad_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_transport_F"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = ["C_Heli_Light_01_civil_F"];
		};
//-------------------------------------------------------------------------------------------------
// German (A3) (IFA)
	case 32:
		{
			_Unit_Pool_S = ["LIB_GER_spg_crew","LIB_GER_pilot","LIB_GER_scout_lieutenant","LIB_GER_AT_soldier","LIB_GER_AT_grenadier","LIB_GER_smgunner","LIB_GER_scout_smgunner","LIB_GER_mgunner","LIB_GER_scout_mgunner","LIB_GER_medic","LIB_GER_soldier_camo2_base","LIB_GER_soldier_camo_base","LIB_GER_soldier_camo3_base","LIB_GER_soldier_camo4_base","LIB_GER_soldier_camo5_base","LIB_GER_sapper","LIB_GER_stggunner"];
			_Unit_Pool_V = ["LIB_SdKfz251","LIB_SdKfz251_FFV","LIB_Kfz1_MG42_camo","LIB_OpelBlitz_Open_Y_Camo"];
			_Unit_Pool_T = ["LIB_StuG_III_G","LIB_PzKpfwIV_H_tarn51c","LIB_PzKpfwV"];
			_Unit_Pool_A = ["LIB_RBAF_Ju87"];
		};
//-------------------------------------------------------------------------------------------------
// 3CB Afghan Militia (A3) (IFA)
	case 33:
		{
			_Unit_Pool_S = ["UK3CB_TKM_I_RIF_2","UK3CB_TKM_I_RIF_2","UK3CB_TKM_I_TL","UK3CB_TKM_I_RIF_2","UK3CB_TKM_I_RIF_1","UK3CB_TKM_I_MD","UK3CB_TKM_I_MG","UK3CB_TKM_I_AR","UK3CB_TKM_I_AT","UK3CB_TKM_I_GL"];
			_Unit_Pool_V = ["UK3CB_TKM_I_Datsun_Pkm","UK3CB_TKM_I_Hilux_GMG","UK3CB_TKM_I_Hilux_Rocket_Arty","UK3CB_TKM_I_Hilux_Dshkm","UK3CB_TKM_I_Hilux_Pkm","UK3CB_TKM_I_Hilux_Rocket","UK3CB_TKM_I_Hilux_Spg9","UK3CB_TKM_I_Hilux_Zu23"];
			_Unit_Pool_T = ["UK3CB_TKM_I_BTR40_MG","UK3CB_TKM_I_BTR60"];
			_Unit_Pool_A = ["UK3CB_TKM_I_T34","UK3CB_TKM_I_T55"];
		};
//-------------------------------------------------------------------------------------------------
  Default
  {
    if(DAC_Basic_Value != 5) then
    {
      DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value",
      hintc "Error: DAC_Config_Units > No valid config number";
    };
    if(true) exitwith {};
  };
};

if(count _this == 2) then
{
  _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
}
else
{
  _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray