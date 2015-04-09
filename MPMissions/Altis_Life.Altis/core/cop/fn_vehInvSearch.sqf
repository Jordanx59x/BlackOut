#include <macro.h>
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle")) then
{
	life_action_inUse = true;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
	_upp = format["Recherche",_displayName];
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	while{true} do
	{
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};
		sleep 0.27;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(life_interrupted) exitWith {};
	};

	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;

	_vehicleInfo = _vehicle getVariable ["Trunk",[]];
	if(count _vehicleInfo == 0) exitWith {hint localize "STR_Cop_VehEmpty"};

	_value = 0;
	{
		_var = _x select 0;
		_val = _x select 1;
		
		_index = [_var,life_illegal_items] call TON_fnc_index;
		if(_index != -1) then
		{
			_vIndex = [_var,__GETC__(sell_array)] call TON_fnc_index;
			if(_vIndex != -1) then
			{
				_value = _value + (_val * ((__GETC__(sell_array) select _vIndex) select 1));
			};
		};
	} foreach (_vehicleInfo select 0);

	if(_value > 0) then
	{
		[[0,"STR_NOTF_VehContraband",true,[[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		life_atmcash = life_atmcash + _value;
		_vehicle setVariable["Trunk",[],true];
	}
		else
	{
		hint localize "STR_Cop_NoIllegalVeh";
	};
};