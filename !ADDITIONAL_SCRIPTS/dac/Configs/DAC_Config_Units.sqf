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
/* TEMPLATE - USE THIS FOR EVERY FACTION TO ENSURE A GOOD SPREAD OF INFANTRY TYPES
	case 0:
		{
			_Unit_Pool_S = [vehicle_crew,helipilot,squad_leader,medic,machinegunner,lat,grenadier,marksman,rifleman,rifleman,rifleman,rifleman,rifleman,rifleman];
			_Unit_Pool_V = [only unarmed transport vehicles or armed technicals - nothing armored or with anti vehicle weaponry];
			_Unit_Pool_T = [wheeled and tracked heavily armored or armed vehicles];
			_Unit_Pool_A = [helicopters];
		};
//Blank Template

	case x: // Name - VANILLA/MOD (Other)
		{
			_Unit_Pool_S = [];
			_Unit_Pool_V = [];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};

*/


//-----------------------------------------------------------------
// START OPFOR FACTIONS
	case 0: // CSAT - VANILLA 
		{
			_Unit_Pool_S = ["O_crew_F","O_helipilot_F","O_Soldier_SL_F","O_medic_F","O_Soldier_AR_F","O_Soldier_LAT_F","O_Soldier_GL_F","O_soldier_M_F","O_Soldier_F","O_Soldier_F","O_Soldier_F","O_Soldier_F","O_Soldier_F"];
			_Unit_Pool_V = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_Truck_02_transport_F","O_Truck_02_covered_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_MRAP_02_gmg_F","O_LSV_02_armed_F","O_LSV_02_AT_F","O_LSV_02_unarmed_F"];
			_Unit_Pool_T = ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_v2_F","O_APC_Tracked_02_AA_F","O_MBT_04_cannon_F","O_MBT_04_command_F","O_MBT_02_cannon_F"];
			_Unit_Pool_A = ["O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_bench_F","O_Heli_Attack_02_F","O_Heli_Transport_04_covered_F"];
		};
	case 1: // CSAT - VANILLA (Pacific) (Apex)
		{
			_Unit_Pool_S = ["O_T_Crew_F","O_T_Helipilot_F","O_T_Soldier_SL_F","O_T_Medic_F","O_T_Soldier_AR_F","O_T_Soldier_LAT_F","O_T_Soldier_GL_F","O_T_Soldier_M_F","O_T_Soldier_F","O_T_Soldier_F","O_T_Soldier_F","O_T_Soldier_F","O_T_Soldier_F"];
			_Unit_Pool_V = ["O_T_LSV_02_armed_F","O_T_Truck_02_F","rhssaf_m1025_olive_m2","rhs_tigr_sts_vdv"];
			_Unit_Pool_T = ["rhs_btr80a_vv","rhs_bmp1_msv","rhs_t72be_tv"];
			_Unit_Pool_A = ["rhs_ka60_c","GR_Mi_171_1"];
		};
	case 2: // FIA - VANILLA (OPFOR)
		{
			_Unit_Pool_S = ["O_G_Soldier_lite_F","O_G_medic_F","O_G_Soldier_TL_F","O_G_medic_F","O_G_Soldier_AR_F","O_G_Soldier_LAT2_F","O_G_Soldier_M_F","O_G_Soldier_GL_F","O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Soldier_F"];
			_Unit_Pool_V = ["O_G_Offroad_01_F","O_G_Offroad_01_armed_F","O_G_Offroad_01_AT_F","O_G_Van_01_transport_F","O_G_Van_02_transport_F","O_G_Offroad_01_repair_F"];
			_Unit_Pool_T = ["O_G_Offroad_01_armed_F","O_G_Offroad_01_AT_F"];
			_Unit_Pool_A = [];
		};
	case 3: // Chernarus Communist Millitia - (3CB)
		{
			_Unit_Pool_S = ["UK3CB_CCM_O_RIF_BOLT","UK3CB_CCM_O_RIF_1","UK3CB_CCM_O_SL","UK3CB_CCM_O_MD","UK3CB_CCM_O_AR","UK3CB_CCM_O_AT","UK3CB_CCM_O_DEM","UK3CB_CCM_O_MK","UK3CB_CCM_O_RIF_1","UK3CB_CCM_O_RIF_1","UK3CB_CCM_O_RIF_1","UK3CB_CCM_O_RIF_2","UK3CB_CCM_O_RIF_BOLT"];
			_Unit_Pool_V = ["UK3CB_CCM_O_Datsun_Civ_Closed","UK3CB_CCM_O_Datsun_Civ_Open","UK3CB_CCM_O_Datsun_Open","UK3CB_CCM_O_Datsun_Pkm","UK3CB_CCM_O_Hatchback","UK3CB_CCM_O_Hilux_Civ_Closed","UK3CB_CCM_O_Hilux_Dshkm","UK3CB_CCM_O_Hilux_Civ_Open","UK3CB_CCM_O_Hilux_Pkm","UK3CB_CCM_O_Kamaz_Covered","UK3CB_CCM_O_Kamaz_Open","UK3CB_CCM_O_Lada","UK3CB_CCM_O_LR_Closed","UK3CB_CCM_O_LR_M2","UK3CB_CCM_O_V3S_Closed","UK3CB_CCM_O_V3S_Open","UK3CB_CCM_O_Sedan","UK3CB_CCM_O_Skoda","UK3CB_CCM_O_S1203","UK3CB_CCM_O_UAZ_Closed","UK3CB_CCM_O_UAZ_Dshkm","UK3CB_CCM_O_UAZ_Open","UK3CB_CCM_O_Ural","UK3CB_CCM_O_Ural_Open","UK3CB_CCM_O_Gaz24","UK3CB_CCM_O_Golf"];
			_Unit_Pool_T = ["UK3CB_CCM_O_Datsun_Civ_Closed","UK3CB_CCM_O_Datsun_Civ_Open","UK3CB_CCM_O_Datsun_Open","UK3CB_CCM_O_Datsun_Pkm","UK3CB_CCM_O_Hatchback","UK3CB_CCM_O_Hilux_Civ_Closed","UK3CB_CCM_O_Hilux_Dshkm","UK3CB_CCM_O_Hilux_Civ_Open","UK3CB_CCM_O_Hilux_Pkm","UK3CB_CCM_O_Kamaz_Covered","UK3CB_CCM_O_Kamaz_Open","UK3CB_CCM_O_Lada","UK3CB_CCM_O_LR_Closed","UK3CB_CCM_O_LR_M2","UK3CB_CCM_O_V3S_Closed","UK3CB_CCM_O_V3S_Open","UK3CB_CCM_O_Sedan","UK3CB_CCM_O_Skoda","UK3CB_CCM_O_S1203","UK3CB_CCM_O_UAZ_Closed","UK3CB_CCM_O_UAZ_Dshkm","UK3CB_CCM_O_UAZ_Open","UK3CB_CCM_O_Ural","UK3CB_CCM_O_Ural_Open","UK3CB_CCM_O_Gaz24","UK3CB_CCM_O_Golf"];
			_Unit_Pool_A = [];
		};
	case 4: // Cold War USSR Early - (3CB)
		{
			_Unit_Pool_S = ["UK3CB_CW_SOV_O_EARLY_CREW","UK3CB_CW_SOV_O_EARLY_HELI_PILOT","UK3CB_CW_SOV_O_EARLY_SL","UK3CB_CW_SOV_O_EARLY_MD","UK3CB_CW_SOV_O_EARLY_AR","UK3CB_CW_SOV_O_EARLY_MG","UK3CB_CW_SOV_O_EARLY_LAT","UK3CB_CW_SOV_O_EARLY_GL","UK3CB_CW_SOV_O_EARLY_MK","UK3CB_CW_SOV_O_EARLY_AT","UK3CB_CW_SOV_O_EARLY_RIF_1","UK3CB_CW_SOV_O_EARLY_RIF_1","UK3CB_CW_SOV_O_EARLY_RIF_2"];
			_Unit_Pool_V = ["UK3CB_CW_SOV_O_EARLY_BTR40","UK3CB_CW_SOV_O_EARLY_BTR40_MG","UK3CB_CW_SOV_O_EARLY_UAZ_AGS30","UK3CB_CW_SOV_O_EARLY_UAZ_Closed","UK3CB_CW_SOV_O_EARLY_UAZ_MG","UK3CB_CW_SOV_O_EARLY_UAZ_Open","UK3CB_CW_SOV_O_EARLY_UAZ_SPG9","UK3CB_CW_SOV_O_EARLY_Ural","UK3CB_CW_SOV_O_EARLY_Ural_Open","UK3CB_CW_SOV_O_EARLY_BRDM2_HQ","UK3CB_CW_SOV_O_EARLY_BRDM2_UM","UK3CB_CW_SOV_O_EARLY_Ural_Zu23"];
			_Unit_Pool_T = ["UK3CB_CW_SOV_O_EARLY_BRDM2_ATGM","UK3CB_CW_SOV_O_EARLY_BMD1","UK3CB_CW_SOV_O_EARLY_BMD1K","UK3CB_CW_SOV_O_EARLY_BMD1P","UK3CB_CW_SOV_O_EARLY_BMD1PK","UK3CB_CW_SOV_O_EARLY_BMD1R","UK3CB_CW_SOV_O_EARLY_BMP1","UK3CB_CW_SOV_O_EARLY_BMP2","UK3CB_CW_SOV_O_EARLY_BMP2K","UK3CB_CW_SOV_O_EARLY_BRM1K","UK3CB_CW_SOV_O_EARLY_BTR60","UK3CB_CW_SOV_O_EARLY_BTR70","UK3CB_CW_SOV_O_EARLY_MTLB_PKT","UK3CB_CW_SOV_O_EARLY_T55","UK3CB_CW_SOV_O_EARLY_T72A","UK3CB_CW_SOV_O_EARLY_T72BM","UK3CB_CW_SOV_O_EARLY_T72B","UK3CB_CW_SOV_O_EARLY_T72BA","UK3CB_CW_SOV_O_EARLY_T72BB","UK3CB_CW_SOV_O_EARLY_T72BC","UK3CB_CW_SOV_O_EARLY_T72BD","UK3CB_CW_SOV_O_EARLY_T72BE"];
			_Unit_Pool_A = ["UK3CB_CW_SOV_O_EARLY_Mi_24P","UK3CB_CW_SOV_O_EARLY_Mi_24V","UK3CB_CW_SOV_O_EARLY_Mi8AMTSh","UK3CB_CW_SOV_O_EARLY_Mi8","UK3CB_CW_SOV_O_EARLY_Mi8AMT"];
		};
	case 5: // Cold War USSR Late - (3CB)
		{
			_Unit_Pool_S = ["UK3CB_CW_SOV_O_LATE_CREW","UK3CB_CW_SOV_O_LATE_HELI_PILOT","UK3CB_CW_SOV_O_LATE_SL","UK3CB_CW_SOV_O_LATE_MD","UK3CB_CW_SOV_O_LATE_MG","UK3CB_CW_SOV_O_LATE_AR","UK3CB_CW_SOV_O_LATE_LAT","UK3CB_CW_SOV_O_LATE_AT","UK3CB_CW_SOV_O_LATE_GL","UK3CB_CW_SOV_O_LATE_MK","UK3CB_CW_SOV_O_LATE_RIF_1","UK3CB_CW_SOV_O_LATE_RIF_1","UK3CB_CW_SOV_O_LATE_RIF_2"];
			_Unit_Pool_V = ["UK3CB_CW_SOV_O_LATE_BRDM2_HQ","UK3CB_CW_SOV_O_LATE_BRDM2_UM","UK3CB_CW_SOV_O_LATE_UAZ_AGS30","UK3CB_CW_SOV_O_LATE_UAZ_Closed","UK3CB_CW_SOV_O_LATE_UAZ_MG","UK3CB_CW_SOV_O_LATE_UAZ_Open","UK3CB_CW_SOV_O_LATE_UAZ_SPG9","UK3CB_CW_SOV_O_LATE_Ural","UK3CB_CW_SOV_O_LATE_Ural_Open","UK3CB_CW_SOV_O_LATE_BTR40","UK3CB_CW_SOV_O_LATE_BTR40_MG","UK3CB_CW_SOV_O_LATE_Ural_Zu23"];
			_Unit_Pool_T = ["UK3CB_CW_SOV_O_LATE_BMD1","UK3CB_CW_SOV_O_LATE_BMD1K","UK3CB_CW_SOV_O_LATE_BMD1P","UK3CB_CW_SOV_O_LATE_BMD1PK","UK3CB_CW_SOV_O_LATE_BMD1R","UK3CB_CW_SOV_O_LATE_BMP1","UK3CB_CW_SOV_O_LATE_BMP2","UK3CB_CW_SOV_O_LATE_BMP2K","UK3CB_CW_SOV_O_LATE_BRM1K","UK3CB_CW_SOV_O_LATE_BTR60","UK3CB_CW_SOV_O_LATE_BTR70","UK3CB_CW_SOV_O_LATE_BTR80","UK3CB_CW_SOV_O_LATE_BTR80a","UK3CB_CW_SOV_O_LATE_MTLB_PKT","UK3CB_CW_SOV_O_LATE_ZsuTank","UK3CB_CW_SOV_O_LATE_T55","UK3CB_CW_SOV_O_LATE_T72A","UK3CB_CW_SOV_O_LATE_T72BM","UK3CB_CW_SOV_O_LATE_T72B","UK3CB_CW_SOV_O_LATE_T72BA","UK3CB_CW_SOV_O_LATE_T72BB","UK3CB_CW_SOV_O_LATE_T72BC","UK3CB_CW_SOV_O_LATE_T72BD","UK3CB_CW_SOV_O_LATE_T72BE","UK3CB_CW_SOV_O_LATE_BRDM2","UK3CB_CW_SOV_O_LATE_BRDM2_ATGM"];
			_Unit_Pool_A = ["UK3CB_CW_SOV_O_LATE_Mi_24P","UK3CB_CW_SOV_O_LATE_Mi_24V","UK3CB_CW_SOV_O_LATE_Mi8AMTSh","UK3CB_CW_SOV_O_LATE_Mi8","UK3CB_CW_SOV_O_LATE_Mi8AMT"];
		};
	case 6: // Takistan Insurgents - (3CB)
		{
			_Unit_Pool_S = ["UK3CB_TKM_O_RIF_1","UK3CB_TKM_O_RIF_2","UK3CB_TKM_O_SL","UK3CB_TKM_O_MD","UK3CB_TKM_O_AR","UK3CB_TKM_O_MG","UK3CB_TKM_O_LAT","UK3CB_TKM_O_AT","UK3CB_TKM_O_GL","UK3CB_TKM_O_MK","UK3CB_TKM_O_RIF_1","UK3CB_TKM_O_RIF_1","UK3CB_TKM_O_RIF_2"];
			_Unit_Pool_V = ["UK3CB_TKM_O_BTR40","UK3CB_TKM_O_BTR40_MG","UK3CB_TKM_O_V3S_Zu23","UK3CB_TKM_O_Ural_Zu23","UK3CB_TKM_O_BRDM2_HQ","UK3CB_TKM_O_BRDM2_UM","UK3CB_TKM_O_Datsun_Open","UK3CB_TKM_O_Datsun_Pkm","UK3CB_TKM_O_Hilux_GMG","UK3CB_TKM_O_Hilux_Rocket_Arty","UK3CB_TKM_O_Hilux_Dshkm","UK3CB_TKM_O_Hilux_Open","UK3CB_TKM_O_Hilux_Pkm","UK3CB_TKM_O_Hilux_Rocket","UK3CB_TKM_O_Hilux_Spg9","UK3CB_TKM_O_Hilux_Zu23","UK3CB_TKM_O_LR_Closed","UK3CB_TKM_O_LR_AGS30","UK3CB_TKM_O_LR_M2","UK3CB_TKM_O_LR_Open","UK3CB_TKM_O_LR_SPG9","UK3CB_TKM_O_LR_SF_AGS30","UK3CB_TKM_O_LR_SF_M2","UK3CB_TKM_O_V3S_Closed","UK3CB_TKM_O_V3S_Open","UK3CB_TKM_O_UAZ_AGS30","UK3CB_TKM_O_UAZ_Closed","UK3CB_TKM_O_UAZ_Dshkm","UK3CB_TKM_O_UAZ_Open","UK3CB_TKM_O_UAZ_SPG9","UK3CB_TKM_O_Ural_Covered","UK3CB_TKM_O_Ural_Open"];
			_Unit_Pool_T = ["UK3CB_TKM_O_BMP1","UK3CB_TKM_O_BTR60","UK3CB_TKM_O_MTLB_PKT","UK3CB_TKM_O_T34","UK3CB_TKM_O_T55","UK3CB_TKM_O_BRDM2","UK3CB_TKM_O_BRDM2_ATGM"];
			_Unit_Pool_A = [];
		};
	case 7: // Takistan National Army (3CB)
		{
			_Unit_Pool_S = ["UK3CB_TKA_O_CREW","UK3CB_TKA_O_HELI_PILOT","UK3CB_TKA_O_SL","UK3CB_TKA_O_MD","UK3CB_TKA_O_AR","UK3CB_TKA_O_MG","UK3CB_TKA_O_LAT","UK3CB_TKA_O_AT","UK3CB_TKA_O_GL","UK3CB_TKA_O_MK","UK3CB_TKA_O_RIF_1","UK3CB_TKA_O_RIF_2","UK3CB_TKA_O_RIF_2"];
			_Unit_Pool_V = ["UK3CB_TKA_O_BTR40","UK3CB_TKA_O_BTR40_MG","UK3CB_TKA_O_Ural_Zu23","UK3CB_TKA_O_BRDM2_HQ","UK3CB_TKA_O_BRDM2_UM","UK3CB_TKA_O_Tigr_STS","UK3CB_TKA_O_Tigr","UK3CB_TKA_O_GAZ_Vodnik_Cannon","UK3CB_TKA_O_GAZ_Vodnik_GMG","UK3CB_TKA_O_GAZ_Vodnik_HMG","UK3CB_TKA_O_GAZ_Vodnik_KVPT","UK3CB_TKA_O_GAZ_Vodnik_MedEvac","UK3CB_TKA_O_GAZ_Vodnik_PKT","UK3CB_TKA_O_Hilux_GMG","UK3CB_TKA_O_Hilux_Closed","UK3CB_TKA_O_Hilux_Dshkm","UK3CB_TKA_O_Hilux_Open","UK3CB_TKA_O_Hilux_Pkm","UK3CB_TKA_O_Hilux_Spg9","UK3CB_TKA_O_Hilux_Zu23","UK3CB_TKA_O_LR_SF_AGS30","UK3CB_TKA_O_LR_SF_M2","UK3CB_TKA_O_UAZ_AGS30","UK3CB_TKA_O_UAZ_Closed","UK3CB_TKA_O_UAZ_MG","UK3CB_TKA_O_UAZ_Open","UK3CB_TKA_O_UAZ_SPG9","UK3CB_TKA_O_Ural","UK3CB_TKA_O_Ural_Open"];
			_Unit_Pool_T = ["UK3CB_TKA_O_BRDM2","UK3CB_TKA_O_BRDM2_ATGM","UK3CB_TKA_O_BMP1","UK3CB_TKA_O_BMP2","UK3CB_TKA_O_BMP2K","UK3CB_TKA_O_BTR60","UK3CB_TKA_O_BTR70","UK3CB_TKA_O_BTR80","UK3CB_TKA_O_BTR80a","UK3CB_TKA_O_M113_M2","UK3CB_TKA_O_M113_unarmed","UK3CB_TKA_O_MTLB_PKT","UK3CB_TKA_O_ZsuTank","UK3CB_TKA_O_T34","UK3CB_TKA_O_T55","UK3CB_TKA_O_T72A","UK3CB_TKA_O_T72BM","UK3CB_TKA_O_T72B"];
			_Unit_Pool_A = ["UK3CB_TKA_O_Mi_24P","UK3CB_TKA_O_Mi_24V","UK3CB_TKA_O_Mi8AMTSh","UK3CB_TKA_O_Mi8","UK3CB_TKA_O_Mi8AMT","UK3CB_TKA_O_UH1H_M240","UK3CB_TKA_O_UH1H"];
		};
	case 8: // African Militia (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_AFR_OPF_Infantry_Rifleman","LOP_AFR_OPF_Infantry_Rifleman_2","LOP_AFR_OPF_Infantry_SL","LOP_AFR_OPF_Infantry_Corpsman","LOP_AFR_OPF_Infantry_AR","LOP_AFR_OPF_Infantry_AT","LOP_AFR_OPF_Infantry_GL","LOP_AFR_OPF_Infantry_Marksman","LOP_AFR_OPF_Infantry_Rifleman_7","LOP_AFR_OPF_Infantry_AR_2","LOP_AFR_OPF_Infantry_Rifleman_8","LOP_AFR_OPF_Infantry_Rifleman_6","LOP_AFR_OPF_Infantry_Rifleman_5"];
			_Unit_Pool_V = ["LOP_AFR_OPF_Landrover","LOP_AFR_OPF_Landrover_M2","LOP_AFR_OPF_Landrover_SPG9","LOP_AFR_OPF_Nissan_PKM","LOP_AFR_OPF_Offroad","LOP_AFR_OPF_Offroad_M2","LOP_AFR_OPF_Offroad_AT","LOP_AFR_OPF_Truck"];
			_Unit_Pool_T = ["LOP_AFR_OPF_BTR60","LOP_AFR_OPF_M113_W","LOP_AFR_OPF_T34","LOP_AFR_OPF_T55","LOP_AFR_OPF_T72BA","LOP_AFR_OPF_T72BB"];
			_Unit_Pool_A = [];
		};
	case 9: // Boko Haram (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_BH_Infantry_Driver","LOP_BH_Infantry_Rifleman","LOP_BH_Infantry_SL","LOP_BH_Infantry_Corpsman","LOP_BH_Infantry_AR_2","LOP_BH_Infantry_AR","LOP_BH_Infantry_AT","LOP_BH_Infantry_GL","LOP_BH_Infantry_Marksman","LOP_BH_Infantry_Rifleman_lite","LOP_BH_Infantry_Rifleman","LOP_BH_Infantry_IED","LOP_BH_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_BH_Landrover","LOP_BH_Landrover_M2","LOP_BH_Landrover_SPG9","LOP_BH_Nissan_PKM","LOP_BH_Offroad","LOP_BH_Offroad_M2","LOP_BH_Offroad_AT","LOP_BH_Truck"];
			_Unit_Pool_T = ["LOP_BH_Landrover","LOP_BH_Landrover_M2","LOP_BH_Landrover_SPG9","LOP_BH_Nissan_PKM","LOP_BH_Offroad","LOP_BH_Offroad_M2","LOP_BH_Offroad_AT","LOP_BH_Truck"];
			_Unit_Pool_A = [];
		};
	case 10: // ChDKZ (RHSGREF) (LOPFOR)
		{
			_Unit_Pool_S = ["rhsgref_ins_crew","rhsgref_ins_pilot","rhsgref_ins_squadleader","rhsgref_ins_medic","rhsgref_ins_machinegunner","rhsgref_ins_rifleman_RPG26","rhsgref_ins_grenadier_rpg","rhsgref_ins_grenadier","rhsgref_ins_sniper","rhsgref_ins_rifleman","rhsgref_ins_rifleman_akm","rhsgref_ins_rifleman_aks74","rhsgref_ins_rifleman_aksu"];
			_Unit_Pool_V = ["rhsgref_ins_uaz","rhsgref_ins_uaz_ags","rhsgref_ins_uaz_dshkm","rhsgref_ins_uaz_open","rhsgref_ins_uaz_spg9","rhsgref_BRDM2UM_ins","rhsgref_BRDM2_HQ_ins","rhsgref_ins_gaz66","rhsgref_ins_gaz66o","rhsgref_ins_gaz66_zu23","rhsgref_ins_ural","rhsgref_ins_ural_open","rhsgref_ins_ural_work","rhsgref_ins_ural_Zu23","rhsgref_ins_zil131","rhsgref_ins_zil131_open"];
			_Unit_Pool_T = ["rhsgref_ins_btr60","rhsgref_ins_btr70","rhsgref_ins_zsu234","rhsgref_ins_bmd1","rhsgref_ins_bmd1p","rhsgref_ins_bmd2","rhsgref_ins_bmp1","rhsgref_ins_bmp1d","rhsgref_ins_bmp1k","rhsgref_ins_bmp1p","rhsgref_ins_bmp2e","rhsgref_ins_bmp2","rhsgref_ins_bmp2d","rhsgref_ins_bmp2k","rhsgref_BRDM2_ins","rhsgref_BRDM2_ATGM_ins","rhsgref_ins_t72ba","rhsgref_ins_t72bb","rhsgref_ins_t72bc"];
			_Unit_Pool_A = ["rhsgref_ins_Mi8amt","LOP_ChDKZ_Mi8MTV3_FAB","LOP_ChDKZ_Mi8MTV3_UPK23"];
		};
	case 11: // Irish Republican Army (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_IRA_Infantry_Rifleman","LOP_IRA_Infantry_Rifleman","LOP_IRA_Infantry_SL","LOP_IRA_Infantry_Corpsman","LOP_IRA_Infantry_AR","LOP_IRA_Infantry_AT","LOP_IRA_Infantry_GL","LOP_IRA_Infantry_Marksman","LOP_IRA_Infantry_Rifleman_vz58","LOP_IRA_Infantry_Rifleman_lite","LOP_IRA_Infantry_Rifleman","LOP_IRA_Infantry_Rifleman_PM63","LOP_IRA_Infantry_IED"];
			_Unit_Pool_V = ["LOP_IRA_Landrover","LOP_IRA_Landrover_M2","LOP_IRA_Landrover_SPG9","LOP_IRA_Nissan_PKM","LOP_IRA_Offroad","LOP_IRA_Offroad_M2","LOP_IRA_Offroad_AT","LOP_IRA_Truck"];
			_Unit_Pool_T = ["LOP_IRA_Landrover","LOP_IRA_Landrover_M2","LOP_IRA_Landrover_SPG9","LOP_IRA_Nissan_PKM","LOP_IRA_Offroad","LOP_IRA_Offroad_M2","LOP_IRA_Offroad_AT","LOP_IRA_Truck"];
			_Unit_Pool_A = [];
		};
	case 12: // Islamic State (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_ISTS_OPF_Infantry_Rifleman","LOP_ISTS_OPF_Infantry_Rifleman_5","LOP_ISTS_OPF_Infantry_SL","LOP_ISTS_OPF_Infantry_Corpsman","LOP_ISTS_OPF_Infantry_AR_2","LOP_ISTS_OPF_Infantry_AR","LOP_ISTS_OPF_Infantry_AT","LOP_ISTS_OPF_Infantry_Rifleman_3","LOP_ISTS_OPF_Infantry_GL","LOP_ISTS_OPF_Infantry_Marksman","LOP_ISTS_OPF_Infantry_Rifleman_9","LOP_ISTS_OPF_Infantry_Rifleman_5","LOP_ISTS_OPF_Infantry_Rifleman_8"];
			_Unit_Pool_V = ["LOP_ISTS_OPF_Landrover","LOP_ISTS_OPF_Landrover_M2","LOP_ISTS_OPF_Landrover_SPG9","LOP_ISTS_OPF_Offroad","LOP_ISTS_OPF_Offroad_M2","LOP_ISTS_OPF_Offroad_AT","LOP_ISTS_OPF_Truck","LOP_ISTS_OPF_M1025_W_M2","LOP_ISTS_OPF_M1025_W_Mk19","LOP_ISTS_OPF_M1025_D","LOP_ISTS_OPF_Nissan_PKM","LOP_ISTS_OPF_M998_D_4DR"];
			_Unit_Pool_T = ["LOP_ISTS_OPF_BTR60","LOP_ISTS_OPF_M113_W","LOP_ISTS_OPF_ZSU234","LOP_ISTS_OPF_BMP1","LOP_ISTS_OPF_BMP2","LOP_ISTS_OPF_T34","LOP_ISTS_OPF_T55","LOP_ISTS_OPF_T72BA"];
			_Unit_Pool_A = [];
		};
	case 13: // Korean People's Army (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_NK_Infantry_Crewman","LOP_NK_Infantry_Pilot","LOP_NK_Infantry_SL","LOP_NK_Infantry_Corpsman","LOP_NK_Infantry_MG","LOP_NK_Infantry_AT","LOP_NK_Infantry_Grenadier","LOP_NK_Infantry_Marksman","LOP_NK_Infantry_Rifleman","LOP_NK_Infantry_Rifleman_2","LOP_NK_Infantry_AT_Asst","LOP_NK_Infantry_Rifleman_2","LOP_NK_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_NK_UAZ","LOP_NK_UAZ_AGS","LOP_NK_UAZ_DshKM","LOP_NK_UAZ_Open","LOP_NK_UAZ_SPG","LOP_NK_Ural","LOP_NK_Ural_open"];
			_Unit_Pool_T = ["LOP_NK_BTR60","LOP_NK_BTR80","LOP_NK_BMP1","LOP_NK_T34","LOP_NK_T55","LOP_NK_T72BA","LOP_NK_T72BB"];
			_Unit_Pool_A = [];
		};
	case 14: // Middle Eastern Militia (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_AM_OPF_Infantry_Rifleman","LOP_AM_OPF_Infantry_Rifleman_2","LOP_AM_OPF_Infantry_SL","LOP_AM_OPF_Infantry_Corpsman","LOP_AM_OPF_Infantry_AR","LOP_AM_OPF_Infantry_AT","LOP_AM_OPF_Infantry_GL","LOP_AM_OPF_Infantry_Marksman","LOP_AM_OPF_Infantry_Rifleman","LOP_AM_OPF_Infantry_Rifleman_4","LOP_AM_OPF_Infantry_Rifleman_7","LOP_AM_OPF_Infantry_Rifleman_8","LOP_AM_OPF_Infantry_Rifleman_9"];
			_Unit_Pool_V = ["LOP_AM_OPF_Landrover","LOP_AM_OPF_Landrover_M2","LOP_AM_OPF_Landrover_SPG9","LOP_AM_OPF_Nissan_PKM","LOP_AM_OPF_Offroad","LOP_AM_OPF_Offroad_M2","LOP_AM_OPF_Offroad_AT","LOP_AM_OPF_UAZ","LOP_AM_OPF_UAZ_AGS","LOP_AM_OPF_UAZ_DshKM","LOP_AM_OPF_UAZ_Open","LOP_AM_OPF_UAZ_SPG","LOP_AM_OPF_Truck"];
			_Unit_Pool_T = ["LOP_AM_OPF_BTR60"];
			_Unit_Pool_A = [];
		};
	case 15: // N.V.A (2nd Bat) (UNSUNG)
		{
			_Unit_Pool_S = ["uns_men_NVA_crew_crewman","uns_nvaf_pilot5","uns_men_NVA_daccong_nco","uns_men_NVA_daccong_MED","uns_men_NVA_daccong_HMG","uns_men_NVA_daccong_TRI","uns_men_NVA_daccong_LMG","uns_men_NVA_daccong_AT2","uns_men_NVA_daccong_AT3","uns_men_NVA_daccong_AT","uns_men_NVA_daccong_SAP1","uns_men_NVA_daccong_MRK","uns_men_NVA_daccong_AS2"];
			_Unit_Pool_V = ["uns_BTR152_DSHK","uns_Type55","uns_Type55_M40","uns_zil157","uns_BTR152_ZPU","uns_nvatruck_type65","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_MG","uns_Type55_patrol","uns_Type55_LMG","uns_Type55_twinMG","uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_mg","uns_nvatruck_open","uns_Type55_ZU","uns_nvatruck_s60","uns_nvatruck_zpu","uns_nvatruck_zu23","uns_Type55_mortar"];
			_Unit_Pool_T = ["uns_ot34_85_nva","uns_pt76","uns_t55_nva","uns_t34_85_nva","uns_to55_nva","uns_t54_nva","uns_Type63_mg","pook_ZSU_NVA","pook_ZSU57_NVA"];
			_Unit_Pool_A = ["uns_Mi8T_VPAF","uns_Mi8TV_VPAF_MG","uns_Mi8MB_VPAF_medevac"];
		};
	case 16: // N.V.A (324th Bat) (UNSUNG)
		{
			_Unit_Pool_S = ["uns_men_NVA_crew_crewman","uns_nvaf_pilot5","uns_men_NVA_68_nco","uns_men_NVA_68_MED","uns_men_NVA_68_HMG","uns_men_NVA_68_LMG","uns_men_NVA_68_AT2","uns_men_NVA_68_AT","uns_men_NVA_68_MRK","uns_men_NVA_68_RF2","uns_men_NVA_68_RF1","uns_men_NVA_68_RF3","uns_men_NVA_68_AS1"];
			_Unit_Pool_V = ["uns_BTR152_DSHK","uns_Type55","uns_Type55_M40","uns_zil157","uns_BTR152_ZPU","uns_nvatruck_type65","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_MG","uns_Type55_patrol","uns_Type55_LMG","uns_Type55_twinMG","uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_mg","uns_nvatruck_open","uns_Type55_ZU","uns_nvatruck_s60","uns_nvatruck_zpu","uns_nvatruck_zu23","uns_Type55_mortar"];
			_Unit_Pool_T = ["uns_ot34_85_nva","uns_pt76","uns_t55_nva","uns_t34_85_nva","uns_to55_nva","uns_t54_nva","uns_Type63_mg","pook_ZSU_NVA","pook_ZSU57_NVA"];
			_Unit_Pool_A = ["uns_Mi8T_VPAF","uns_Mi8TV_VPAF_MG","uns_Mi8MB_VPAF_medevac"];
		};
	case 17: // N.V.A (324th Bat) (Recon) (UNSUNG)
		{
			_Unit_Pool_S = ["uns_men_NVA_crew_crewman","uns_nvaf_pilot5","uns_men_NVA_68_Roff","uns_men_NVA_68_Rmed","uns_men_NVA_68_Rmg","uns_men_NVA_68_Ra2","uns_men_NVA_68_AT","uns_men_NVA_68_AT2","uns_men_NVA_68_RRTO","uns_men_NVA_68_Ra1","uns_men_NVA_68_AS7","uns_men_NVA_68_AS5","uns_men_NVA_68_Ra1"];
			_Unit_Pool_V = ["uns_BTR152_DSHK","uns_Type55","uns_Type55_M40","uns_zil157","uns_BTR152_ZPU","uns_nvatruck_type65","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_MG","uns_Type55_patrol","uns_Type55_LMG","uns_Type55_twinMG","uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_mg","uns_nvatruck_open","uns_Type55_ZU","uns_nvatruck_s60","uns_nvatruck_zpu","uns_nvatruck_zu23","uns_Type55_mortar"];
			_Unit_Pool_T = ["uns_ot34_85_nva","uns_pt76","uns_t55_nva","uns_t34_85_nva","uns_to55_nva","uns_t54_nva","uns_Type63_mg","pook_ZSU_NVA","pook_ZSU57_NVA"];
			_Unit_Pool_A = ["uns_Mi8T_VPAF","uns_Mi8TV_VPAF_MG","uns_Mi8MB_VPAF_medevac"];
		};
	case 18: // N.V.A (4th Bat) (UNSUNG)
		{
			_Unit_Pool_S = ["uns_men_NVA_crew_crewman","uns_nvaf_pilot5","uns_men_NVA_recon_65_off","uns_men_NVA_recon_65_MED","uns_men_NVA_recon_65_HMG","uns_men_NVA_recon_65_LMG","uns_men_NVA_recon_65_AT2","uns_men_NVA_recon_65_AT","uns_men_NVA_recon_65_MRK","uns_men_NVA_recon_65_RF2","uns_men_NVA_recon_65_RF3","uns_men_NVA_recon_65_AS5","uns_men_NVA_recon_65_AS3"];
			_Unit_Pool_V = ["uns_BTR152_DSHK","uns_Type55","uns_Type55_M40","uns_zil157","uns_BTR152_ZPU","uns_nvatruck_type65","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_MG","uns_Type55_patrol","uns_Type55_LMG","uns_Type55_twinMG","uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_mg","uns_nvatruck_open","uns_Type55_ZU","uns_nvatruck_s60","uns_nvatruck_zpu","uns_nvatruck_zu23","uns_Type55_mortar"];
			_Unit_Pool_T = ["uns_ot34_85_nva","uns_pt76","uns_t55_nva","uns_t34_85_nva","uns_to55_nva","uns_t54_nva","uns_Type63_mg","pook_ZSU_NVA","pook_ZSU57_NVA"];
			_Unit_Pool_A = ["uns_Mi8T_VPAF","uns_Mi8TV_VPAF_MG","uns_Mi8MB_VPAF_medevac"];
		};
	case 19: // N.V.A (8th Bat) (UNSUNG)
		{
			_Unit_Pool_S = ["uns_men_NVA_crew_crewman","uns_nvaf_pilot5","uns_men_NVA_65_off","uns_men_NVA_65_MED","uns_men_NVA_65_LMG","uns_men_NVA_65_HMG","uns_men_NVA_65_AT","uns_men_NVA_65_AT2","uns_men_NVA_65_RTO","uns_men_NVA_65_MRK","uns_men_NVA_65_AS1","uns_men_NVA_65_RF1","uns_men_NVA_65_RF2"];
			_Unit_Pool_V = ["uns_BTR152_DSHK","uns_Type55","uns_Type55_M40","uns_zil157","uns_BTR152_ZPU","uns_nvatruck_type65","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_MG","uns_Type55_patrol","uns_Type55_LMG","uns_Type55_twinMG","uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_mg","uns_nvatruck_open","uns_Type55_ZU","uns_nvatruck_s60","uns_nvatruck_zpu","uns_nvatruck_zu23","uns_Type55_mortar"];
			_Unit_Pool_T = ["uns_ot34_85_nva","uns_pt76","uns_t55_nva","uns_t34_85_nva","uns_to55_nva","uns_t54_nva","uns_Type63_mg","pook_ZSU_NVA","pook_ZSU57_NVA"];
			_Unit_Pool_A = ["uns_Mi8T_VPAF","uns_Mi8TV_VPAF_MG","uns_Mi8MB_VPAF_medevac"];
		};
	case 20: // Red Army (IFA)
		{
			_Unit_Pool_S = ["LIB_SOV_tank_crew","LIB_SOV_pilot","LIB_SOV_sergeant","LIB_SOV_medic","LIB_SOV_mgunner","LIB_SOV_LAT_Soldier","LIB_SOV_grenadier","LIB_SOV_scout_sniper_autumn","LIB_SOV_LC_rifleman","LIB_SOV_LC_rifleman_summer","LIB_SOV_gun_crew","LIB_SOV_scout_rifleman_autumn","LIB_SOV_operator"];
			_Unit_Pool_V = ["LIB_SOV_M3_Halftrack","LIB_SdKfz251_captured","LIB_GazM1_SOV","LIB_GazM1_SOV_camo_sand","LIB_Scout_M3","LIB_Scout_M3_FFV","LIB_SdKfz251_captured_FFV","LIB_Willys_MB","LIB_Zis5v","LIB_US6_Tent_Cargo","LIB_US6_Open","LIB_Willys_MB_Hood","LIB_Zis5v_61K"];
			_Unit_Pool_T = ["LIB_JS2_43","LIB_M4A2_SOV","LIB_T34_85","LIB_SU85","LIB_T34_76"];
			_Unit_Pool_A = [];
		};
	case 21: // Red Army (Winter) (IFA)
		{
			_Unit_Pool_S = ["LIB_SOV_Sapper_wLIB_SOV_Sapper_w","LIB_SOV_Scout_smgunner_wLIB_SOV_Scout_smgunner_w","LIB_SOV_First_lieutenant_wLIB_SOV_First_lieutenant_w","LIB_SOV_Medic_wLIB_SOV_Medic_w","LIB_SOV_Mgunner_wLIB_SOV_Mgunner_w","LIB_SOV_LAT_Soldier_wLIB_SOV_LAT_Soldier_w","LIB_SOV_AT_soldier_wLIB_SOV_AT_soldier_w","LIB_SOV_grenadier_wLIB_SOV_grenadier_w","LIB_SOV_scout_atrifle_gunner_wLIB_SOV_scout_atrifle_gunner_w","LIB_SOV_Scout_rifleman_wLIB_SOV_Scout_rifleman_w","LIB_SOV_Smgunner_w2LIB_SOV_Smgunner_w2","LIB_SOV_Assault_smgunner_wLIB_SOV_Assault_smgunner_w","LIB_SOV_Rifleman_wLIB_SOV_Rifleman_w"];
			_Unit_Pool_V = ["LIB_SOV_M3_Halftrack_w","LIB_SdKfz251_captured_w","LIB_SdKfz251_captured_FFV_w","LIB_Scout_m3_w","LIB_Scout_M3_FFV_w","LIB_Willys_MB_w","LIB_Willys_MB_Hood_w","LIB_Zis5v_w"];
			_Unit_Pool_T = ["LIB_JS2_43_w","LIB_T34_76_w","LIB_M4A2_SOV_w","LIB_SU85_w","LIB_T34_85_w"];
			_Unit_Pool_A = [];
		};
	case 22: // Russia (MSV) (EMR) (RHS)
		{
			_Unit_Pool_S = ["rhs_msv_emr_driver_armored","rhs_pilot_combat_heli","rhs_msv_emr_sergeant","rhs_msv_emr_medic","rhs_msv_emr_arifleman","rhs_msv_emr_machinegunner","rhs_msv_emr_grenadier_rpg","rhs_msv_emr_LAT","rhs_msv_emr_RShG2","rhs_msv_emr_grenadier","rhs_msv_emr_marksman","rhs_msv_emr_rifleman","rhs_msv_emr_machinegunner_assistant"];
			_Unit_Pool_V = ["rhs_tigr_msv","rhs_tigr_3camo_msv","rhs_tigr_sts_msv","rhs_tigr_sts_3camo_msv","RHS_Ural_Zu23_MSV_01","rhs_zil131_msv","rhs_tigr_m_msv","rhs_tigr_m_3camo_msv","RHS_UAZ_MSV_01","rhs_uaz_open_MSV_01","UK3CB_Ural_Open","rhsgref_BRDM2UM_msv","rhsgref_BRDM2_HQ_msv","rhs_kamaz5350_msv","rhs_kamaz5350_flatbed_msv","RHS_Ural_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_zu23_msv"];
			_Unit_Pool_T = ["rhsgref_BRDM2_msv","rhs_btr60_msv","rhs_btr70_msv","rhsgref_BRDM2_ATGM_msv","rhs_bmp3_late_msv","rhs_bmp3m_msv","rhs_bmp3mera_msv","rhs_brm1k_msv","rhs_Ob_681_2","rhs_prp3_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_bmp2d_msv","rhs_bmp3_msv","rhs_bmp1_msv","rhs_bmp1d_msv","rhs_bmp1k_msv","rhs_bmp1p_msv","rhs_bmp2e_msv","rhs_bmp2_msv","rhs_bmp2k_msv"];
			_Unit_Pool_A = ["RHS_Mi8mt_vvsc"];
		};
	case 23: // Russia (MSV) (Flora) (RHS)
		{
			_Unit_Pool_S = ["rhs_msv_driver_armored","rhs_pilot_combat_heli","rhs_msv_sergeant","rhs_msv_medic","rhs_msv_machinegunner","rhs_msv_arifleman","rhs_msv_LAT","rhs_msv_RShG2","rhs_msv_at","rhs_msv_marksman","rhs_msv_grenadier","rhs_msv_rifleman","rhs_msv_machinegunner_assistant"];
			_Unit_Pool_V = ["rhs_tigr_msv","rhs_tigr_3camo_msv","rhs_tigr_sts_msv","rhs_tigr_sts_3camo_msv","RHS_Ural_Zu23_MSV_01","rhs_zil131_msv","rhs_tigr_m_msv","rhs_tigr_m_3camo_msv","RHS_UAZ_MSV_01","rhs_uaz_open_MSV_01","UK3CB_Ural_Open","rhsgref_BRDM2UM_msv","rhsgref_BRDM2_HQ_msv","rhs_kamaz5350_msv","rhs_kamaz5350_flatbed_msv","RHS_Ural_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_zu23_msv"];
			_Unit_Pool_T = ["rhsgref_BRDM2_msv","rhs_btr60_msv","rhs_btr70_msv","rhsgref_BRDM2_ATGM_msv","rhs_bmp3_late_msv","rhs_bmp3m_msv","rhs_bmp3mera_msv","rhs_brm1k_msv","rhs_Ob_681_2","rhs_prp3_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_bmp2d_msv","rhs_bmp3_msv","rhs_bmp1_msv","rhs_bmp1d_msv","rhs_bmp1k_msv","rhs_bmp1p_msv","rhs_bmp2e_msv","rhs_bmp2_msv","rhs_bmp2k_msv"];
			_Unit_Pool_A = ["RHS_Mi8mt_vvsc"];
		};
	case 24: // Russia (TV) (VV+VVS) (Tanks) (Helicopters) (RHS)
		{
			_Unit_Pool_S = ["rhs_rva_crew_armored","rhs_pilot_combat_heli","rhs_vdv_recon_sergeant","rhs_vdv_recon_medic","rhs_vdv_recon_arifleman","rhs_vdv_recon_arifleman_scout","rhs_vdv_recon_rifleman_lat","rhs_vdv_recon_grenadier_scout","rhs_vdv_recon_rifleman_ak103","rhs_vdv_recon_rifleman_akms","rhs_vdv_recon_rifleman_l","rhs_vdv_recon_marksman","rhs_vdv_recon_machinegunner_assistant"];
			_Unit_Pool_V = [];
			_Unit_Pool_T = ["rhs_zsu234_aa","rhs_bmp1_tv","rhs_bmp1d_tv","rhs_bmp1k_tv","rhs_bmp1p_tv","rhs_bmp2e_tv","rhs_bmp2_tv","rhs_bmp2d_tv","rhs_bmp2k_tv","rhs_brm1k_tv","rhs_prp3_tv","rhs_t14_tv","rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv","rhs_t72bd_tv","rhs_t72be_tv","rhs_t80","rhs_t80a","rhs_t80b","rhs_t80bk","rhs_t80bv","rhs_t80bvk","rhs_t80u","rhs_t80u45m","rhs_t80ue1","rhs_t80uk","rhs_t80um","rhs_t90_tv","rhs_t90a_tv","rhs_t90am_tv","rhs_t90saa_tv","rhs_t90sab_tv","rhs_t90sm_tv"];
			_Unit_Pool_A = ["RHS_Mi8mt_vv","RHS_Mi8mt_Cargo_vv","RHS_Mi8t_vv","RHS_Ka52_vvsc","rhs_ka60_c","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Mi24Vt_vvsc","rhs_mi28n_vvsc","RHS_Mi8AMT_vvsc","RHS_Mi8AMTSh_vvsc","RHS_Mi8mt_vvsc","RHS_Mi8mt_Cargo_vvsc","RHS_Mi8MTV3_vvsc","RHS_Mi8mtv3_Cargo_vvsc","RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8T_vvsc"];
		};
	case 25: // Russia (VDV) (EMR-Desert) (RHS)
		{
			_Unit_Pool_S = ["rhs_vdv_des_armoredcrew","rhs_pilot_combat_heli","rhs_vdv_des_sergeant","rhs_vdv_des_medic","rhs_vdv_des_arifleman","rhs_vdv_des_machinegunner","rhs_vdv_des_RShG2","rhs_vdv_des_LAT","rhs_vdv_des_at","rhs_vdv_des_grenadier","rhs_vdv_des_marksman","rhs_vdv_des_rifleman","rhs_vdv_des_rifleman_lite"];
			_Unit_Pool_V = ["rhs_tigr_vdv","rhs_tigr_3camo_vdv","rhs_tigr_sts_vdv","rhs_tigr_sts_3camo_vdv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","rhs_uaz_vdv","rhs_uaz_open_vdv","rhsgref_BRDM2UM_vdv","rhsgref_BRDM2_HQ_vdv","rhs_gaz66_vdv","rhs_gaz66o_vdv","rhs_gaz66_zu23_vdv","rhs_kamaz5350_vdv","rhs_kamaz5350_open_vdv","rhs_typhoon_vdv","RHS_Ural_VDV_01","RHS_Ural_Open_VDV_01","RHS_Ural_Zu23_VDV_01","rhs_zil131_vdv","rhs_zil131_open_vdv"];
			_Unit_Pool_T = ["rhsgref_BRDM2_vdv","rhsgref_BRDM2_ATGM_vdv","rhs_sprut_vdv","rhs_bmd1","rhs_bmd4_vdv","rhs_bmd4m_vdv","rhs_bmp1d_vdv","rhs_bmp1k_vdv","rhs_bmp1p_vdv","rhs_bmp2d_vdv","rhs_bmp2k_vdv","rhs_brm1k_vdv","rhs_prp3_vdv","rhs_bmd1k","rhs_bmd1p","rhs_bmd1pk","rhs_bmd1r","rhs_bmd2","rhs_bmd2k","rhs_bmd2m","rhs_bmd4ma_vdv","rhs_bmp1_vdv","rhs_bmp2e_vdv","rhs_bmp2_vdv","rhs_btr60_vdv","rhs_btr70_vdv","rhs_btr80_vdv","rhs_btr80a_vdv"];
			_Unit_Pool_A = ["RHS_Mi24P_vdv","RHS_Mi24V_vdv","RHS_Mi8AMT_vdv","RHS_Mi8mt_vdv","RHS_Mi8mt_Cargo_vdv","RHS_Mi8MTV3_vdv","RHS_Mi8mtv3_Cargo_vdv","RHS_Mi8MTV3_heavy_vdv"];
		};
	case 26: // Russia (VDV) (M-Flora) (RHS)
		{
			_Unit_Pool_S = ["rhs_vdv_mflora_armoredcrew","rhs_pilot_combat_heli","rhs_vdv_mflora_sergeant","rhs_vdv_mflora_medic","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_LAT","rhs_vdv_mflora_RShG2","rhs_vdv_mflora_at","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_marksman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_machinegunner_assistant","rhs_vdv_mflora_strelok_rpg_assist"];
			_Unit_Pool_V = ["rhs_tigr_vdv","rhs_tigr_3camo_vdv","rhs_tigr_sts_vdv","rhs_tigr_sts_3camo_vdv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","rhs_uaz_vdv","rhs_uaz_open_vdv","rhsgref_BRDM2UM_vdv","rhsgref_BRDM2_HQ_vdv","rhs_gaz66_vdv","rhs_gaz66o_vdv","rhs_gaz66_zu23_vdv","rhs_kamaz5350_vdv","rhs_kamaz5350_open_vdv","rhs_typhoon_vdv","RHS_Ural_VDV_01","RHS_Ural_Open_VDV_01","RHS_Ural_Zu23_VDV_01","rhs_zil131_vdv","rhs_zil131_open_vdv"];
			_Unit_Pool_T = ["rhsgref_BRDM2_vdv","rhsgref_BRDM2_ATGM_vdv","rhs_sprut_vdv","rhs_bmd1","rhs_bmd4_vdv","rhs_bmd4m_vdv","rhs_bmp1d_vdv","rhs_bmp1k_vdv","rhs_bmp1p_vdv","rhs_bmp2d_vdv","rhs_bmp2k_vdv","rhs_brm1k_vdv","rhs_prp3_vdv","rhs_bmd1k","rhs_bmd1p","rhs_bmd1pk","rhs_bmd1r","rhs_bmd2","rhs_bmd2k","rhs_bmd2m","rhs_bmd4ma_vdv","rhs_bmp1_vdv","rhs_bmp2e_vdv","rhs_bmp2_vdv","rhs_btr60_vdv","rhs_btr70_vdv","rhs_btr80_vdv","rhs_btr80a_vdv"];
			_Unit_Pool_A = ["RHS_Mi24P_vdv","RHS_Mi24V_vdv","RHS_Mi8AMT_vdv","RHS_Mi8mt_vdv","RHS_Mi8mt_Cargo_vdv","RHS_Mi8MTV3_vdv","RHS_Mi8mtv3_Cargo_vdv","RHS_Mi8MTV3_heavy_vdv"];
		};
	case 27: // SAF - (KOV) (Airborne) (RHS)
		{
			_Unit_Pool_S = ["rhssaf_army_o_m10_para_crew","rhssaf_airforce_o_pilot_transport_heli","rhssaf_army_o_m10_para_sq_lead","rhssaf_army_o_m10_para_medic","rhssaf_army_o_m10_para_mgun_m84","rhssaf_army_o_m10_para_mgun_minimi","rhssaf_army_o_m10_para_rifleman_at","rhssaf_army_o_m10_para_spec_at","rhssaf_army_o_m10_para_gl_ag36","rhssaf_army_o_m10_para_gl_m320","rhssaf_army_o_m10_para_rifleman_m21","rhssaf_army_o_m10_para_rifleman_g36","rhssaf_army_o_m10_para_sniper_scarH"];
			_Unit_Pool_V = ["rhssaf_army_o_m1025_olive_m2","rhssaf_army_o_m1025_olive","rhssaf_army_o_m998_olive_2dr_fulltop","rhssaf_army_o_m998_olive_2dr_halftop","rhssaf_army_o_ural_open","rhssaf_army_o_ural"];
			_Unit_Pool_T = ["rhssaf_army_o_t72s"];
			_Unit_Pool_A = ["rhssaf_airforce_o_ht40","rhssaf_airforce_o_ht48"];
		};
	case 28: // SAF - (KOV) (Digital) (RHS)
		{
			_Unit_Pool_S = ["rhssaf_army_o_m10_digital_crew_armored","rhssaf_airforce_o_pilot_transport_heli","rhssaf_army_o_m10_digital_sq_lead","rhssaf_army_o_m10_digital_medic","rhssaf_army_o_m10_digital_mgun_m84","rhssaf_army_o_m10_digital_rifleman_at","rhssaf_army_o_m10_digital_spec_at","rhssaf_army_o_m10_digital_gl","rhssaf_army_o_m10_digital_sniper_m76","rhssaf_army_o_m10_digital_rifleman_m21","rhssaf_army_o_m10_digital_rifleman_m70","rhssaf_army_o_m10_digital_asst_mgun","rhssaf_army_o_m10_digital_asst_spec_at"];
			_Unit_Pool_V = ["rhssaf_army_o_m1025_olive_m2","rhssaf_army_o_m1025_olive","rhssaf_army_o_m998_olive_2dr_fulltop","rhssaf_army_o_m998_olive_2dr_halftop","rhssaf_army_o_ural_open","rhssaf_army_o_ural"];
			_Unit_Pool_T = ["rhssaf_army_o_t72s"];
			_Unit_Pool_A = ["rhssaf_airforce_o_ht40","rhssaf_airforce_o_ht48"];
		};
	case 29: // SAF - (KOV) (Oakleaf) (RHS)
		{
			_Unit_Pool_S = ["rhssaf_army_o_m93_oakleaf_summer_crew","rhssaf_airforce_o_pilot_transport_heli","rhssaf_army_o_m93_oakleaf_summer_sq_lead","rhssaf_army_o_m93_oakleaf_summer_medic","rhssaf_army_o_m93_oakleaf_summer_mgun_m84","rhssaf_army_o_m93_oakleaf_summer_rifleman_at","rhssaf_army_o_m93_oakleaf_summer_spec_at","rhssaf_army_o_m93_oakleaf_summer_gl","rhssaf_army_o_m93_oakleaf_summer_sniper_m76","rhssaf_army_o_m93_oakleaf_summer_rifleman_m21","rhssaf_army_o_m93_oakleaf_summer_rifleman_m70","rhssaf_army_o_m93_oakleaf_summer_spotter","rhssaf_army_o_m93_oakleaf_summer_asst_spec_at"];
			_Unit_Pool_V = ["rhssaf_army_o_m1025_olive_m2","rhssaf_army_o_m1025_olive","rhssaf_army_o_m998_olive_2dr_fulltop","rhssaf_army_o_m998_olive_2dr_halftop","rhssaf_army_o_ural_open","rhssaf_army_o_ural"];
			_Unit_Pool_T = ["rhssaf_army_o_t72s"];
			_Unit_Pool_A = ["rhssaf_airforce_o_ht40","rhssaf_airforce_o_ht48"];
		};
	case 30: // Sahrani Liberation Army (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_SLA_Infantry_Crewman","LOP_SLA_Infantry_Pilot","LOP_SLA_Infantry_SL","LOP_SLA_Infantry_Corpsman","LOP_SLA_Infantry_MG","LOP_SLA_Infantry_AT","LOP_SLA_Infantry_GL","LOP_SLA_Infantry_Marksman","LOP_SLA_Infantry_Rifleman","LOP_SLA_Infantry_Rifleman_2","LOP_SLA_Infantry_MG_Asst","LOP_SLA_Infantry_AT_Asst","LOP_SLA_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_SLA_UAZ","LOP_SLA_UAZ_AGS","LOP_SLA_UAZ_DshKM","LOP_SLA_UAZ_Open","LOP_SLA_UAZ_SPG","LOP_SLA_Ural","LOP_SLA_Ural_open"];
			_Unit_Pool_T = ["LOP_SLA_ZSU234","LOP_SLA_BTR60","LOP_SLA_BMP1D","LOP_SLA_T72BA","LOP_SLA_BTR70","LOP_SLA_BMP2","LOP_SLA_BMP1","LOP_SLA_BMP2D","LOP_SLA_T72BB"];
			_Unit_Pool_A = ["LOP_SLA_Mi8MT_Cargo","LOP_SLA_Mi8MTV3_FAB","LOP_SLA_Mi8MTV3_UPK23"];
		};
	case 31: // Spetsnaz - VANILLA  (Contact DLC)
		{
			_Unit_Pool_S = ["O_R_Soldier_LAT_F","O_R_Soldier_LAT_F","O_R_Soldier_TL_F","O_R_medic_F","O_R_Soldier_AR_F","O_R_Soldier_LAT_F","O_R_Soldier_GL_F","O_R_soldier_M_F","O_R_soldier_exp_F","O_R_JTAC_F","O_R_JTAC_F","O_R_JTAC_F","O_R_JTAC_F"];
			_Unit_Pool_V = [];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
	case 32: // Syrian Armed Forces (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_SYR_Infantry_Crewman","LOP_SYR_Infantry_Pilot","LOP_SYR_Infantry_SL","LOP_SYR_Infantry_Corpsman","LOP_SYR_Infantry_MG","LOP_SYR_Infantry_AT","LOP_SYR_Infantry_Grenadier","LOP_SYR_Infantry_Marksman","LOP_SYR_Infantry_Rifleman","LOP_SYR_Infantry_Rifleman_2","LOP_SYR_Infantry_MG_Asst","LOP_SYR_Infantry_Rifleman_2","LOP_SYR_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_SYR_UAZ","LOP_SYR_UAZ_AGS","LOP_SYR_UAZ_DshKM","LOP_SYR_UAZ_Open","LOP_SYR_UAZ_SPG","LOP_SYR_KAMAZ_Covered","LOP_SYR_KAMAZ_Transport","LOP_SYR_Ural","LOP_SYR_Ural_open"];
			_Unit_Pool_T = ["LOP_SYR_ZSU234","LOP_SYR_BTR60","LOP_SYR_BTR70","LOP_SYR_BTR80","LOP_SYR_BMP1","LOP_SYR_BMP2","LOP_SYR_T55","LOP_SYR_T72BA","LOP_SYR_T72BB"];
			_Unit_Pool_A = [];
		};
	case 33: // Takistani Armed Forces (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_TKA_Infantry_Crewman","LOP_TKA_Infantry_Pilot","LOP_TKA_Infantry_SL","LOP_TKA_Infantry_Corpsman","LOP_TKA_Infantry_MG","LOP_TKA_Infantry_AT","LOP_TKA_Infantry_Rifleman_3","LOP_TKA_Infantry_GL","LOP_TKA_Infantry_Marksman","LOP_TKA_Infantry_Rifleman","LOP_TKA_Infantry_Rifleman_2","LOP_TKA_Infantry_MG_Asst","LOP_TKA_Infantry_AT_Asst"];
			_Unit_Pool_V = ["LOP_TKA_UAZ","LOP_TKA_UAZ_AGS","LOP_TKA_UAZ_DshKM","LOP_TKA_UAZ_Open","LOP_TKA_UAZ_SPG","LOP_TKA_Ural","LOP_TKA_Ural_open"];
			_Unit_Pool_T = ["LOP_TKA_ZSU234","LOP_TKA_BTR70","LOP_TKA_BMP1D","LOP_TKA_BMP2","LOP_TKA_BMP2D","LOP_TKA_T34","LOP_TKA_T55","LOP_TKA_T72BA","LOP_TKA_T72BB","LOP_TKA_BTR60","LOP_TKA_BMP1"];
			_Unit_Pool_A = ["LOP_TKA_Mi24V_AT","LOP_TKA_Mi24V_FAB","LOP_TKA_Mi24V_UPK23","LOP_TKA_Mi8MT_Cargo","LOP_TKA_Mi8MTV3_FAB","LOP_TKA_Mi8MTV3_UPK23"];
		};
	case 34: // Tanoan Liberation Army (RHS GREF)
		{
			_Unit_Pool_S = ["rhsgref_tla_crew","rhsgref_tla_crew","rhsgref_tla_squadleader","rhsgref_tla_medic","rhsgref_tla_machinegunner_mg42","rhsgref_tla_machinegunner","rhsgref_tla_specialist_at","rhsgref_tla_rifleman_rpg75","rhsgref_tla_grenadier_m79","rhsgref_tla_rifleman_l1a1","rhsgref_tla_rifleman_m1","rhsgref_tla_rifleman_M16","rhsgref_tla_rifleman_pm63"];
			_Unit_Pool_V = ["rhsgref_tla_offroad","rhsgref_tla_offroad_at","rhsgref_tla_offroad_armed"];
			_Unit_Pool_T = ["rhsgref_tla_btr60"];
			_Unit_Pool_A = [];
		};
	case 35: // United Armed Forces of Novorossiya (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_US_Infantry_Crewman","LOP_US_Infantry_TL","LOP_US_Infantry_Corpsman","LOP_US_Infantry_MG_3","LOP_US_Infantry_MG","LOP_US_Infantry_MG_2","LOP_US_Infantry_AT","LOP_US_Infantry_Rifleman_4","LOP_US_Infantry_GL","LOP_US_Infantry_GL_2","LOP_US_Infantry_Marksman","LOP_US_Infantry_Rifleman_3"];
			_Unit_Pool_V = ["LOP_US_UAZ","LOP_US_UAZ_AGS","LOP_US_UAZ_DshKM","LOP_US_UAZ_Open","LOP_US_UAZ_SPG","LOP_US_Ural","LOP_US_Ural_open"];
			_Unit_Pool_T = ["LOP_US_ZSU234","LOP_US_BTR70","LOP_US_T72BC","LOP_US_BTR60","LOP_US_T72BA","LOP_US_BMP1","LOP_US_BMP1D","LOP_US_BMP2","LOP_US_BMP2D","LOP_US_T72BB"];
			_Unit_Pool_A = [];
		};
	case 36: // V.C (2nd Bat) (UNSUNG)
		{
			_Unit_Pool_S = ["uns_men_VC_mainforce_68_SAP","uns_men_VC_mainforce_68_AS1","uns_men_VC_mainforce_68_nco","uns_men_VC_mainforce_68_MED","uns_men_VC_mainforce_68_MGS","uns_men_VC_mainforce_68_HMG","uns_men_VC_mainforce_68_LMG","uns_men_VC_mainforce_68_AT2","uns_men_VC_mainforce_68_RF1","uns_men_VC_mainforce_68_RF4","uns_men_VC_mainforce_68_RF2","uns_men_VC_mainforce_68_MRK","uns_men_VC_mainforce_68_AS1"];
			_Unit_Pool_V = ["uns_BTR152_DSHK","uns_Type55","uns_Type55_M40","uns_zil157","uns_BTR152_ZPU","uns_nvatruck_type65","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_MG","uns_Type55_patrol","uns_Type55_LMG","uns_Type55_twinMG","uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_mg","uns_nvatruck_open","uns_Type55_ZU","uns_nvatruck_s60","uns_nvatruck_zpu","uns_nvatruck_zu23","uns_Type55_mortar"];
			_Unit_Pool_T = ["uns_t34_76_vc"];
			_Unit_Pool_A = [];
		};
	case 37: // V.C (40th Bat) (UNSUNG)
		{
			_Unit_Pool_S = ["uns_men_VC_mainforce_SAP","uns_men_VC_mainforce_RTO","uns_men_VC_mainforce_nco","uns_men_VC_mainforce_MED","uns_men_VC_mainforce_LMG","uns_men_VC_mainforce_HMG","uns_men_VC_mainforce_AT2","uns_men_VC_mainforce_Rmg","uns_men_VC_mainforce_Ra2","uns_men_VC_mainforce_RF3","uns_men_VC_mainforce_RF2","uns_men_VC_mainforce_MRK","uns_men_VC_mainforce_AS1"];
			_Unit_Pool_V = ["uns_BTR152_DSHK","uns_Type55","uns_Type55_M40","uns_zil157","uns_BTR152_ZPU","uns_nvatruck_type65","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_MG","uns_Type55_patrol","uns_Type55_LMG","uns_Type55_twinMG","uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_mg","uns_nvatruck_open","uns_Type55_ZU","uns_nvatruck_s60","uns_nvatruck_zpu","uns_nvatruck_zu23","uns_Type55_mortar"];
			_Unit_Pool_T = ["uns_t34_76_vc"];
			_Unit_Pool_A = [];
		};
	case 38: // V.C (4th Bat) (UNSUNG)
		{
			_Unit_Pool_S = ["uns_men_VC_recon_SAP","uns_men_VC_recon_RF2","uns_men_VC_recon_nco","uns_men_VC_recon_MED","uns_men_VC_recon_LMG","uns_men_VC_recon_HMG","uns_men_VC_recon_AT","uns_men_VC_recon_RF6","uns_men_VC_recon_RF5","uns_men_VC_recon_RF7","uns_men_VC_recon_RF3","uns_men_VC_recon_SAP2","uns_men_VC_recon_MRK"];
			_Unit_Pool_V = ["uns_BTR152_DSHK","uns_Type55","uns_Type55_M40","uns_zil157","uns_BTR152_ZPU","uns_nvatruck_type65","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_MG","uns_Type55_patrol","uns_Type55_LMG","uns_Type55_twinMG","uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_mg","uns_nvatruck_open","uns_Type55_ZU","uns_nvatruck_s60","uns_nvatruck_zpu","uns_nvatruck_zu23","uns_Type55_mortar"];
			_Unit_Pool_T = ["uns_t34_76_vc"];
			_Unit_Pool_A = [];
		};
	case 39: // V.C (8th Bat) (UNSUNG)
		{
			_Unit_Pool_S = ["uns_men_VC_regional_SAP","uns_men_VC_regional_RF3","uns_men_VC_regional_nco","uns_men_VC_regional_Rmed","uns_men_VC_regional_MGS","uns_men_VC_regional_HMG","uns_men_VC_regional_LMG","uns_men_VC_regional_AT","uns_men_VC_regional_RF1","uns_men_VC_regional_RF7","uns_men_VC_regional_RF3","uns_men_VC_regional_RF5","uns_men_VC_regional_MRK2"];
			_Unit_Pool_V = ["uns_BTR152_DSHK","uns_Type55","uns_Type55_M40","uns_zil157","uns_BTR152_ZPU","uns_nvatruck_type65","uns_Type55_RR57","uns_Type55_RR73","uns_Type55_MG","uns_Type55_patrol","uns_Type55_LMG","uns_Type55_twinMG","uns_nvatruck","uns_nvatruck_camo","uns_nvatruck_mg","uns_nvatruck_open","uns_Type55_ZU","uns_nvatruck_s60","uns_nvatruck_zpu","uns_nvatruck_zu23","uns_Type55_mortar"];
			_Unit_Pool_T = ["uns_t34_76_vc"];
			_Unit_Pool_A = [];
		};
