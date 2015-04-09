/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {15000}; //Boating license cost
	case "pilot": {250000}; //Pilot/air license cost
	case "gun": {25000}; //Firearm/gun license cost
	case "dive": {5000}; //Diving license cost
	case "oil": {10000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "gign": {999999}; //GIGN License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {300000}; //Heroin processing license cost
	case "marijuana": {280000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {150000}; //Gang license cost
	case "rebel": {1000000}; //Rebel license cost
	case "truck": {45000}; //Truck license cost
	case "diamond": {35000};
	case "salt": {20000};
	case "cocaine": {500000};
	case "sand": {40000};
	case "iron": {40500};
	case "copper": {12000};
	case "cement": {31500};
	case "mair": {15000};
	case "home": {350000}; 
	case "depanneur": {999999};
	case "meth": {350000};
	case "stiller":{50000};
	case "liquor":{100000};
	case "bottler":{100000};
	case "mash":{100000};
};