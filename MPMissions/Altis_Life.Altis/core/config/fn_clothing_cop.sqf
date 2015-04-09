#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
			_ret pushBack ["U_Rangemaster","Cop Uniform",25];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam_tshirt",nil,350];
			_ret pushBack ["U_B_survival_uniform",nil,1250];
			_ret pushBack ["U_C_Policeman","Uniforme Gendarme",550];
			_ret pushBack ["ALFR_FR_police_tenu",nil,550];
			_ret pushBack ["ALFR_FR_police_tenu2",nil,550];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam_worn",nil,550];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_ret pushBack ["U_C_GIGN","Uniforme GIGN noire",550];
			_ret pushBack ["gign_uniform","Uniforme GIGN bleue",550];
		};
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["H_HelmetB_plain_mcamo",nil,75];
			_ret pushBack ["H_Booniehat_mcamo",nil,120];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret pushBack ["H_MilCap_mcamo",nil,100];
			_ret pushBack ["H_Beret_blk","Beret",100];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_ret pushBack ["gign_Balaclava","Cagoule GIGN",100];
			_ret pushBack ["gign_helm","Casque GIGN",100];
			_ret pushBack ["gign_helm3","Casque GIGN 2",100];
			_ret pushBack ["gign_helm4","Casque GIGN 3",100];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,800];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["V_PlateCarrier2_rgr",nil,1500];
		};
		if(__GETC__(life_coplevel) > 7) then
		{
			_ret pushBack ["gign_HeavyVest","Veste GIGN",800];
			_ret pushBack ["gign_BlackVest","Veste tactique GIGN",600];
			_ret pushBack ["V_TacVest_GIGN2","Veste tactique GIGN 2",600];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500],
			["ALFR_Police_Bags","Sac BlackOut",5000]
		];
	};
};

_ret;