//-----------------------------------------------------------------
// START BLUFOR FACTIONS
/**
100: //NATO - VANILLA
101: //NATO PACIFIC - VANILLA (APEX)
102: //NATO WOODLAND - VANILLA (CONTACT)
103: //FIA - VANILLA (BLUFOR)
104: //CTRG - (APEX)
105: //Afghan National Army - (3CB)
106: //Cold War US - Early - (3CB)
107: //Cold War US - Late - (3CB)
108: // Takistan National Army - (3CB)
109: // Takistan Pro Government Militia - (3CB)
110: // British Armed Forces - Arctic (3CB)
111: // British Armed Forces - Desert (3CB)
112: // British Armed Forces - MTP (3CB)
113: // British Armed Forces - Temperate (3CB)
114: // British Armed Forces - Tropical (3CB)
115: // British Armed Forces - Woodland (3CB)
116: // Chernarus Defense Force (RHS GREF)
117: // Hellenic Armed Foces - (LOPFOR)
118: // Horizon Islands Defence Force - (RHS)
119: // Iraqi Armed Forces - (LOPFOR)
120: // Kurdish Peshmerga Forces - (LOPFOR)
121: // USA Army - Desert (RHS)
122: // USA Army - Woodland (RHS)
123: // USMC - Desert (RHS)
124: // USMC - Woodland (RHS)

*/
	case 100: //NATO - VANILLA
		{
			_Unit_Pool_S = ["B_Soldier_F","B_Helipilot_F","B_Soldier_SL_F","B_medic_F","B_soldier_AR_F","B_soldier_LAT_F","B_Soldier_GL_F","B_Soldier_M_F","B_Soldier_F","B_Soldier_F","B_Soldier_F","B_Soldier_F","B_Soldier_F"];
			_Unit_Pool_V = ["B_MRAP_01_F","B_MRAP_01_hmg_F","B_Truck_01_transport_F","B_Truck_01_covered_F"];
			_Unit_Pool_T = ["B_MBT_01_TUSK_F","B_MBT_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","B_MBT_01_mlrs_F"];
			_Unit_Pool_A = ["B_Heli_Transport_01_F","B_Heli_Attack_01_F","B_Heli_Light_01_F","B_Heli_Light_01_F"];
		};
	case 101: //NATO PACIFIC - VANILLA (APEX)
		{
			_Unit_Pool_S = ["B_T_Crew_F","B_T_Helipilot_F","B_T_Soldier_TL_F","B_T_Medic_F","B_T_Soldier_AR_F","B_T_Soldier_LAT2_F","B_T_soldier_M_F","B_T_Soldier_F","B_T_Soldier_GL_F","B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F","B_T_Soldier_F"];
			_Unit_Pool_V = ["B_T_MRAP_01_F","B_T_MRAP_01_hmg_F","B_T_MRAP_01_gmg_F","B_T_LSV_01_unarmed_F","B_T_LSV_01_AT_F","B_T_LSV_01_armed_F","B_T_Truck_01_transport_F","B_T_Truck_01_covered_F"];
			_Unit_Pool_T = ["B_T_APC_Wheeled_01_cannon_F","B_T_APC_Tracked_01_rcws_F","B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F","B_T_APC_Tracked_01_AA_F","B_T_MBT_01_TUSK_F","B_T_MBT_01_cannon_F"];
			_Unit_Pool_A = ["B_Heli_Transport_01_F","B_Heli_Attack_01_F","B_Heli_Light_01_F","B_Heli_Light_01_F"];
		};
	case 102: //NATO WOODLAND - VANILLA (CONTACT)
		{
			_Unit_Pool_S = ["B_W_Crew_F","B_W_Helipilot_F","B_W_Soldier_TL_F","B_W_Medic_F","B_W_Soldier_AR_F","B_W_Soldier_LAT2_F","B_W_soldier_M_F","B_W_Soldier_GL_F","B_W_Soldier_F","B_W_Soldier_F","B_W_Soldier_F","B_W_Soldier_F","B_W_Soldier_F"];
			_Unit_Pool_V = ["B_T_MRAP_01_F","B_T_MRAP_01_hmg_F","B_T_MRAP_01_gmg_F","B_T_LSV_01_unarmed_F","B_T_LSV_01_AT_F","B_T_LSV_01_armed_F","B_T_Truck_01_transport_F","B_T_Truck_01_covered_F"];
			_Unit_Pool_T = ["B_T_APC_Wheeled_01_cannon_F","B_T_APC_Tracked_01_rcws_F","B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F","B_T_APC_Tracked_01_AA_F","B_T_MBT_01_TUSK_F","B_T_MBT_01_cannon_F"];
			_Unit_Pool_A = ["B_Heli_Transport_01_F","B_Heli_Attack_01_F","B_Heli_Light_01_F","B_Heli_Light_01_F"];
		};
	case 103: //FIA - VANILLA (BLUFOR)
		{
			_Unit_Pool_S = ["B_G_Soldier_lite_F","B_G_medic_F","B_G_Soldier_TL_F","B_G_medic_F","B_G_Soldier_AR_F","B_G_Soldier_LAT2_F","B_G_Soldier_M_F","B_G_Soldier_GL_F","B_G_Soldier_F","B_G_Soldier_lite_F","B_G_Soldier_F","B_G_Soldier_lite_F","B_G_Soldier_F"];
			_Unit_Pool_V = ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_AT_F","B_G_Van_01_transport_F","B_G_Van_02_transport_F","B_G_Offroad_01_repair_F"];
			_Unit_Pool_T = ["B_G_Offroad_01_armed_F","B_G_Offroad_01_AT_F"];
			_Unit_Pool_A = [];
		};
	case 104: //CTRG - (APEX)
		{
			_Unit_Pool_S = ["B_CTRG_Soldier_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_LAT2_tna_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_tna_F","B_CTRG_Soldier_tna_F"];
			_Unit_Pool_V = ["B_T_MRAP_01_F","B_T_MRAP_01_hmg_F","B_T_MRAP_01_gmg_F","B_T_LSV_01_unarmed_F","B_T_LSV_01_AT_F","B_T_LSV_01_armed_F","B_T_Truck_01_transport_F","B_T_Truck_01_covered_F"];
			_Unit_Pool_T = ["B_T_APC_Wheeled_01_cannon_F","B_T_APC_Tracked_01_rcws_F","B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F","B_T_APC_Tracked_01_AA_F","B_T_MBT_01_TUSK_F","B_T_MBT_01_cannon_F"];
			_Unit_Pool_A = ["B_Heli_Transport_01_F","B_Heli_Attack_01_F","B_Heli_Light_01_F","B_Heli_Light_01_F"];
		};
	case 105: //Afghan National Army - (3CB)
		{
			_Unit_Pool_S = ["UK3CB_ANA_B_CREW","UK3CB_ANA_B_HELI_PILOT","UK3CB_ANA_B_TL","UK3CB_ANA_B_MD","UK3CB_ANA_B_AR","UK3CB_ANA_B_LAT","UK3CB_ANA_B_MK","UK3CB_ANA_B_GL","UK3CB_ANA_B_RIF_1","UK3CB_ANA_B_RIF_1","UK3CB_ANA_B_RIF_1","UK3CB_ANA_B_RIF_1","UK3CB_ANA_B_RIF_1"];
			_Unit_Pool_V = ["UK3CB_ANA_B_M1025","UK3CB_ANA_B_M998_4DR","UK3CB_ANA_B_Ural","UK3CB_ANA_B_Ural_Open","UK3CB_ANA_B_M1025_M2","UK3CB_ANA_B_M1025_MK19","UK3CB_ANA_B_M1117"];
			_Unit_Pool_T = ["UK3CB_ANA_B_BMP1","UK3CB_ANA_B_BMP2","UK3CB_ANA_B_BMP2K","UK3CB_ANA_B_M113_M2","UK3CB_ANA_B_M113_M240","UK3CB_ANA_B_M113_MK19","UK3CB_ANA_B_T55","UK3CB_ANA_B_T72A","UK3CB_ANA_B_T72BM","UK3CB_ANA_B_T72B"];
			_Unit_Pool_A = ["UK3CB_ANA_B_AH9","UK3CB_ANA_B_Unarmed_MH9","UK3CB_ANA_B_Mi_24P","UK3CB_ANA_B_UH1H_M240","UK3CB_ANA_B_B_UH60M","UK3CB_ANA_B_Mi_24V"];
		};
	case 106: //Cold War US - Early - (3CB)
		{
			_Unit_Pool_S = ["UK3CB_CW_US_B_EARLY_CREW","UK3CB_CW_US_B_EARLY_HELI_PILOT","UK3CB_CW_US_B_EARLY_TL","UK3CB_CW_US_B_EARLY_MD","UK3CB_CW_US_B_EARLY_MG","UK3CB_CW_US_B_EARLY_LAT","UK3CB_CW_US_B_EARLY_MK","UK3CB_CW_US_B_EARLY_GL","UK3CB_CW_US_B_EARLY_RIF_1","UK3CB_CW_US_B_EARLY_RIF_1","UK3CB_CW_US_B_EARLY_RIF_1","UK3CB_CW_US_B_EARLY_RIF_1","UK3CB_CW_US_B_EARLY_RIF_1"];
			_Unit_Pool_V = ["UK3CB_CW_US_B_EARLY_M939_Guntruck","UK3CB_CW_US_B_EARLY_M939","UK3CB_CW_US_B_EARLY_M939_Open","UK3CB_CW_US_B_EARLY_M151_Jeep_Closed","UK3CB_CW_US_B_EARLY_M151_Jeep_HMG","UK3CB_CW_US_B_EARLY_M151_Jeep_Open","UK3CB_CW_US_B_EARLY_M151_Jeep_TOW"];
			_Unit_Pool_T = ["UK3CB_CW_US_B_EARLY_M113_M2","UK3CB_CW_US_B_EARLY_M113_M240","UK3CB_CW_US_B_EARLY_M113_MK19","UK3CB_CW_US_B_EARLY_M113_unarmed","UK3CB_CW_US_B_EARLY_M1A1"];
			_Unit_Pool_A = ["UK3CB_CW_US_B_EARLY_UH1H_M240","UK3CB_CW_US_B_EARLY_AH1Z_GS","UK3CB_CW_US_B_EARLY_AH1Z","UK3CB_CW_US_B_EARLY_UH1H_M240"];
		};
	case 107: //Cold War US - Late - (3CB)
		{
			_Unit_Pool_S = ["UK3CB_CW_US_B_LATE_CREW","UK3CB_CW_US_B_LATE_HELI_PILOT","UK3CB_CW_US_B_LATE_TL","UK3CB_CW_US_B_LATE_MD","UK3CB_CW_US_B_LATE_AR","UK3CB_CW_US_B_LATE_LAT","UK3CB_CW_US_B_LATE_MK","UK3CB_CW_US_B_LATE_GL","UK3CB_CW_US_B_LATE_RIF_1","UK3CB_CW_US_B_LATE_RIF_1","UK3CB_CW_US_B_LATE_RIF_1","UK3CB_CW_US_B_LATE_RIF_1","UK3CB_CW_US_B_LATE_RIF_1"];
			_Unit_Pool_V = ["UK3CB_CW_US_B_LATE_M1025_Unarmed","UK3CB_CW_US_B_LATE_M998_2DR","UK3CB_CW_US_B_LATE_M998_4DR","UK3CB_CW_US_B_LATE_M1025_M2","UK3CB_CW_US_B_LATE_M1025_M2","UK3CB_CW_US_B_LATE_M1025_MK19","UK3CB_CW_US_B_LATE_M1025_TOW"];
			_Unit_Pool_T = ["UK3CB_CW_US_B_LATE_M2A2","UK3CB_CW_US_B_LATE_M2A2","UK3CB_CW_US_B_LATE_M1A1"];
			_Unit_Pool_A = ["UK3CB_CW_US_B_LATE_AH64_GS","UK3CB_CW_US_B_LATE_AH1Z_GS","UK3CB_CW_US_B_LATE_UH60M","UK3CB_CW_US_B_LATE_UH60M"];
		};
	case 108: // Takistan National Army - (3CB)
		{
			_Unit_Pool_S = ["UK3CB_TKA_B_CREW","UK3CB_TKA_B_HELI_PILOT","UK3CB_TKA_B_TL","UK3CB_TKA_B_MD","UK3CB_TKA_B_AR","UK3CB_TKA_B_LAT","UK3CB_TKA_B_MK","UK3CB_TKA_B_GL","UK3CB_TKA_B_RIF_1","UK3CB_TKA_B_RIF_1","UK3CB_TKA_B_RIF_1","UK3CB_TKA_B_RIF_1","UK3CB_TKA_B_RIF_1"];
			_Unit_Pool_V = ["UK3CB_TKA_B_Ural","UK3CB_TKA_B_Ural_Open","UK3CB_TKA_B_LR_SF_M2","UK3CB_TKA_B_LR_SF_AGS30","UK3CB_TKA_B_Hilux_Closed","UK3CB_TKA_B_Hilux_Open","UK3CB_TKA_B_BRDM2_UM"];
			_Unit_Pool_T = ["UK3CB_TKA_B_BMP1","UK3CB_TKA_B_BMP2","UK3CB_TKA_B_BMP2K","UK3CB_TKA_B_BTR60","UK3CB_TKA_B_MTLB_PKT"];
			_Unit_Pool_A = ["UK3CB_TKA_B_T55","UK3CB_TKA_B_T55","UK3CB_TKA_B_T72A","UK3CB_TKA_B_T72BM","UK3CB_TKA_B_T72B"];
		};
	case 109: // Takistan Pro Government Militia - (3CB)
		{
			_Unit_Pool_S = ["UK3CB_TKM_B_ENG","UK3CB_TKM_B_ENG","UK3CB_TKM_B_TL","UK3CB_TKM_B_MD","UK3CB_TKM_B_AR","UK3CB_TKM_B_LAT","UK3CB_TKM_B_SNI","UK3CB_TKM_B_GL","UK3CB_TKM_B_RIF_1","UK3CB_TKM_B_RIF_1","UK3CB_TKM_B_RIF_2","UK3CB_TKM_B_RIF_2","UK3CB_TKM_B_RIF_2"];
			_Unit_Pool_V = ["UK3CB_TKM_B_LR_Closed","UK3CB_TKM_B_LR_Open","UK3CB_TKM_B_LR_M2","UK3CB_TKM_B_Ural_Open","UK3CB_TKM_B_Ural_Covered"];
			_Unit_Pool_T = ["UK3CB_TKM_B_Hilux_Rocket","UK3CB_TKM_B_LR_SF_AGS30","UK3CB_TKM_B_BTR60","UK3CB_TKM_B_MTLB_PKT","UK3CB_TKM_B_T55","UK3CB_TKM_B_BTR60","UK3CB_TKM_B_Ural_Zu23"];
			_Unit_Pool_A = ["UK3CB_TKA_B_UH1H_M240"];
		};
	case 110: // British Armed Forces - Arctic (3CB)
		{
			_Unit_Pool_S = ["UK3CB_BAF_Crewman_Arctic","UK3CB_BAF_HeliPilot_Army_Arctic","UK3CB_BAF_FT_Arctic","UK3CB_BAF_Medic_Arctic","UK3CB_BAF_MGLMG_Arctic","UK3CB_BAF_LAT_Arctic","UK3CB_BAF_Marksman_Arctic","UK3CB_BAF_Grenadier_Arctic","UK3CB_BAF_Rifleman_Arctic","UK3CB_BAF_Rifleman_Arctic","UK3CB_BAF_Rifleman_Arctic","UK3CB_BAF_Rifleman_Arctic","UK3CB_BAF_Rifleman_Arctic"];
			_Unit_Pool_V = ["UK3CB_BAF_Husky_Passenger_GPMG_Green_Arctic","UK3CB_BAF_Jackal2_L2A1_W_Arctic","UK3CB_BAF_Coyote_Passenger_L111A1_W_Arctic","UK3CB_BAF_MAN_HX58_Transport_Green_Arctic","UK3CB_BAF_Panther_GPMG_Green_A_Arctic"];
			_Unit_Pool_T = ["UK3CB_BAF_FV432_Mk3_GPMG_Green_DPMW","UK3CB_BAF_FV432_Mk3_RWS_Green_DPMW"];
			_Unit_Pool_A = ["UK3CB_BAF_Wildcat_HMA2_TRN_8A_Arctic","UK3CB_BAF_Wildcat_AH1_CAS_6D_Arctic","UK3CB_BAF_Merlin_HC4_32_Arctic"];
		};
	case 111: // British Armed Forces - Desert (3CB)
		{
			_Unit_Pool_S = ["UK3CB_BAF_Crewman_Arctic","UK3CB_BAF_HeliPilot_Army_Arctic","UK3CB_BAF_FT_Arctic","UK3CB_BAF_Medic_Arctic","UK3CB_BAF_MGLMG_Arctic","UK3CB_BAF_LAT_Arctic","UK3CB_BAF_Marksman_Arctic","UK3CB_BAF_Grenadier_Arctic","UK3CB_BAF_Rifleman_Arctic","UK3CB_BAF_Rifleman_Arctic","UK3CB_BAF_Rifleman_Arctic","UK3CB_BAF_Rifleman_Arctic","UK3CB_BAF_Rifleman_Arctic"];
			_Unit_Pool_V = ["UK3CB_BAF_Husky_Passenger_GPMG_Sand_DDPM","UK3CB_BAF_Jackal2_L2A1_D_DDPM","UK3CB_BAF_Coyote_Passenger_L111A1_D_DDPM","UK3CB_BAF_MAN_HX58_Transport_Sand_DDPM","UK3CB_BAF_Panther_GPMG_Sand_A_DDPM"];
			_Unit_Pool_T = ["UK3CB_BAF_FV432_Mk3_GPMG_Sand_DDPM","UK3CB_BAF_FV432_Mk3_RWS_Sand_DDPM"];
			_Unit_Pool_A = ["UK3CB_BAF_Wildcat_HMA2_TRN_8A_DDPM","UK3CB_BAF_Wildcat_AH1_CAS_6D_DDPM","UK3CB_BAF_Merlin_HC4_32_DDPM"];
		};
	case 112: // British Armed Forces - MTP (3CB)
		{
			_Unit_Pool_S = ["UK3CB_BAF_Crewman_MTP","UK3CB_BAF_HeliPilot_Army_MTP","UK3CB_BAF_FT_MTP","UK3CB_BAF_Medic_MTP","UK3CB_BAF_MGLMG_MTP","UK3CB_BAF_LAT_MTP","UK3CB_BAF_Marksman_MTP","UK3CB_BAF_Grenadier_MTP","UK3CB_BAF_Rifleman_MTP","UK3CB_BAF_Rifleman_MTP","UK3CB_BAF_Rifleman_MTP","UK3CB_BAF_Rifleman_MTP","UK3CB_BAF_Rifleman_MTP"];
			_Unit_Pool_V = ["UK3CB_BAF_Husky_Passenger_GPMG_Green_MTP","UK3CB_BAF_Jackal2_L2A1_W_MTP","UK3CB_BAF_Coyote_Passenger_L111A1_W_MTP","UK3CB_BAF_MAN_HX58_Transport_Green_MTP","UK3CB_BAF_Panther_GPMG_Green_A_DDPM"];
			_Unit_Pool_T = ["UK3CB_BAF_FV432_Mk3_GPMG_Green_MTP","UK3CB_BAF_FV432_Mk3_RWS_Green_MTP","UK3CB_BAF_Warrior_A3_W_Camo_MTP"];
			_Unit_Pool_A = ["UK3CB_BAF_Wildcat_AH1_CAS_8D_MTP","UK3CB_BAF_Apache_AH1_MTP","UK3CB_BAF_Merlin_HC3_32_MTP"];
		};
	case 113: // British Armed Forces - Temperate (3CB)
		{
			_Unit_Pool_S = ["UK3CB_BAF_Crewman_DPMT","UK3CB_BAF_HeliPilot_Army_DPMT","UK3CB_BAF_FT_DPMT","UK3CB_BAF_Medic_DPMT","UK3CB_BAF_MGLMG_DPMT","UK3CB_BAF_LAT_DPMT","UK3CB_BAF_Marksman_DPMT","UK3CB_BAF_Grenadier_DPMT","UK3CB_BAF_Rifleman_DPMT","UK3CB_BAF_Rifleman_DPMT","UK3CB_BAF_Rifleman_DPMT","UK3CB_BAF_Rifleman_DPMT","UK3CB_BAF_Rifleman_DPMT"];
			_Unit_Pool_V = ["UK3CB_BAF_Husky_Passenger_GPMG_Green_MTP","UK3CB_BAF_Jackal2_L2A1_W_MTP","UK3CB_BAF_Coyote_Passenger_L111A1_W_MTP","UK3CB_BAF_MAN_HX58_Transport_Green_MTP","UK3CB_BAF_Panther_GPMG_Green_A_DDPM"];
			_Unit_Pool_T = ["UK3CB_BAF_FV432_Mk3_GPMG_Green_MTP","UK3CB_BAF_FV432_Mk3_RWS_Green_MTP","UK3CB_BAF_Warrior_A3_W_Camo_MTP"];
			_Unit_Pool_A = ["UK3CB_BAF_Wildcat_AH1_CAS_8D_MTP","UK3CB_BAF_Apache_AH1_MTP","UK3CB_BAF_Merlin_HC3_32_MTP"];
		};
	case 114: // British Armed Forces - Tropical (3CB)
		{
			_Unit_Pool_S = ["UK3CB_BAF_Crewman_Tropical","UK3CB_BAF_HeliPilot_Army_Tropical","UK3CB_BAF_FT_Tropical","UK3CB_BAF_Medic_Tropical","UK3CB_BAF_MGLMG_Tropical","UK3CB_BAF_LAT_Tropical","UK3CB_BAF_Marksman_Tropical","UK3CB_BAF_Grenadier_Tropical","UK3CB_BAF_Rifleman_Tropical","UK3CB_BAF_Rifleman_Tropical","UK3CB_BAF_Rifleman_Tropical","UK3CB_BAF_Rifleman_Tropical","UK3CB_BAF_Rifleman_Tropical"];
			_Unit_Pool_V = ["UK3CB_BAF_Husky_Passenger_GPMG_Green_MTP","UK3CB_BAF_Jackal2_L2A1_W_MTP","UK3CB_BAF_Coyote_Passenger_L111A1_W_MTP","UK3CB_BAF_MAN_HX58_Transport_Green_MTP","UK3CB_BAF_Panther_GPMG_Green_A_DDPM"];
			_Unit_Pool_T = ["UK3CB_BAF_FV432_Mk3_GPMG_Green_MTP","UK3CB_BAF_FV432_Mk3_RWS_Green_MTP","UK3CB_BAF_Warrior_A3_W_Camo_MTP"];
			_Unit_Pool_A = ["UK3CB_BAF_Wildcat_AH1_CAS_8D_MTP","UK3CB_BAF_Apache_AH1_MTP","UK3CB_BAF_Merlin_HC3_32_MTP"];
		};
	case 115: // British Armed Forces - Woodland (3CB)
		{
			_Unit_Pool_S = ["UK3CB_BAF_Crewman_DPMW","UK3CB_BAF_HeliPilot_Army_DPMW","UK3CB_BAF_FT_DPMW","UK3CB_BAF_Medic_DPMW","UK3CB_BAF_MGLMG_DPMW","UK3CB_BAF_LAT_DPMW","UK3CB_BAF_Marksman_DPMW","UK3CB_BAF_Grenadier_DPMW","UK3CB_BAF_Rifleman_DPMW","UK3CB_BAF_Rifleman_DPMW","UK3CB_BAF_Rifleman_DPMW","UK3CB_BAF_Rifleman_DPMW","UK3CB_BAF_Rifleman_DPMW"];
			_Unit_Pool_V = ["UK3CB_BAF_Husky_Passenger_GPMG_Green_MTP","UK3CB_BAF_Jackal2_L2A1_W_MTP","UK3CB_BAF_Coyote_Passenger_L111A1_W_MTP","UK3CB_BAF_MAN_HX58_Transport_Green_MTP","UK3CB_BAF_Panther_GPMG_Green_A_DDPM"];
			_Unit_Pool_T = ["UK3CB_BAF_FV432_Mk3_GPMG_Green_MTP","UK3CB_BAF_FV432_Mk3_RWS_Green_MTP","UK3CB_BAF_Warrior_A3_W_Camo_MTP"];
			_Unit_Pool_A = ["UK3CB_BAF_Wildcat_AH1_CAS_8D_MTP","UK3CB_BAF_Apache_AH1_MTP","UK3CB_BAF_Merlin_HC3_32_MTP"];
		};
	case 116: // Chernarus Defense Force (RHS GREF)
		{
			_Unit_Pool_S = ["rhsgref_cdf_b_reg_crew","rhsgref_cdf_b_reg_general","rhsgref_cdf_b_reg_squadleader","rhsgref_cdf_b_reg_medic","rhsgref_cdf_b_reg_machinegunner","rhsgref_cdf_b_reg_rifleman_rpg75","rhsgref_cdf_b_reg_marksman","rhsgref_cdf_b_reg_grenadier","rhsgref_cdf_b_reg_rifleman_aks74","rhsgref_cdf_b_reg_rifleman_aks74","rhsgref_cdf_b_reg_rifleman_aks74","rhsgref_cdf_b_reg_rifleman_aks74","rhsgref_cdf_b_reg_rifleman_aks74"];
			_Unit_Pool_V = ["rhsgref_cdf_b_reg_uaz","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_cdf_b_reg_uaz_open","rhsgref_cdf_b_reg_uaz_spg9","rhsgref_cdf_b_reg_uaz","rhsgref_cdf_b_btr60","rhsgref_cdf_b_btr70"];
			_Unit_Pool_T = ["rhsgref_cdf_b_bmp2d","rhsgref_cdf_b_bmp2k","rhsgref_cdf_b_bmp2","rhsgref_cdf_b_t72bb_tv","rhsgref_cdf_b_t80bv_tv","rhsgref_BRDM2UM_b","rhsgref_BRDM2_HQ_b"];
			_Unit_Pool_A = ["rhsgref_cdf_b_Mi35w"];
		};
	case 117: // Hellenic Armed Foces - (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_GRE_Infantry_Crewman","LOP_GRE_Infantry_Pilot","LOP_GRE_Infantry_TL","LOP_GRE_Infantry_Corpsman","LOP_GRE_Infantry_MG","LOP_GRE_Infantry_AT","LOP_GRE_Infantry_Engineer","LOP_GRE_Infantry_Rifleman_2","LOP_GRE_Infantry_Rifleman","LOP_GRE_Infantry_Rifleman","LOP_GRE_Infantry_Rifleman","LOP_GRE_Infantry_Rifleman","LOP_GRE_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_GRE_M1025_D","LOP_GRE_M998_D_4DR"];
			_Unit_Pool_T = ["LOP_GRE_M1025_W_M2","LOP_GRE_M1025_W_Mk19"];
			_Unit_Pool_A = ["LOP_IA_UH1Y_UN"];
		};
	case 118: // Horizon Islands Defence Force - (RHS)
		{
			_Unit_Pool_S = ["rhsgref_hidf_crewman","rhsgref_hidf_helipilot","rhsgref_hidf_teamleader","rhsgref_hidf_medic","rhsgref_hidf_autorifleman","rhsgref_hidf_rifleman_m72","rhsgref_hidf_marksman","rhsgref_hidf_grenadier","rhsgref_hidf_rifleman","rhsgref_hidf_rifleman","rhsgref_hidf_rifleman","rhsgref_hidf_rifleman","rhsgref_hidf_rifleman"];
			_Unit_Pool_V = ["rhsgref_hidf_M998_2dr","rhsgref_hidf_M998_2dr_halftop","rhsgref_hidf_M998_4dr_fulltop","rhsgref_hidf_M998_4dr_halftop","rhsgref_hidf_m998_4dr","rhsgref_hidf_m1025_m2","rhsgref_hidf_m1025_mk19"];
			_Unit_Pool_T = ["rhsgref_hidf_m113a3_m2","rhsgref_hidf_m113a3_mk19"];
			_Unit_Pool_A = ["rhs_uh1h_hidf_gunship","rhs_uh1h_hidf"];
		};
	case 119: // Iraqi Armed Forces - (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_IA_Infantry_Crewman","LOP_IA_Infantry_Pilot","LOP_IA_Infantry_SL","LOP_IA_Infantry_Corpsman","LOP_IA_Infantry_MG","LOP_IA_Infantry_Rifleman_2","LOP_IA_Infantry_Marksman","LOP_IA_Infantry_GL","LOP_IA_Infantry_Rifleman","LOP_IA_Infantry_Rifleman","LOP_IA_Infantry_Rifleman","LOP_IA_Infantry_Rifleman","LOP_IA_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_IA_M998_D_4DR","LOP_IA_M1025_D","LOP_IA_M1025_D","LOP_IA_M1025_D","LOP_IA_M1025_W_M2","LOP_IA_M1025_W_Mk19"];
			_Unit_Pool_T = ["LOP_IA_BTR80","LOP_IA_BMP2","LOP_IA_BMP1","LOP_IA_T72BB"];
			_Unit_Pool_A = ["LOP_IA_Mi24V_UPK23","LOP_IA_Mi24V_FAB","LOP_IA_Mi8MTV3_FAB"];
		};
	case 120: // Kurdish Peshmerga Forces - (LOPFOR)
		{
			_Unit_Pool_S = ["LOP_PESH_Infantry_Engineer","LOP_PESH_Infantry_Engineer","LOP_PESH_Infantry_TL","LOP_Pesh_Infantry_Corpsman","LOP_PESH_Infantry_MG","LOP_PESH_Infantry_Rifleman_2","LOP_PESH_Infantry_Marksman","LOP_PESH_Infantry_GL","LOP_PESH_Infantry_Rifleman","LOP_PESH_Infantry_Rifleman","LOP_PESH_Infantry_Rifleman_4","LOP_PESH_Infantry_Rifleman_4","LOP_PESH_Infantry_Rifleman_4"];
			_Unit_Pool_V = ["LOP_PESH_M1025_D","LOP_PESH_M998_D_4DR","LOP_PESH_Offroad_M2","LOP_PESH_Offroad_AT","LOP_PESH_HEMTT_Transport_D"];
			_Unit_Pool_T = ["LOP_PESH_M1025_W_M2","LOP_PESH_M1025_W_Mk19"];
			_Unit_Pool_A = ["LOP_AA_Mi24V_AT","LOP_AA_Mi8MTV3_UPK23"];
		};
	case 121: // USA Army - Desert (RHS)
		{
			_Unit_Pool_S = ["rhsusf_army_ocp_crewman","rhsusf_army_ocp_helipilot","rhsusf_army_ocp_teamleader","rhsusf_army_ocp_medic","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_marksman","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_rifleman_m16","rhsusf_army_ocp_rifleman_m16","rhsusf_army_ocp_rifleman_m16","rhsusf_army_ocp_rifleman_m16","rhsusf_army_ocp_rifleman_m16"];
			_Unit_Pool_V = ["rhsusf_m1025_d","rhsusf_m1043_d","rhsusf_m998_d_4dr_halftop","rhsusf_m1025_d_m2","rhsusf_m1025_d_Mk19","rhsusf_m966_d"];
			_Unit_Pool_T = ["RHS_M2A2","RHS_M2A2_BUSKI","RHS_M2A3","RHS_M2A3_BUSKI","RHS_M2A3_BUSKIII","RHS_M6","rhsusf_m1a1aimd_usarmy","rhsusf_m1a2sep1tuskid_usarmy","rhsusf_m1a2sep1tuskiid_usarmy"];
			_Unit_Pool_A = ["RHS_CH_47F_10","RHS_UH60M_d","RHS_AH64D"];
		};
	case 122: // USA Army - Woodland (RHS)
		{
			_Unit_Pool_S = ["rhsusf_army_ucp_crewman","rhsusf_army_ucp_helipilot","rhsusf_army_ucp_teamleader","rhsusf_army_ucp_medic","rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_riflemanat","rhsusf_army_ucp_marksman","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_rifleman_m16","rhsusf_army_ucp_rifleman_m16","rhsusf_army_ucp_rifleman_m16","rhsusf_army_ucp_rifleman_m16","rhsusf_army_ucp_rifleman_m16"];
			_Unit_Pool_V = ["rhsusf_m1025_w","rhsusf_m1043_w","rhsusf_m998_w_4dr_halftop","rhsusf_m1025_w_m2","rhsusf_m1025_w_Mk19","rhsusf_m966_w"];
			_Unit_Pool_T = ["RHS_M2A2_wd","RHS_M2A2_BUSKI_WD","RHS_M2A3_wd","RHS_M2A3_BUSKI_wd","RHS_M2A3_BUSKIII_wd","RHS_M6_wd","rhsusf_m1a1aimwd_usarmy","rhsusf_m1a2sep1tuskiwd_usarmy","rhsusf_m1a2sep1tuskiiwd_usarmy"];
			_Unit_Pool_A = ["RHS_CH_47F_10","RHS_UH60M","RHS_AH64D_wd"];
		};
	case 123: // USMC - Desert (RHS)
		{
			_Unit_Pool_S = ["rhsusf_usmc_marpat_d_crewman","rhsusf_usmc_marpat_d_helipilot","rhsusf_usmc_marpat_d_teamleader","rhsusf_navy_marpat_d_medic","rhsusf_usmc_marpat_d_autorifleman_m249","rhsusf_usmc_marpat_d_smaw","rhsusf_usmc_marpat_d_sniper_m110","rhsusf_usmc_marpat_d_grenadier","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_rifleman_m4"];
			_Unit_Pool_V = ["rhsusf_m998_d_s_4dr","rhsusf_m998_d_s_4dr_halftop","rhsusf_m1025_d_s","rhsusf_m1025_d_s_m2","rhsusf_m1025_d_s_Mk19"];
			_Unit_Pool_T = ["rhsusf_m1240a1_mk19crows_usmc_d","rhsusf_CGRCAT1A2_Mk19_usmc_d","rhsusf_m1a1fep_d","rhsusf_m1240a1_m240_usmc_d","rhsusf_m1240a1_m240_usmc_d"];
			_Unit_Pool_A = ["rhsusf_CH53E_USMC_GAU21_D","RHS_UH1Y_d","RHS_UH1Y_d","RHS_AH1Z"];
		};
	case 124: // USMC - Woodland (RHS)
		{
			_Unit_Pool_S = ["rhsusf_usmc_marpat_wd_crewman","rhsusf_usmc_marpat_wd_helipilot","rhsusf_usmc_marpat_wd_teamleader","rhsusf_navy_marpat_wd_medic","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_smaw","rhsusf_usmc_marpat_wd_sniper_m110","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_rifleman_m4"];
			_Unit_Pool_V = ["rhsusf_m998_w_s_4dr","rhsusf_m998_w_s_4dr_halftop","rhsusf_m1025_w_s","rhsusf_m1025_w_s_m2","rhsusf_m1025_w_s_Mk19"];
			_Unit_Pool_T = ["rhsusf_m1240a1_mk19crows_usmc_wd","rhsusf_CGRCAT1A2_Mk19_usmc_wd","rhsusf_m1a1fep_wd","rhsusf_m1240a1_m240_usmc_wd","rhsusf_m1240a1_m240_usmc_wd"];
			_Unit_Pool_A = ["rhsusf_CH53E_USMC_GAU21","RHS_UH1Y","RHS_UH1Y","RHS_AH1Z_wd"];
		};
