/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Meurtre véhiculé",9500]};
	case "187": {_type = ["Meurtre",80000]};
	case "901": {_type = ["Echappé de prison",6500]};
	case "261": {_type = ["Viol",5000]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Tentative de viol",3000]};
	case "215": {_type = ["Tentative de vol",2000]};
	case "213": {_type = ["Utilisation d'explosif illégale",10000]};
	case "211": {_type = ["Vol",1000]};
	case "207": {_type = ["Kidnapping",7500]};
	case "207A": {_type = ["Tentative de kidnapping",2000]};
	case "390": {_type = ["Ivresse publique",15000]};
	case "487": {_type = ["Vol de vehicule",1500]};
	case "488": {_type = ["Chapardage petit vol",700]};
	case "480": {_type = ["Délit de fuite",1300]};
	case "481": {_type = ["Possession de drogues",1000]};
	case "482": {_type = ["Intention de distribuer",5000]};
	case "483": {_type = ["Trafique de drogue",9500]};
	case "459": {_type = ["Cambriolage",6500]};
	case "460": {_type = ["Consommation de stups",9000]};
	case "919": {_type = ["Vol d'organes",100000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
};