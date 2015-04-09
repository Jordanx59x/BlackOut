/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "SpyGlass\fn_initSpy.sqf";
[] execVM "core\init.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

_illegalmarkers = ["cocaine_1","meth","Weed_p_1","Dealer_1","turtle_1_name_1","turtle_1_name_2","heroin_p","turtle_1","turtle_dealer","heroin_1","cocaine_p","Meth_process","turtle_2","turtle_3","turtle_1_name","Hospital du CDC","weed_1"];

if (playerSide == west) then {

{ deleteMarkerLocal _x; } forEach _illegalmarkers;

};