/**
case x: // Name - VANILLA/MOD (Other)
		{
			_Unit_Pool_S = [];
			_Unit_Pool_V = [];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};



 */
	
//-----------------------------------------------------------------
// START INDFOR FACTIONS
/*
Index:
200 - AAF (Vanilla)
201 - FIA (Vanilla)
202 - Syndikat - Bandits - Apex
203 - Syndikat - Paramilitary - Apex
204 - Looters - Contact
205 - LDF - Contact
206 - Chernarus National Militia (3CB)
207 - Chernarus Police Department (3CB)
208 - Chernarus Police Department - SWAT Unit (3CB)
209 - Takistan National Army (3CB)
210 - Takistan Police Department (3CB)
211 - Takistan Tribal Fighters (3CB)
212 - UN Peacekeepers (3CB)
213 - African Militia (LOP)
214 - Chernarussian National Insurgents (LOP)
215 - Iranian Armed Forces  (LOP)
216 - ISIS (LOP)
217 - Kurdish Peshmerga Forces  (LOP)
218 - Middle Eastern Militia  (LOP)
219 - Private Military Company  (LOP)
220 - Royal Armed Forces of Sahrani (LOP)
221 - Turkish Armed Forces  (LOP)
222 - Ukrainian Armed Forces  (LOP)
223 - Ulster Volunteer Force  (LOP)
224 - Ultranationalists (LOP)
225 - United Nations (LOP)
226 - CDF (RHS)
227 - CDF UN (RHS)
228 - ChDKZ (RHS)
229 - NAPA Woodland (RHS)
230 - NAPA Alpenflage (RHS)
231 - SAF Digi (RHS)
232 - SAF Oakleaf (RHS)

	case 2: 
		{
			_Unit_Pool_S = [];
			_Unit_Pool_V = [];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
*/
    case 200: // AAF - VANILLA
        {
            _Unit_Pool_S = ["I_crew_F","I_Soldier_SL_F","I_pilot_F","I_medic_F","I_Soldier_AR_F","I_Soldier_LAT2_F","I_Soldier_GL_F","I_Soldier_M_F","I_soldier_F","I_soldier_F","I_soldier_F","I_soldier_F","I_soldier_F"];
            _Unit_Pool_V = ["I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_Truck_02_transport_F","I_Truck_02_covered_F"];
            _Unit_Pool_T = ["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_LT_01_AT_F","I_LT_01_cannon_F"];
            _Unit_Pool_A = ["I_Heli_Transport_02_F","I_Heli_light_03_F","I_Heli_light_03_unarmed_F"];
        };
    case 201: // FIA - VANILLA
        {
            _Unit_Pool_S = ["I_G_engineer_F","I_G_Soldier_F","I_G_Soldier_SL_F","I_G_medic_F","I_G_Soldier_AR_F","I_G_Soldier_LAT2_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_Soldier_F","I_G_Soldier_F","I_G_Soldier_F","I_G_Soldier_F","I_G_Soldier_F"];
            _Unit_Pool_V = ["I_G_Offroad_01_","I_G_Van_01_transport_F"];
            _Unit_Pool_T = ["I_G_Offroad_01_AT_F","I_G_Offroad_01_armed_F"];
            _Unit_Pool_A = [];
        };
	case 202: // Syndikat - Bandits - APEX
        {
            _Unit_Pool_S = ["I_C_Soldier_Bandit_4_F","I_C_Pilot_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_1_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_5_F"];
            _Unit_Pool_V = ["I_C_Offroad_02_unarmed_F","I_C_Van_01_transport_F","I_C_Van_02_transport_F" ];
            _Unit_Pool_T = ["I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F"];
            _Unit_Pool_A = [];
        };
	case 203: // Syndikat - Paramilitary - APEX
        {
            _Unit_Pool_S = ["I_C_Soldier_Para_7_F","I_C_Helipilot_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_1_F","I_C_Offroad_02_unarmed_F"];
            _Unit_Pool_V = ["I_C_Van_01_transport_F","I_C_Van_02_transport_F"];
            _Unit_Pool_T = ["I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F"];
            _Unit_Pool_A = [];
        };
	case 204: // Looters - Contact
        {
            _Unit_Pool_S = ["I_L_Looter_Rifle_F","I_L_Looter_Rifle_F","I_L_Looter_Pistol_F","I_L_Looter_SG_F","I_L_Criminal_SG_F","I_L_Looter_SMG_F","I_L_Criminal_SMG_F","I_L_Hunter_F","I_L_Looter_Rifle_F","I_L_Looter_Rifle_F","I_L_Looter_Rifle_F","I_L_Looter_Rifle_F","I_L_Looter_Rifle_F"];
            _Unit_Pool_V = ["I_G_Offroad_01_","I_G_Van_01_transport_F"];
            _Unit_Pool_T = ["I_G_Offroad_01_armed_F"];
            _Unit_Pool_A = [];
        };
	case 205: // LDF - Contact
        {
            _Unit_Pool_S = ["I_E_Crew_F","I_E_Helipilot_F","I_E_Soldier_SL_F","I_E_Medic_F","I_E_Soldier_AR_F","I_E_Soldier_LAT2_F","I_E_Soldier_GL_F","I_E_soldier_M_F","I_E_Soldier_F","I_E_Soldier_F","I_E_Soldier_F","I_E_Soldier_F","I_E_Soldier_F"];
            _Unit_Pool_V = ["I_E_Offroad_01_F","I_E_Offroad_01_comms_F","I_E_Offroad_01_covered_F","I_E_Van_02_transport_F","I_E_Truck_02_transport_F","I_E_Truck_02_F"];
            _Unit_Pool_T = ["I_E_APC_tracked_03_cannon_F"];
            _Unit_Pool_A = ["I_E_Heli_light_03_F","I_E_Heli_light_03_unarmed_F"];
        };
	case 206: // Chernarus National Militia (3CB)
		{
			_Unit_Pool_S = ["UK3CB_CCM_I_ENG","UK3CB_CCM_I_RIF_1","UK3CB_CCM_I_SL","UK3CB_CCM_I_MD","UK3CB_CCM_I_AR","UK3CB_CCM_I_AT","UK3CB_CCM_I_TL","UK3CB_CCM_I_MK","UK3CB_CCM_I_RIF_1","UK3CB_CCM_I_RIF_2","UK3CB_CCM_I_RIF_BOLT","UK3CB_CCM_I_RIF_1","UK3CB_CCM_I_RIF_1"];
			_Unit_Pool_V = ["UK3CB_CCM_I_Datsun_Open","UK3CB_CCM_I_RIF_1","UK3CB_CCM_I_Hilux_Civ_Closed","UK3CB_CCM_I_RIF_1","UK3CB_CCM_I_Hilux_Civ_Open","UK3CB_CCM_I_RIF_1","UK3CB_CCM_I_Kamaz_Covered","UK3CB_CCM_I_LR_Closed","UK3CB_CCM_I_V3S_Closed","UK3CB_CCM_I_UAZ_Closed","UK3CB_CCM_I_UAZ_Open"];
			_Unit_Pool_T = ["UK3CB_CCM_I_Datsun_Pkm","UK3CB_CCM_I_Hilux_Dshkm","UK3CB_CCM_I_Hilux_Pkm","UK3CB_CCM_I_LR_M2","UK3CB_CCM_I_UAZ_Dshkm"];
			_Unit_Pool_A = [];
		};
	case 207: // Chernarus Police Department (3CB)
		{
			_Unit_Pool_S = ["UK3CB_CPD_I_ARU_ENG","UK3CB_CPD_I_PILOT","UK3CB_CPD_I_ARU_SL","UK3CB_CPD_I_ARU_MD","UK3CB_CPD_I_ARU_AR","UK3CB_CPD_I_ARU_TL","UK3CB_CPD_I_ARU_MK","UK3CB_CPD_I_ARU_RIF_1","UK3CB_CPD_I_ARU_RIF_2","UK3CB_CPD_I_ARU_RIF_1","UK3CB_CPD_I_ARU_RIF_2","UK3CB_CPD_I_ARU_RIF_1","UK3CB_CPD_I_ARU_RIF_1"];
			_Unit_Pool_V = ["UK3CB_CPD_I_TIGR_FFV","UK3CB_CPD_I_TIGR","UK3CB_CPD_I_GAZ_Vodnik","UK3CB_CPD_I_Hilux_Closed","UK3CB_CPD_I_Hilux_Open"];
			_Unit_Pool_T = ["UK3CB_CPD_I_Offroad_HMG","UK3CB_CPD_I_Hilux_Dshkm","UK3CB_CPD_I_Hilux_Pkm","UK3CB_CPD_I_Offroad_HMG"];
			_Unit_Pool_A = [];
		};
	case 208: // Chernarus Police Department - SWAT (3CB)
		{
			_Unit_Pool_S = ["UK3CB_CPD_I_OREL_ENG","UK3CB_CPD_I_PILOT","UK3CB_CPD_I_OREL_SL","UK3CB_CPD_I_OREL_MD","UK3CB_CPD_I_OREL_AR","UK3CB_CPD_I_OREL_TL","UK3CB_CPD_I_OREL_MK","UK3CB_CPD_I_OREL_RIF_1","UK3CB_CPD_I_OREL_RIF_1","UK3CB_CPD_I_OREL_RIF_1","UK3CB_CPD_I_OREL_RIF_2","UK3CB_CPD_I_OREL_RIF_2","UK3CB_CPD_I_OREL_RIF_2"];
			_Unit_Pool_V = ["UK3CB_CPD_I_TIGR_FFV","UK3CB_CPD_I_TIGR","UK3CB_CPD_I_GAZ_Vodnik"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = ["UK3CB_CPD_I_Mi8AMT"];
		};
	case 209: // Takistan National Army (3CB)
		{
			_Unit_Pool_S = ["UK3CB_TKA_I_CREW","UK3CB_TKA_I_HELI_PILOT","UK3CB_TKA_I_SL","UK3CB_TKA_I_MD","UK3CB_TKA_I_AR","UK3CB_TKA_I_LAT","UK3CB_TKA_I_GL","UK3CB_TKA_I_MK","UK3CB_TKA_I_RIF_2","UK3CB_TKA_I_RIF_2","UK3CB_TKA_I_RIF_2","UK3CB_TKA_I_RIF_1","UK3CB_TKA_I_RIF_1","UK3CB_TKA_I_BRDM2"];
			_Unit_Pool_V = ["UK3CB_TKA_I_BRDM2_HQ","UK3CB_TKA_I_BRDM2_UM","UK3CB_TKA_I_GAZ_Vodnik_KVPT","UK3CB_TKA_I_GAZ_Vodnik_PKT","UK3CB_TKA_I_Hilux_GMG","UK3CB_TKA_I_Hilux_Closed","UK3CB_TKA_I_Hilux_Open","UK3CB_TKA_I_Hilux_Pkm","UK3CB_TKA_I_BMP1"];
			_Unit_Pool_T = ["UK3CB_TKA_I_BMP2","UK3CB_TKA_I_BTR60","UK3CB_TKA_I_M113_M2","UK3CB_TKA_I_T55","UK3CB_TKA_I_T72A","UK3CB_TKA_I_UH1H"];
			_Unit_Pool_A = ["UK3CB_TKA_I_UH1H_M240","UK3CB_TKA_I_Mi8","UK3CB_TKA_I_Mi8AMTSh","UK3CB_TKA_I_Mi_24V","UK3CB_TKA_I_Mi_24P"];
		};
	case 210: // Takistan Police Department (3CB)
		{
			_Unit_Pool_S = ["UK3CB_TKP_I_ENG","UK3CB_TKP_I_RIF_2","UK3CB_TKP_I_SL","UK3CB_TKP_I_MD","UK3CB_TKP_I_AR","UK3CB_TKP_I_AT","UK3CB_TKP_I_TL","UK3CB_TKP_I_MK","UK3CB_TKP_I_RIF_1","UK3CB_TKP_I_RIF_1","UK3CB_TKP_I_RIF_1","UK3CB_TKP_I_RIF_2","UK3CB_TKP_I_RIF_2","UK3CB_TKP_I_Datsun_Pickup"];
			_Unit_Pool_V = ["UK3CB_TKP_I_Hilux_Closed","UK3CB_TKP_I_Hilux_Open","UK3CB_TKP_I_LandRover_Closed","UK3CB_TKP_I_LandRover_Open","UK3CB_TKP_I_UAZ_Closed","UK3CB_TKP_I_UAZ_Open","UK3CB_TKP_I_Datsun_Pickup_PKM"];
			_Unit_Pool_T = ["UK3CB_TKP_I_Hilux_Dshkm","UK3CB_TKP_I_Hilux_PKM","UK3CB_TKP_I_LandRover_M2"];
			_Unit_Pool_A = [];
		};
	case 211: // Takistan Tribal Fighters (3CB)
		{
			_Unit_Pool_S = ["UK3CB_TKM_I_ENG","UK3CB_TKM_I_RIF_2","UK3CB_TKM_I_SL","UK3CB_TKM_I_MD","UK3CB_TKM_I_AR","UK3CB_TKM_I_LAT","UK3CB_TKM_I_GL","UK3CB_TKM_I_MK","UK3CB_TKM_I_RIF_1","UK3CB_TKM_I_RIF_1","UK3CB_TKM_I_RIF_1","UK3CB_TKM_I_RIF_2","UK3CB_TKM_I_RIF_2"];
			_Unit_Pool_V = ["UK3CB_TKM_I_Datsun_Open","UK3CB_TKM_I_LR_Closed","UK3CB_TKM_I_V3S_Closed","UK3CB_TKM_I_UAZ_Closed","UK3CB_TKM_I_Hilux_Dshkm","UK3CB_TKM_I_LR_M2","UK3CB_TKM_I_UAZ_Dshkm","UK3CB_TKM_I_BRDM2"];
			_Unit_Pool_T = ["UK3CB_TKM_I_BRDM2_HQ","UK3CB_TKM_I_BMP1","UK3CB_TKM_I_BTR60","UK3CB_TKM_I_T55"];
			_Unit_Pool_A = [];
		};
	case 212: // UN Peacekeepers (3CB)
		{
			_Unit_Pool_S = ["UK3CB_UN_I_CREW","UK3CB_UN_I_HELI_PILOT","UK3CB_UN_I_SL","UK3CB_UN_I_MD","UK3CB_UN_I_AR","UK3CB_UN_I_LAT","UK3CB_UN_I_GL","UK3CB_UN_I_MK","UK3CB_UN_I_RIF_1","UK3CB_UN_I_RIF_1","UK3CB_UN_I_RIF_1","UK3CB_UN_I_RIF_2","UK3CB_UN_I_RIF_2"];
			_Unit_Pool_V = ["UK3CB_UN_I_M1025_Unarmed","UK3CB_UN_I_M1025_M2","UK3CB_UN_I_M1025_MK19","UK3CB_UN_I_M998_2DR","UK3CB_UN_I_Ural","UK3CB_UN_I_LR_Open","UK3CB_UN_I_Hilux_Closed","UK3CB_UN_I_Hilux_GMG","UK3CB_UN_I_Hilux_Dshkm"];
			_Unit_Pool_T = ["UK3CB_UN_I_BRDM2","UK3CB_UN_I_BMP2","UK3CB_UN_I_BTR60","UK3CB_UN_I_BTR70","UK3CB_UN_I_M113_M2","UK3CB_UN_I_M1117","UK3CB_UN_I_T55","UK3CB_UN_I_T72A"];
			_Unit_Pool_A = ["UK3CB_UN_I_UH1H","UK3CB_UN_I_UH1H_M240","UK3CB_UN_I_Mi8","UK3CB_UN_I_Mi8AMTSh","UK3CB_UN_I_Mi_24P","UK3CB_UN_I_Mi_24V"];
		};
	case 213: // African Militia (LOP)
		{
			_Unit_Pool_S = ["LOP_AFR_Driver","LOP_AFR_Driver","LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Corpsman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_AT","LOP_AFR_Infantry_GL","LOP_AFR_Infantry_Marksman","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman_7","LOP_AFR_Infantry_Rifleman_6","LOP_AFR_Infantry_Rifleman_4"];
			_Unit_Pool_V = ["LOP_AFR_Landrover","LOP_AFR_Landrover_M2","LOP_AFR_Landrover_SPG9","LOP_AFR_Nissan_PKM","LOP_AFR_Offroad","LOP_AFR_Offroad_M2","LOP_AFR_Offroad_AT"];
			_Unit_Pool_T = ["LOP_AFR_BTR60","LOP_AFR_M113_W","LOP_AFR_T55","LOP_AFR_T72BB"];
			_Unit_Pool_A = [];
		};

	case 214: // Chernarussian National Insurgents (LOP)
		{
			_Unit_Pool_S = ["LOP_NAPA_Infantry_Engineer","LOP_NAPA_Infantry_GL","LOP_NAPA_Infantry_TL","LOP_NAPA_Infantry_Corpsman","LOP_NAPA_Infantry_MG","LOP_NAPA_Infantry_AT","LOP_NAPA_Infantry_GL_2","LOP_NAPA_Infantry_Marksman","LOP_NAPA_Infantry_Rifleman","LOP_NAPA_Infantry_Rifleman","LOP_NAPA_Infantry_Rifleman","LOP_NAPA_Infantry_Rifleman_3","LOP_NAPA_Infantry_Rifleman_3"];
			_Unit_Pool_V = ["LOP_NAPA_Truck","LOP_NAPA_Landrover","LOP_NAPA_Offroad"];
			_Unit_Pool_T = ["LOP_NAPA_Landrover_M2","LOP_NAPA_Offroad_M2"];
			_Unit_Pool_A = [];
		};
	case 215: // Iranian Armed Forces (LOP)
		{
			_Unit_Pool_S = ["LOP_IRAN_Infantry_crew","LOP_IRAN_Infantry_pilot","LOP_IRAN_Infantry_sergeant","LOP_IRAN_Infantry_medic","LOP_IRAN_Infantry_AR","LOP_IRAN_Infantry_LAT","LOP_IRAN_Infantry_Grenadier","LOP_IRAN_Infantry_Marksman","LOP_IRAN_Infantry_Rifleman_2","LOP_IRAN_Infantry_Rifleman_2","LOP_IRAN_Infantry_Rifleman_2","LOP_IRAN_Infantry_Rifleman","LOP_IRAN_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_IRAN_UAZ","LOP_IRAN_UAZ_AGS","LOP_IRAN_UAZ_DshKM","LOP_IRAN_UAZ_Open","LOP_IRAN_UAZ_SPG","LOP_IRAN_Ural","LOP_IRAN_KAMAZ_Covered"];
			_Unit_Pool_T = ["LOP_IRAN_BTR70","LOP_IRAN_BTR80","LOP_IRAN_M113_C","LOP_IRAN_T72BA"];
			_Unit_Pool_A = ["LOP_IRAN_AH1Z_WD","LOP_IRAN_AH1Z_CS","LOP_IRAN_AH1Z_GS","LOP_IRAN_CH47F","LOP_IRAN_UH1Y_UN"];
		};
	case 216: // ISIS (LOP)
		{
			_Unit_Pool_S = ["LOP_ISTS_Infantry_Rifleman_8","LOP_ISTS_Infantry_Rifleman_8","LOP_ISTS_Infantry_TL","LOP_ISTS_Infantry_Corpsman","LOP_ISTS_Infantry_AR","LOP_ISTS_Infantry_Rifleman_3","LOP_ISTS_Infantry_GL","LOP_ISTS_Infantry_Marksman","LOP_ISTS_Infantry_Rifleman","LOP_ISTS_Infantry_Rifleman_5","LOP_ISTS_Infantry_Rifleman_4","LOP_ISTS_Infantry_Rifleman_9","LOP_ISTS_Infantry_Rifleman_8"];
			_Unit_Pool_V = ["LOP_ISTS_Landrover","LOP_ISTS_Landrover_M2","LOP_ISTS_Landrover_SPG9","LOP_ISTS_M1025_W_M2","LOP_ISTS_M1025_W_Mk19","LOP_ISTS_M1025_D","LOP_ISTS_Offroad","LOP_ISTS_Offroad_M2"];
			_Unit_Pool_T = ["LOP_ISTS_BTR60","LOP_ISTS_M113_W","LOP_ISTS_BMP1","LOP_ISTS_BMP2","LOP_ISTS_T55","LOP_ISTS_T72BA"];
			_Unit_Pool_A = [];
		};
	case 217: // Kurdish Peshmerga Forces (LOP)
		{
			_Unit_Pool_S = ["LOP_PESH_IND_Infantry_Engineer","LOP_PESH_IND_Infantry_Rifleman_4","LOP_PESH_IND_Infantry_TL","LOP_PESH_IND_Infantry_Corpsman","LOP_PESH_IND_Infantry_MG","LOP_PESH_IND_Infantry_Rifleman_2","LOP_PESH_IND_Infantry_GL","LOP_PESH_IND_Infantry_Marksman","LOP_PESH_IND_Infantry_Rifleman","LOP_PESH_IND_Infantry_Rifleman_3","LOP_PESH_IND_Infantry_Rifleman","LOP_PESH_IND_Infantry_Rifleman","LOP_PESH_IND_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_PESH_IND_M1025_D","LOP_PESH_IND_M998_D_4DR","LOP_PESH_IND_Offroad"];
			_Unit_Pool_T = ["LOP_PESH_IND_M1025_W_M2","LOP_PESH_IND_M1025_W_Mk19","LOP_PESH_IND_Nissan_PKM","LOP_PESH_IND_Offroad_M2","LOP_PESH_IND_Offroad_AT"];
			_Unit_Pool_A = [];
		};
	case 218: // Middle Eastern Militia (LOP)
		{
			_Unit_Pool_S = ["LOP_AM_Infantry_Rifleman_9","LOP_AM_Infantry_Rifleman_9","LOP_AM_Infantry_SL","LOP_AM_Infantry_Corpsman","LOP_AM_Infantry_AR","LOP_AM_Infantry_AT","LOP_AM_Infantry_GL","LOP_AM_Infantry_Marksman","LOP_AM_Infantry_Rifleman","LOP_AM_Infantry_Rifleman_4","LOP_AM_Infantry_Rifleman_5","LOP_AM_Infantry_Rifleman_7","LOP_AM_Infantry_Rifleman_8"];
			_Unit_Pool_V = ["LOP_AM_Landrover","LOP_AM_Landrover_M2","LOP_AM_Nissan_PKM","LOP_AM_Offroad","LOP_AM_Offroad_M2","LOP_AM_UAZ","LOP_AM_UAZ_DshKM"];
			_Unit_Pool_T = ["LOP_AM_Landrover_SPG9","LOP_AM_Offroad_AT","LOP_AM_UAZ_SPG","LOP_AM_BTR60"];
			_Unit_Pool_A = [];
		};
	case 219: // Private Military Company (LOP)
		{
			_Unit_Pool_S = ["LOP_PMC_Infantry_Crewman","LOP_PMC_Infantry_Pilot","LOP_PMC_Infantry_SL","LOP_PMC_Infantry_Corpsman","LOP_PMC_Infantry_MG","LOP_PMC_Infantry_Rifleman_2","LOP_PMC_Infantry_GL","LOP_PMC_Infantry_Marksman","LOP_PMC_Infantry_Rifleman","LOP_PMC_Infantry_Rifleman","LOP_PMC_Infantry_Rifleman","LOP_PMC_Infantry_Rifleman","LOP_PMC_Infantry_Rifleman_4"];
			_Unit_Pool_V = ["LOP_PMC_Van_Trans","LOP_PMC_M1025_W","LOP_PMC_Offroad","LOP_PMC_SUV","LOP_PMC_UAZ","LOP_PMC_Truck"];
			_Unit_Pool_T = ["LOP_PMC_Offroad_M2"];
			_Unit_Pool_A = ["LOP_PMC_AW159","LOP_PMC_MH9_armed","LOP_PMC_Mi8AMT","LOP_PMC_Mi24V_AT","LOP_PMC_Mi24V_FAB","LOP_PMC_Mi24V_UPK23"];
		};
	case 220: // Royal Armed Forces Sahrani (LOP)
		{
			_Unit_Pool_S = ["LOP_RACS_Infantry_Crewman","LOP_RACS_Infantry_Pilot","LOP_RACS_Infantry_SL","LOP_RACS_Infantry_Corpsman","LOP_RACS_Infantry_MG","LOP_RACS_Infantry_Rifleman","LOP_RACS_Infantry_GL","LOP_RACS_Infantry_Marksman","LOP_RACS_Infantry_Rifleman_2","LOP_RACS_Infantry_Rifleman_2","LOP_RACS_Infantry_Rifleman_2","LOP_RACS_Infantry_Rifleman_3","LOP_RACS_Infantry_Rifleman_3"];
			_Unit_Pool_V = ["LOP_RACS_Landrover","LOP_RACS_Landrover_M2","LOP_RACS_Offroad","LOP_RACS_Offroad_M2"];
			_Unit_Pool_T = ["LOP_RACS_M113_W","LOP_RACS_T72BA","LOP_RACS_T72BB"];
			_Unit_Pool_A = ["LOP_RACS_MH9","LOP_RACS_MH9_armed","LOP_RACS_UH60M"];
		};
	case 221: // Turkish Armed Forces (LOP)
		{
			_Unit_Pool_S = ["LOP_TRK_Infantry_Crewman","LOP_TRK_Infantry_Pilot","LOP_TRK_Infantry_SL","LOP_TRK_Infantry_Corpsman","LOP_TRK_Infantry_MG","LOP_TRK_Infantry_AT","LOP_TRK_Infantry_TL","LOP_TRK_Infantry_Marksman","LOP_TRK_Infantry_Rifleman","LOP_TRK_Infantry_Rifleman","LOP_TRK_Infantry_Rifleman_2","LOP_TRK_Infantry_Rifleman_2","LOP_TRK_Infantry_Rifleman_2"];
			_Unit_Pool_V = ["LOP_TRK_Landrover","LOP_TRK_Landrover_M2","LOP_TRK_HEMTT_Covered_D","LOP_TRK_HEMTT_Transport_D"];
			_Unit_Pool_T = ["LOP_TRK_BTR80","LOP_TRK_M113_W"];
			_Unit_Pool_A = [];
		};
	case 222: // Ukrainian Armed Forces (LOP)
		{
			_Unit_Pool_S = ["LOP_UKR_Infantry_crew","LOP_UKR_Infantry_pilot","LOP_UKR_Infantry_sergeant","LOP_UKR_Infantry_medic","LOP_UKR_Infantry_AR","LOP_UKR_Infantry_LAT","LOP_UKR_Infantry_Grenadier","LOP_UKR_Infantry_Marksman","LOP_UKR_Infantry_Rifleman","LOP_UKR_Infantry_Rifleman","LOP_UKR_Infantry_Rifleman","LOP_UKR_Infantry_Rifleman","LOP_UKR_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_UKR_UAZ","LOP_UKR_UAZ_AGS","LOP_UKR_UAZ_DshKM","LOP_UKR_UAZ_Open","LOP_UKR_UAZ_SPG"];
			_Unit_Pool_T = ["LOP_UKR_BTR70","LOP_UKR_BTR80","LOP_UKR_BMD2","LOP_UKR_BMP2D","LOP_UKR_T72BB"];
			_Unit_Pool_A = ["LOP_UKR_Mi8MT_Cargo","LOP_UKR_Mi8MTV3_FAB","LOP_UKR_Mi24V_AT","LOP_UKR_Mi24V_FAB","LOP_UKR_Mi24V_UPK23"];
		};
	case 223: // Ulster Volunteer Force (LOP)
		{
			_Unit_Pool_S = ["LOP_UVF_Infantry_Driver","LOP_UVF_Infantry_Driver","LOP_UVF_Infantry_TL","LOP_UVF_Infantry_Corpsman","LOP_UVF_Infantry_AR","LOP_UVF_Infantry_AT","LOP_UVF_Infantry_GL","LOP_UVF_Infantry_Marksman","LOP_UVF_Infantry_Rifleman","LOP_UVF_Infantry_Rifleman","LOP_UVF_Infantry_Rifleman_lite","LOP_UVF_Infantry_Rifleman_lite","LOP_UVF_Infantry_Rifleman_vz58"];
			_Unit_Pool_V = ["LOP_UVF_Landrover","LOP_UVF_Offroad","LOP_UVF_Truck"];
			_Unit_Pool_T = ["LOP_UVF_Landrover_M2","LOP_UVF_Landrover_SPG9","LOP_UVF_Nissan_PKM","LOP_UVF_Offroad_M2","LOP_UVF_Offroad_AT"];
			_Unit_Pool_A = [];
		};
	case 224: // Ultranationalists (LOP)
		{
			_Unit_Pool_S = ["LOP_UA_Infantry_Crewman","LOP_UA_Infantry_Pilot","LOP_UA_Infantry_SL","LOP_UA_Infantry_Corpsman","LOP_UA_Infantry_MG","LOP_UA_Infantry_AT","LOP_UA_Infantry_GL","LOP_UA_Infantry_Marksman","LOP_UA_Infantry_Rifleman_2","LOP_UA_Infantry_Rifleman_2","LOP_UA_Infantry_Rifleman_2","LOP_UA_Infantry_Rifleman","LOP_UA_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_UA_UAZ","LOP_UA_UAZ_AGS","LOP_UA_UAZ_DshKM","LOP_UA_UAZ_Open","LOP_UA_UAZ_SPG"];
			_Unit_Pool_T = ["LOP_UA_BMP1","LOP_UA_BMP2","LOP_UA_T72BA","LOP_UA_T72BB"];
			_Unit_Pool_A = ["LOP_UA_Mi8MT_Cargo","LOP_UA_Mi8MTV3_FAB","LOP_UA_Mi8MTV3_UPK23"];
		};
	case 225: // United Nations (LOP)
		{
			_Unit_Pool_S = ["LOP_UN_Infantry_Crewman","LOP_UN_Infantry_Pilot","LOP_UN_Infantry_SL","LOP_UN_Infantry_Corpsman","LOP_UN_Infantry_MG","LOP_UN_Infantry_Rifleman_4","LOP_UN_Infantry_GL","LOP_UN_Infantry_Marksman","LOP_UN_Infantry_Rifleman","LOP_UN_Infantry_Rifleman_2","LOP_UN_Infantry_Rifleman_3","LOP_UN_Infantry_Rifleman_3","LOP_UN_Infantry_Rifleman"];
			_Unit_Pool_V = ["LOP_UN_Offroad","LOP_UN_UAZ","LOP_UN_UAZ_AGS","LOP_UN_UAZ_DshKM","LOP_UN_UAZ_Open","LOP_UN_UAZ_SPG"];
			_Unit_Pool_T = ["LOP_UN_BTR60","LOP_UN_BTR70","LOP_UN_BMP1","LOP_UN_BMP2","LOP_UN_BMP2D"];
			_Unit_Pool_A = ["LOP_UN_Mi8MT_Cargo","LOP_UN_Mi8MTV3_FAB","LOP_UN_Mi8MTV3_UPK23","LOP_UN_Mi24V_AT","LOP_UN_Mi24V_FAB","LOP_UN_Mi24V_UPK23"];
		};
	case 226: // CDF (RHS)
		{
			_Unit_Pool_S = ["rhsgref_cdf_reg_crew","rhsgref_cdf_air_pilot","rhsgref_cdf_reg_squadleader","rhsgref_cdf_reg_medic","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_rifleman_rpg75","rhsgref_cdf_reg_grenadier","rhsgref_cdf_reg_marksman","rhsgref_cdf_reg_rifleman_akm","rhsgref_cdf_reg_rifleman_akm","rhsgref_cdf_reg_rifleman_aks74","rhsgref_cdf_reg_rifleman_aks74","rhsgref_cdf_reg_rifleman_akm"];
			_Unit_Pool_V = ["UK3CB_I_LandRover_Closed_CDF","UK3CB_I_LandRover_AGS30_CDF","UK3CB_I_LandRover_M2_CDF","UK3CB_I_LandRover_SPG9_CDF","rhsgref_cdf_reg_uaz","rhsgref_cdf_reg_uaz_ags","rhsgref_cdf_reg_uaz_dshkm","rhsgref_cdf_reg_uaz_spg9"];
			_Unit_Pool_T = ["rhsgref_cdf_btr70","rhsgref_cdf_bmd1p","rhsgref_cdf_bmd2k","rhsgref_cdf_bmp1","rhsgref_cdf_bmp2","rhsgref_BRDM2","rhsgref_BRDM2_ATGM","rhsgref_cdf_t72ba_tv","rhsgref_cdf_t80b_tv"];
			_Unit_Pool_A = ["rhsgref_cdf_reg_Mi8amt","rhsgref_cdf_reg_Mi17Sh","rhsgref_cdf_Mi24D","rhsgref_mi24g_CAS"];
		};
	case 227: // CDF UN (RHS)
		{
			_Unit_Pool_S = ["rhsgref_cdf_un_crew","rhsgref_cdf_un_pilot","rhsgref_cdf_un_squadleader","rhsgref_cdf_un_medic","rhsgref_cdf_un_machinegunner","rhsgref_cdf_un_grenadier_rpg","rhsgref_cdf_un_grenadier","rhsgref_cdf_un_rifleman","rhsgref_cdf_un_rifleman","rhsgref_cdf_un_rifleman","rhsgref_cdf_un_rifleman","rhsgref_cdf_un_rifleman","rhsgref_cdf_un_rifleman_lite"];
			_Unit_Pool_V = ["rhsgref_un_uaz","rhsgref_un_m1117"];
			_Unit_Pool_T = ["rhsgref_un_btr70","rhsgref_un_ural","rhsgref_un_zil131_flatbed_cover"];
			_Unit_Pool_A = ["rhs_uh1h_un","rhsgref_un_Mi8amt","rhsgref_un_Mi24V"];
		};
	case 228: // ChDKZ (RHS)
		{
			_Unit_Pool_S = ["rhsgref_ins_g_crew","rhsgref_ins_g_pilot","rhsgref_ins_g_squadleader","rhsgref_ins_g_medic","rhsgref_ins_g_machinegunner","rhsgref_ins_g_rifleman_RPG26","rhsgref_ins_g_grenadier","rhsgref_ins_g_sniper","rhsgref_ins_g_rifleman","rhsgref_ins_g_rifleman_akm","rhsgref_ins_g_rifleman_aks74","rhsgref_ins_g_rifleman_aksu","rhsgref_ins_g_militiaman_mosin"];
			_Unit_Pool_V = ["rhsgref_ins_g_uaz","rhsgref_ins_g_uaz_ags","rhsgref_ins_g_uaz_dshkm_chdkz","rhsgref_ins_g_uaz_open","rhsgref_ins_g_uaz_spg9","rhsgref_BRDM2UM_ins_g"];
			_Unit_Pool_T = ["rhsgref_BRDM2_ins_g","rhsgref_BRDM2_ATGM_ins_g","rhsgref_ins_g_btr70","rhsgref_ins_g_bmd1p","rhsgref_ins_g_bmp1p","rhsgref_ins_g_bmp2d","rhsgref_ins_g_t72bc"];
			_Unit_Pool_A = ["rhsgref_ins_g_Mi8amt"];
		};
	case 229: // NAPA - Woodland (RHS)
		{
			_Unit_Pool_S = ["rhsgref_nat_crew","rhsgref_nat_rifleman_vz58","rhsgref_nat_commander","rhsgref_nat_medic","rhsgref_nat_machinegunner","rhsgref_nat_grenadier_rpg","rhsgref_nat_grenadier","rhsgref_nat_hunter","rhsgref_nat_rifleman_akms","rhsgref_nat_rifleman_aks74","rhsgref_nat_rifleman_mp44","rhsgref_nat_rifleman","rhsgref_nat_rifleman_vz58"];
			_Unit_Pool_V = ["rhsgref_nat_uaz","rhsgref_nat_uaz_ags","rhsgref_nat_uaz_dshkm","rhsgref_nat_uaz_open","rhsgref_nat_uaz_spg9","rhsgref_nat_ural"];
			_Unit_Pool_T = ["rhsgref_nat_btr70"];
			_Unit_Pool_A = [];
		};
	case 230: // NAPA - Alpenflage (RHS)
		{
			_Unit_Pool_S = ["rhsgref_nat_pmil_crew","rhsgref_nat_pmil_rifleman_vz58","rhsgref_nat_pmil_commander","rhsgref_nat_pmil_medic","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_grenadier_rpg","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_rifleman_akms","rhsgref_nat_pmil_rifleman_aks74","rhsgref_nat_pmil_rifleman_mp44","rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_rifleman_vz58"];
			_Unit_Pool_V = ["rhsgref_nat_uaz","rhsgref_nat_uaz_ags","rhsgref_nat_uaz_dshkm","rhsgref_nat_uaz_open","rhsgref_nat_uaz_spg9","rhsgref_nat_ural"];
			_Unit_Pool_T = ["rhsgref_nat_btr70"];
			_Unit_Pool_A = [];
		};
	case 231: // SAF - Digi (RHS)
		{
			_Unit_Pool_S = ["rhssaf_army_m10_digital_crew_armored","rhssaf_airforce_pilot_transport_heli","rhssaf_army_m10_digital_sq_lead","rhssaf_army_m10_digital_medic","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_spec_at","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_sniper_m76","rhssaf_army_m10_digital_rifleman_m21","rhssaf_army_m10_digital_rifleman_m21","rhssaf_army_m10_digital_rifleman_m21","rhssaf_army_m10_digital_rifleman_m70","rhssaf_army_m10_digital_rifleman_m70"];
			_Unit_Pool_V = ["rhssaf_m1025_olive_m2","rhssaf_m1025_olive","rhssaf_m998_olive_2dr_fulltop","rhssaf_m998_olive_2dr_halftop","rhssaf_army_ural"];
			_Unit_Pool_T = ["rhssaf_army_pts","rhssaf_army_t72s"];
			_Unit_Pool_A = ["rhssaf_airforce_ht40","rhssaf_airforce_ht48"];
		};
	case 232: // SAF - Oakleaf (RHS)
		{
			_Unit_Pool_S = ["rhssaf_army_m93_oakleaf_summer_crew_armored","rhssaf_airforce_pilot_transport_heli","rhssaf_army_m93_oakleaf_summer_sq_lead","rhssaf_army_m93_oakleaf_summer_medic","rhssaf_army_m93_oakleaf_summer_mgun_m84","rhssaf_army_m93_oakleaf_summer_spec_at","rhssaf_army_m93_oakleaf_summer_gl","rhssaf_army_m93_oakleaf_summer_sniper_m76","rhssaf_army_m93_oakleaf_summer_rifleman_m21","rhssaf_army_m93_oakleaf_summer_rifleman_m21","rhssaf_army_m93_oakleaf_summer_rifleman_m21","rhssaf_army_m93_oakleaf_summer_rifleman_m70","rhssaf_army_m93_oakleaf_summer_rifleman_m70"];
			_Unit_Pool_V = ["rhssaf_m1025_olive_m2","rhssaf_m1025_olive","rhssaf_m998_olive_2dr_fulltop","rhssaf_m998_olive_2dr_halftop","rhssaf_army_ural"];
			_Unit_Pool_T = ["rhssaf_army_pts","rhssaf_army_t72s"];
			_Unit_Pool_A = ["rhssaf_airforce_ht40","rhssaf_airforce_ht48"];
		};
//-----------------------------------------------------------------
// START CIVILIAN FACTIONS
	case 300: //GREEK CIVS - VANILLA 
		{
			_Unit_Pool_S = ["C_Man_casual_1_F","C_Man_casual_2_F","C_Man_casual_3_F","C_Man_casual_4_F","C_Man_casual_5_F","C_Man_casual_6_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_Man_Fisherman_01_F","C_man_hunter_1_F","C_man_w_worker_F"];
			_Unit_Pool_V = ["C_Hatchback_01_F","C_Truck_02_transport_F","C_Offroad_01_F","C_Offroad_01_repair_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = ["C_Heli_Light_01_civil_F"];
		};
	case 301: //CIVS - VANILLA (African)
		{
			_Unit_Pool_S = ["C_Man_casual_1_F_afro","C_Man_casual_2_F_afro","C_Man_casual_3_F_afro","C_man_p_beggar_F_afro","C_Man_casual_4_F_afro","C_Man_casual_5_F_afro","C_Man_casual_6_F_afro","C_man_polo_1_F_afro","C_man_polo_2_F_afro","C_man_polo_3_F_afro","C_man_polo_4_F_afro","C_man_polo_5_F_afro","C_man_polo_6_F_afro"];
			_Unit_Pool_V = ["C_Hatchback_01_F","C_Truck_02_transport_F","C_Offroad_01_F","C_Offroad_01_repair_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = ["C_Heli_Light_01_civil_F"];
		};
	case 302: //CIVS - VANILLA (Asian)
		{
			_Unit_Pool_S = ["C_man_polo_1_F_asia","C_man_polo_2_F_asia","C_man_polo_3_F_asia","C_man_polo_4_F_asia","C_man_polo_5_F_asia","C_man_polo_6_F_asia","C_man_shorts_1_F_asia","C_man_p_fugitive_F_asia","C_Man_casual_3_F_asia","C_Man_casual_2_F_asia","C_Man_casual_1_F_asia","C_Man_casual_5_F_asia","C_Man_casual_4_F_asia"];
			_Unit_Pool_V = ["C_Hatchback_01_F","C_Truck_02_transport_F","C_Offroad_01_F","C_Offroad_01_repair_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = ["C_Heli_Light_01_civil_F"];
		};
	case 303: //CIVS - VANILLA (European)
		{
			_Unit_Pool_S = ["C_Man_casual_1_F_euro","C_Man_casual_2_F_euro","C_Man_casual_3_F_euro","C_Man_casual_4_F_euro","C_Man_casual_5_F_euro","C_Man_casual_6_F_euro","C_man_polo_1_F_euro","C_man_polo_2_F_euro","C_man_polo_3_F_euro","C_man_polo_4_F_euro","C_man_polo_5_F_euro","C_scientist_01_formal_F","C_scientist_02_formal_F"];
			_Unit_Pool_V = ["C_Hatchback_01_F","C_Truck_02_transport_F","C_Offroad_01_F","C_Offroad_01_repair_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = ["C_Heli_Light_01_civil_F"];
		};
	case 304: //CIVS - VANILLA (Tanoan)
		{
			_Unit_Pool_S = ["C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_3_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_6_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_4_F_tanoan"];
			_Unit_Pool_V = ["C_Hatchback_01_F","C_Truck_02_transport_F","C_Offroad_01_F","C_Offroad_01_repair_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = ["C_Heli_Light_01_civil_F"];
		};
	case 305: //CIVS - Chernarus (3CB)
		{
			_Unit_Pool_S = ["UK3CB_CHC_C_ACT","UK3CB_CHC_C_CIT","UK3CB_CHC_C_CIT","UK3CB_CHC_C_COACH","UK3CB_CHC_C_FUNC","UK3CB_CHC_C_HIKER","UK3CB_CHC_C_LABOUR","UK3CB_CHC_C_PROF","UK3CB_CHC_C_CIV","UK3CB_CHC_C_VILL","UK3CB_CHC_C_WOOD","UK3CB_CHC_C_WORKER","UK3CB_CHC_C_SPY"];
			_Unit_Pool_V = ["UK3CB_CHC_C_Ikarus","UK3CB_CHC_C_Datsun_Civ_Closed","UK3CB_CHC_C_Datsun_Civ_Open","UK3CB_CHC_C_Hatchback","UK3CB_CHC_C_Hilux_Civ_Closed","UK3CB_CHC_C_Hilux_Civ_Open","UK3CB_CHC_C_Kamaz_Covered","UK3CB_CHC_C_Kamaz_Fuel","UK3CB_CHC_C_Kamaz_Open","UK3CB_CHC_C_Kamaz_Repair","UK3CB_CHC_C_Lada","UK3CB_CHC_C_LR_Closed","UK3CB_CHC_C_LR_Open","UK3CB_CHC_C_V3S_Refuel","UK3CB_CHC_C_V3S_Recovery","UK3CB_CHC_C_V3S_Repair","UK3CB_CHC_C_V3S_Closed","UK3CB_CHC_C_V3S_Open","UK3CB_CHC_C_Sedan","UK3CB_CHC_C_Skoda","UK3CB_CHC_C_S1203","UK3CB_CHC_C_S1203_Amb","UK3CB_CHC_C_Tractor","UK3CB_CHC_C_Tractor_Old","UK3CB_CHC_C_UAZ_Closed","UK3CB_CHC_C_UAZ_Open","UK3CB_CHC_C_Ural","UK3CB_CHC_C_Ural_Fuel","UK3CB_CHC_C_Ural_Empty","UK3CB_CHC_C_Ural_Open","UK3CB_CHC_C_Ural_Repair","UK3CB_CHC_C_Gaz24","UK3CB_CHC_C_Golf"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = ["UK3CB_CHC_C_Mi8AMT"];
		};
	case 306: //CIVS - Middle Eastern (LOPFOR)(3CB)
		{
			_Unit_Pool_S = ["LOP_Tak_Civ_Man_06","LOP_Tak_Civ_Man_08","LOP_Tak_Civ_Man_07","LOP_Tak_Civ_Man_05","LOP_Tak_Civ_Man_01","LOP_Tak_Civ_Man_02","LOP_Tak_Civ_Man_09","LOP_Tak_Civ_Man_11","LOP_Tak_Civ_Man_12","LOP_Tak_Civ_Man_14","LOP_Tak_Civ_Random","LOP_Tak_Civ_Man_15","LOP_Tak_Civ_Man_13"];
			_Unit_Pool_V = ["UK3CB_TKC_C_Ikarus","UK3CB_TKC_C_Datsun_Civ_Closed","UK3CB_TKC_C_Datsun_Civ_Open","UK3CB_TKC_C_Hatchback","UK3CB_TKC_C_Hilux_Civ_Closed","UK3CB_TKC_C_Hilux_Civ_Open","UK3CB_TKC_C_Kamaz_Covered","UK3CB_TKC_C_Kamaz_Fuel","UK3CB_TKC_C_Kamaz_Open","UK3CB_TKC_C_Kamaz_Repair","UK3CB_TKC_C_Lada","UK3CB_TKC_C_Lada_Taxi","UK3CB_TKC_C_LR_Closed","UK3CB_TKC_C_LR_Open","UK3CB_TKC_C_V3S_Refuel","UK3CB_TKC_C_V3S_Recovery","UK3CB_TKC_C_V3S_Repair","UK3CB_TKC_C_V3S_Closed","UK3CB_TKC_C_V3S_Open","UK3CB_TKC_C_Sedan","UK3CB_TKC_C_Skoda","UK3CB_TKC_C_S1203","UK3CB_TKC_C_S1203_Amb","UK3CB_TKC_C_Tractor_Old","UK3CB_TKC_C_Tractor","UK3CB_TKC_C_UAZ_Closed","UK3CB_TKC_C_Ural","UK3CB_TKC_C_Fuel","UK3CB_TKC_C_Open","UK3CB_TKC_C_Ural_Empty","UK3CB_TKC_C_Ural_Recovery","UK3CB_TKC_C_Ural_Repair","UK3CB_TKC_C_Gaz24"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
	case 307: //CIVS - 40's (IFA)
		{
			_Unit_Pool_S = ["LIB_CIV_Citizen_1","LIB_CIV_Citizen_2","LIB_CIV_Citizen_4","LIB_CIV_Citizen_5","LIB_CIV_Citizen_5","LIB_CIV_Citizen_6","LIB_CIV_Citizen_7","LIB_CIV_Citizen_8","LIB_CIV_Villager_1","LIB_CIV_Villager_4","LIB_CIV_Villager_2","LIB_CIV_Villager_3","LIB_CIV_Woodlander_1","LIB_CIV_Woodlander_2","LIB_CIV_Woodlander_3","LIB_CIV_Woodlander_4","LIB_CIV_Worker_3","LIB_CIV_Worker_4","LIB_CIV_Worker_1","LIB_CIV_Worker_2"];
			_Unit_Pool_V = ["LIB_GazM1","LIB_GazM1_dirty"];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
	case 308: //CIVS - Vietnamese (UNSUNG)
		{
			_Unit_Pool_S = ["uns_civilian1","uns_civilian2","uns_civilian3","uns_civilian4","uns_civilian1_b1","uns_civilian2_b1","uns_civilian3_b1","uns_civilian4_b1","uns_civilian4_b2","uns_civilian2_b3","uns_civilian1_b3","uns_civilian1_b2","uns_civilian2_b2"];
			_Unit_Pool_V = [];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
	
//-----------------------------------------------------------------
//-----------------------------------------------------------------
// START MISSION SPECIFIC FACTIONS
	case 500:
		{
			_Unit_Pool_S = [];
			_Unit_Pool_V = [];
			_Unit_Pool_T = [];
			_Unit_Pool_A = [];
		};
//-------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------
  Default
  {
    if(DAC_Basic_Value != 5) then
    {
      DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
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
