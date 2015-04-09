#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
_donateuruidlist = ["76561198052435402"];
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Recrue!"};
			default
			{
				["Armurie Recrue",
					[
						["hgun_P07_snds_F","Tazer",2000],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["Binocular",nil,150],						
						["16Rnd_9x21_Mag",nil,50],
				        ["Chemlight_red",nil,300],
				        ["Chemlight_yellow",nil,300],
				        ["Chemlight_green",nil,300],
				        ["Chemlight_blue",nil,300],
						["C1987_MP7_nwu","MP7",15000],
						["C1987_40Rnd_46x30_mp7","Chargeur MP7",500]					
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Vous n'êtes pas Médecin"};
			default {
				["Hospital EMS Shop",
					[
					    ["hgun_Pistol_Signal_F","Pistolet Lumière",10000],
						["6Rnd_GreenSignal_F","Munitions verte",250],
						["6Rnd_RedSignal_F","Munitions rouge",250],
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Gendarme!"};
			case (__GETC__(life_coplevel) < 2): {"Vous n'êtes pas Gendarme!"};
			default
			{
				["Armurie Gendarme",
					[
						["arifle_TRG21_F",nil,20000],
						["AG_MP9_sidearm","MP9",30000],
						["30Rnd_45ACP_Mag_SMG_01","Chargeur MP9",250],
						["arifle_MX_F",nil,25000],
						["hgun_P07_snds_F","Tazer",2000],
						["acc_pointer_IR",nil,150],
						["acc_flashlight",nil,150],
						["optic_Holosight",nil,150],	
						["FHQ_optic_AIM","AIMPOINT",300],	
						["muzzle_snds_H",nil,100],			
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["30Rnd_556x45_Stanag",nil,125],
						["30Rnd_65x39_caseless_mag",nil,125],						
				        ["Chemlight_red",nil,300],
				        ["Chemlight_yellow",nil,300],
				        ["Chemlight_green",nil,300],
				        ["Chemlight_blue",nil,300],
						["Taser_26",nil,0],
						["26_cartridge",nil,0]
					]
				];
			};
		};
	};

	case "cop_adjudant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Adjudant!"};
			case (__GETC__(life_coplevel) < 3): {"Vous n'êtes pas Adjudant!"};
			default
			{
				["Armurie Adjudant",
					[
						["arifle_Mk20_F",nil,20000],
						["FHQ_M4A1_M203_BLK","M4A1",20000],
						["30Rnd_556x45_Stanag","Chargeur M4A1",500],
						["hlc_rifle_akmgl","AKM",20000],
						["hlc_30Rnd_762x39_b_ak","Chargeur AKM",500],
						["hlc_rifle_aks74_GL","AKS74",20000],
						["hlc_30Rnd_545x39_B_AK","Chargeur AKS74",500],
						["hgun_P07_snds_F","Tazer",2000],
						["acc_pointer_IR",nil,150],
						["acc_flashlight",nil,150],
						["optic_Holosight",nil,150],
						["optic_Aco_smg",nil,150],
						["muzzle_snds_M",nil,150],								
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["30Rnd_556x45_Stanag",nil,125],						
				        ["Chemlight_red",nil,300],
				        ["Chemlight_yellow",nil,300],
				        ["Chemlight_green",nil,300],
				        ["Chemlight_blue",nil,300]	
					]
				];
			};
		};
	};
	
	case "cop_lieutenant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Lieutenant!"};
			case (__GETC__(life_coplevel) < 4): {"Vous n'êtes pas Lieutenant!"};
			default
			{
				["Armurie Lieutenant",
					[
						["arifle_MX_F",nil,20000],
						["Cha_PK","PKM",30000],
						["Cha_100Rnd_762x54_PK","Chargeur PKM",2500],
						["srifle_EBR_F",nil,20000],						
						["hgun_P07_snds_F","Tazer",2000],
						["acc_pointer_IR",nil,150],
						["acc_flashlight",nil,150],
						["optic_Holosight",nil,150],
						["optic_Aco_smg",nil,150],
						["optic_Arco",nil,150],
						["muzzle_snds_B",nil,150],						
						["muzzle_snds_H",nil,150],								
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["30Rnd_65x39_caseless_mag",nil,125],
						["20Rnd_762x51_Mag",nil,125],							
				        ["Chemlight_red",nil,300],
				        ["Chemlight_yellow",nil,300],
				        ["Chemlight_green",nil,300],
				        ["Chemlight_blue",nil,300]	
					]
				];
			};
		};
	};

	case "cop_Major":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Major!"};
			case (__GETC__(life_coplevel) < 5): {"Vous n'êtes pas Major!"};
			default
			{
				["Armurie Major",
					[
						["arifle_MX_F",nil,20000],
						["arifle_MXM_F",nil,20000],						
						["srifle_EBR_F",nil,20000],
						["LMG_Mk200_F",nil,20000],	
						["R3F_HK417L","H417",20000],
						["hlc_30Rnd_762x39_b_ak","Chargeur AK47",500],						
						["hgun_P07_snds_F","Tazer",2000],
						["acc_pointer_IR",nil,150],
						["acc_flashlight",nil,150],
						["optic_Holosight",nil,150],
						["optic_Aco_smg",nil,150],
						["optic_Hamr",nil,150],	
						["optic_MRCO",nil,150],						
						["optic_Arco",nil,150],
						["muzzle_snds_B",nil,150],						
						["muzzle_snds_H",nil,150],
						["muzzle_snds_H_MG",nil,150],						
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["200Rnd_65x39_cased_Box",nil,150],						
						["30Rnd_65x39_caseless_mag",nil,125],
						["20Rnd_762x51_Mag",nil,125],							
				        ["Chemlight_red",nil,300],
				        ["Chemlight_yellow",nil,300],
				        ["Chemlight_green",nil,300],
				        ["Chemlight_blue",nil,300]	
					]
				];
			};
		};
	};		
	
		case "cop_capitaine":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Capitaine!"};
			case (__GETC__(life_coplevel) < 6): {"Vous n'êtes pas Capitaine!"};
			default
			{
				["Armurie Capitaine",
					[
						["hgun_ACPC2_snds_F",nil,5000],					
						["arifle_MX_F",nil,20000],
						["srifle_LRR_F",nil,20000],
						["arifle_MX_SW_F",nil,20000],						
						["arifle_MXM_F",nil,20000],						
						["srifle_EBR_F",nil,20000],
						["LMG_Mk200_F",nil,20000],
						["launch_NLAW_F",nil,50000],						
						["hgun_P07_snds_F","Tazer",2000],
						["acc_pointer_IR",nil,150],
						["acc_flashlight",nil,150],
						["optic_Holosight",nil,150],
						["optic_Aco_smg",nil,150],
						["optic_Hamr",nil,150],
						["optic_SOS",nil,150],
						["optic_Nightstalker",nil,150],							
						["optic_MRCO",nil,150],						
						["optic_Arco",nil,150],
						["muzzle_snds_B",nil,150],						
						["muzzle_snds_H",nil,150],
						["muzzle_snds_H_MG",nil,150],						
						["Binocular",nil,150],
						["B_UavTerminal",nil,1000],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["7Rnd_408_Mag",nil,50],					
						["100Rnd_65x39_caseless_mag",nil,50],
						["9Rnd_45ACP_Mag",nil,50],							
						["200Rnd_65x39_cased_Box",nil,150],						
						["30Rnd_65x39_caseless_mag",nil,125],
						["20Rnd_762x51_Mag",nil,125],
						["NLAW_F",nil,50000],							
				        ["Chemlight_red",nil,300],
				        ["Chemlight_yellow",nil,300],
				        ["Chemlight_green",nil,300],
				        ["Chemlight_blue",nil,300],
						["AS50","AS50",100000],
						["10Rnd_127x99_as50","Chargeur AS50",1000],
						["R3F_Famas_surb_M203","FAMAS G2 M203",15000],
						["R3F_30Rnd_556x45_FAMAS","Chargeur FAMAS G2 M203",500],
						["hlc_rifle_saiga12k","SAIGA 12K",25000],
						["hlc_10rnd_12g_buck_S12","Chargeur SAIGA 12K",500],
						["R3F_Minimi","MINIMI PARA",30000],
						["R3F_200Rnd_556x45_MINIMI","Chargeur MINIMI PARA",2500],
						["C1987_MP7_nwu","MP7",15000],
						["C1987_40Rnd_46x30_mp7","Chargeur MP7",500],
						["Cha_Pecheneg","PKP PECHENEG",30000],
						["Cha_100Rnd_762x54_PK","Chargeur PKP PECHENEG",2500],
						["hlc_rifle_aek971","ZID",20000],
						["hlc_30Rnd_545x39_B_AK","Chargeur ZID",100],
						["Orel_Matraque","MATRAQUE",50000],
						["R3F_PAMAS","PAMAS",5000],
						["R3F_15Rnd_9x19_PAMAS","Chargeur PAMAS",500],
						["hgun_Pistol_heavy_02_F","RHINO",5000],
						["6Rnd_45ACP_Cylinder","Chargeur RHINO",500],
						["FHQ_optic_AC11704","AC11707",300],
						["FHQ_optic_AC12136","AC12136",300],
						["FHQ_optic_ACOG","ACOG",300],
						["FHQ_optic_AIM","AIMPOINT",300],
						["FHQ_optic_HWS_G33","G33",300],
						["FHQ_optic_HWS","HWS 533",300],
						["FHQ_optic_MARS","MARS",100],
						["FHQ_optic_MicroCCO","CCO",100],
						["FHQ_optic_MicroCCO_low","CCO Low",100],
						["FHQ_optic_TWS3050","TWS",100],
						["FHQ_optic_VCOG","VCOG",100],
						["R3F_AIMPOINT","Lunette AIMPOINT",100],
						["R3F_EOTECH","EOTECH",100],
						["R3F_FELIN_FRF2","FELIN",100],
						["R3F_NF","NIGHT FORCE X15",100],
						["R3F_NF42","NIGHT FORCE X42",100],
						["R3F_J10","J10",100],
						["R3F_J10_MILDOT","J10 MILDOT",100],
						["R3F_J4","J4",100],
						["R3F_J8","J8",100],
						["R3F_J8_MILDOT","J8 MILDOT",100],
						["R3F_ZEISS","ZEISS",100],
						["hlc_optic_goshawk","GOSHAWK",100],
						["hlc_optic_kobra","KOBRA",100],
						["HLC_Optic_PSO1","PSO",100],
						["optic_DMS","PSO",100]	
					]
				];
			};
		};
	};

    case "cop_chef":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Général!"};
			case (__GETC__(life_coplevel) < 7): {"Vous n'êtes pas Général!"};
			default
			{
				["Armurie Général / Colonel",
					[
						["hgun_ACPC2_snds_F",nil,5000],	
						["R3F_20Rnd_762x51_HK417","Chargeur H417",500],
						["hlc_rifle_ak47","AK47",20000],						
						["arifle_MX_F",nil,20000],
						["srifle_LRR_F",nil,20000],
						["arifle_MX_SW_F",nil,20000],						
						["arifle_MXM_F",nil,20000],
						["arifle_MX_GL_F",nil,20000],							
						["srifle_EBR_F",nil,20000],
						["LMG_Mk200_F",nil,20000],
						["srifle_GM6_F",nil,20000],						
						["launch_NLAW_F",nil,50000],
						["launch_Titan_F",nil,50000],						
						["hgun_P07_snds_F","Tazer",2000],
						["acc_pointer_IR",nil,150],
						["acc_flashlight",nil,150],
						["optic_Holosight",nil,150],
						["optic_Aco_smg",nil,150],
						["optic_Hamr",nil,150],
						["optic_SOS",nil,150],
						["optic_Nightstalker",nil,150],							
						["optic_MRCO",nil,150],						
						["optic_Arco",nil,150],
						["optic_tws",nil,150],							
						["optic_NVS",nil,150],
						["B_UavTerminal",nil,1000],						
						["muzzle_snds_B",nil,150],						
						["muzzle_snds_H",nil,150],
						["muzzle_snds_H_MG",nil,150],						
						["Binocular","Jumelles",150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["7Rnd_408_Mag",nil,50],					
						["100Rnd_65x39_caseless_mag",nil,50],
						["9Rnd_45ACP_Mag",nil,50],
						["5Rnd_127x108_Mag",nil,50],
						["3Rnd_UGL_FlareRed_F",nil,50],
						["1Rnd_SmokeRed_Grenade_shell",nil,50],						
						["200Rnd_65x39_cased_Box",nil,150],						
						["30Rnd_65x39_caseless_mag",nil,125],
						["20Rnd_762x51_Mag",nil,125],
						["NLAW_F",nil,50000],
						["Titan_AA",nil,50000],						
				        ["Chemlight_red",nil,300],
				        ["Chemlight_yellow",nil,300],
				        ["Chemlight_green",nil,300],
				        ["SmokeShell",nil,300],
						["AS50","AS50",100000],
						["10Rnd_127x99_as50","Chargeur AS50",1000],
						["R3F_Famas_surb_M203","FAMAS G2 M203",15000],
						["R3F_30Rnd_556x45_FAMAS","Chargeur FAMAS G2 M203",500],
						["hlc_rifle_saiga12k","SAIGA 12K",25000],
						["hlc_10rnd_12g_buck_S12","Chargeur SAIGA 12K",500],
						["R3F_Minimi","MINIMI PARA",30000],
						["R3F_200Rnd_556x45_MINIMI","Chargeur MINIMI PARA",2500],
						["C1987_MP7_nwu","MP7",15000],
						["C1987_40Rnd_46x30_mp7","Chargeur MP7",500],
						["Cha_Pecheneg","PKP PECHENEG",30000],
						["Cha_100Rnd_762x54_PK","Chargeur PKP PECHENEG",2500],
						["hlc_rifle_aek971","ZID",20000],
						["hlc_30Rnd_545x39_B_AK","Chargeur ZID",100],
						["Orel_Matraque","MATRAQUE",50000],
						["R3F_PAMAS","PAMAS",5000],
						["R3F_15Rnd_9x19_PAMAS","Chargeur PAMAS",500],
						["hgun_Pistol_heavy_02_F","RHINO",5000],
						["6Rnd_45ACP_Cylinder","Chargeur RHINO",500],
						["FHQ_optic_AC11704","AC11707",300],
						["FHQ_optic_AC12136","AC12136",300],
						["FHQ_optic_ACOG","ACOG",300],
						["FHQ_optic_AIM","AIMPOINT",300],
						["FHQ_optic_HWS_G33","G33",300],
						["FHQ_optic_HWS","HWS 533",300],
						["FHQ_optic_MARS","MARS",100],
						["FHQ_optic_MicroCCO","CCO",100],
						["FHQ_optic_MicroCCO_low","CCO Low",100],
						["FHQ_optic_TWS3050","TWS",100],
						["FHQ_optic_VCOG","VCOG",100],
						["R3F_AIMPOINT","Lunette AIMPOINT",100],
						["R3F_EOTECH","EOTECH",100],
						["R3F_FELIN_FRF2","FELIN",100],
						["R3F_NF","NIGHT FORCE X15",100],
						["R3F_NF42","NIGHT FORCE X42",100],
						["R3F_J10","J10",100],
						["R3F_J10_MILDOT","J10 MILDOT",100],
						["R3F_J4","J4",100],
						["R3F_J8","J8",100],
						["R3F_J8_MILDOT","J8 MILDOT",100],
						["R3F_ZEISS","ZEISS",100],
						["hlc_optic_goshawk","GOSHAWK",100],
						["hlc_optic_kobra","KOBRA",100],
						["HLC_Optic_PSO1","PSO",100],
						["optic_DMS","PSO",100]
					]
				];
			};
		};
	};	
	
	case "cop_gign":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas du GIGN!"};
			case (__GETC__(life_coplevel) < 7): {"Vous n'êtes pas du GIGN!"};
			default
			{
				["Armurie GIGN",
					[
						["R3F_HK416M_HG","HK416",30000],
						["R3F_30Rnd_556x45_HK416","Chargeur HK416",150],
						["srifle_LRR_F","M320",50000],	
						["FHQ_acc_ANPEQ15_black",nil,150],
						["muzzle_snds_H",nil,100],						
						["7Rnd_408_Mag","Chargeur M320",200],
						["optic_SOS","Viseur SOS",500],
						["gign_shield","Bouclier GIGN",5000]
					]
				];
			};
		};
	};		
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"Il faut acheter la licence pour négocier avec Mohammed"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["FirstAidKit",nil,150],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["arifle_TRG20_F","TRG20",25000],
						["arifle_Katiba_F","Katiba",30000],
						["srifle_DMR_01_F",nil,50000],
						["arifle_SDAR_F","SDAR",20000],
						["launch_RPG32_F",nil,125000],
						["RPG32_F",nil,2500],
						["optic_ACO_grn","Viseur ACO",3500],
						["optic_Holosight","Viseur Holographique",3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag",nil,500],
						["30Rnd_65x39_caseless_green",nil,275],
						["Binocular","Jumelles",150],
						["NVGoggles",nil,2000],
						["R3F_M107_DES","BARETT M107",50000],
						["R3F_10Rnd_127x99_M107","Chargeur BARETT M107",2500],
						["R3F_Famas_F1_DES","FAMAS F1",30000],
						["R3F_25Rnd_556x45_FAMAS","Chargeur FAMAS F1",1000],
						["R3F_Famas_surb_DES","FAMAS C",30000],
						["R3F_30Rnd_556x45_FAMAS","Chargeur FAMAS C",1000],
						["FnFal","FNFAL",50000],
						["20Rnd_762x51_Mag","Chargeur FNFAL",2500],
						["R3F_FRF2_DES","F2",50000],
						["R3F_10Rnd_762x51_FRF2","Chargeur F2",2500],
						["R3F_HK417S_HG","HK417",30000],
						["R3F_20Rnd_762x51_HK417","Chargeur HK417",1000],
						["M110","M110",50000],
						["20Rnd_762x51_Mag","Chargeur M110",2500],
						["SLTS_M27","M27 IAR",30000],
						["30Rnd_556x45_Stanag","Chargeur M27 IAR",1000],
						["FHQ_M4A1_WDL","M4A1",20000],
						["30Rnd_556x45_Stanag","Chargeur M4A1",750],
						["hlc_lmg_M60E4","M60E4",35000],
						["hlc_100Rnd_762x51_B_M60E4","Chargeur M60E4",2000],
						["R3F_Minimi_762","MINIMI PARA",35000],
						["R3F_100Rnd_762x51_MINIMI","Chargeur MINIMI PARA",2000],
						["R3F_MP5SD","MP5",15000],
						["R3F_30Rnd_9x19_MP5","Chargeur MP5",500],
						["AG_MP9_wcam","MP9",15000],
						["30Rnd_45ACP_Mag_SMG_01","Chargeur MP9",500],
						["R3F_PGM_Hecate_II_DES","PGM HECATE",50000],
						["R3F_7Rnd_127x99_PGM","Chargeur PGM HECATE",2500],
						["SG553","SG553",20000],
						["30Rnd_56x45_GP90","Chargeur SG553",750],
						["SIG_P226","SIG P226",1000],
						["16Rnd_9x21_Mag","Chargeur SIG P226",100],
						["FHQ_optic_AC11704_tan","AC11704",300],
						["FHQ_optic_AC12136_tan","AC12136",300],
						["FHQ_optic_ACOG_tan","ACOG",300],
						["FHQ_optic_AIM_tan","AIMPOINT",300],
						["FHQ_optic_HWS_G33_tan","G33",300],
						["R3F_NF42_DES","LNF42",300],
						["FHQ_optic_LeupoldERT","LEUPOLD",300],
						["FHQ_optic_MARS_tan","MARS",100],
						["FHQ_optic_MicroCCO_tan","CCO",100],
						["FHQ_optic_MicroCCO_low_tan","CCO Low",100],
						["FHQ_optic_VCOG_tan","VCOG",100],
						["R3F_AIMPOINT_DES","Lunette AIMPOINT",100],
						["R3F_EOTECH_DES","EOTECH",100],
						["R3F_NF_DES","NIGHT FORCE X15",100],
						["R3F_NF42_DES","NIGHT FORCE X42",100],
						["R3F_J10_DES","J10",100],
						["R3F_J10_MILDOT_DES","J10 MILDOT",100],
						["R3F_J4_DES","J4",100],
						["R3F_J8_DES","J8",100],
						["R3F_J8_MILDOT_DES","J8 MILDOT",100],
						["R3F_ZEISS_DES","ZEISS",100]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"Vous n'avez pas la licence de port d'arme!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["hgun_Rook40_F","Rook",8000],
						["16Rnd_9x21_Mag","Chargeur Rook",75]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,10000],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};	
		
	case "donateur":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous devez etre un civil pour acceder au magasin"};
			case (!((getPlayerUID player) in _donateuruidlist)): {"Vous n'êtes pas donateur !"};
			default
			{
				["Magasin Donateur",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_PDW2000_F",nil,6500],
						["hgun_pistol_heavy_01_F",nil,5850],
						["arifle_Mk20C_plain_F",nil,25000],
						["srifle_LRR_F",nil,50000],
						["LMG_Mk200_F",nil,100000],
						["srifle_EBR_F",nil,35000],
						["arifle_Katiba_F",nil,30000],
						["SMG_01_F",nil,10000],
						["optic_ACO_grn_smg",nil,750],
						["optic_MRCO",nil,10000],
						["optic_SOS",nil,20000],
						["NVGoggles",nil,350],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,50],
						["11Rnd_45ACP_Mag",nil,70],
						["30Rnd_556x45_Stanag_Tracer_Red","Chargeur Mk20",90],
						["7Rnd_408_Mag","Chargeur M320",150],
						["200Rnd_65x39_cased_Box","Chargeur Mk200",2000],
						["20Rnd_762x51_Mag","Chargeur Mk18",120],
						["30Rnd_65x39_caseless_green","Chargeur Katiba",100],
						["30Rnd_45ACP_Mag_SMG_01","Chargeur Vermin",80]
					]
				];
            };
		};
	};
};
