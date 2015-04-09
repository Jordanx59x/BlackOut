/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Ermöglicht senden bzw. die Abfrage des Geschriebenen.

*/

private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if (life_cash <= 12000 ) exitWith { systemChat "Il vous faut 6000 € pour envoyer un message!"; };
if (playerSide != civilian ) exitWith { systemChat "Vous devez être un civil!"; };
life_cash = life_cash - 12000;

_message = ctrlText 9001;


[[2,format ["%1 a envoyer un message Radio depuis le Channel 7: %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;