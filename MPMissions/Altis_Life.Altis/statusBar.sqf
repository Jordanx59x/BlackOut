waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*

File: fn_statusBar.sqf

Author: Some French Guy named Osef I presume, given the variable on the status bar

Edited by: [midgetgrimm]

Description: Puts a small bar in the bottom right of screen to display in-game information

*/

4 cutRsc ["osefStatusBar","PLAIN"]; 
//systemChat format["[GL v3.1.4] Loading game server info...", _rscLayer];

[] spawn {
	sleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText
    format["FPS: %1 | Gendarmes: %2 | Civils: %3 | Médecins: %4 | Argent: %5 | Banque: %6 | Position GPS: %7", round diag_fps, 
    west countSide playableUnits, civilian countSide playableUnits,
    independent countSide playableUnits,[life_cash] call life_fnc_numberText,[life_atmcash] call   
    life_fnc_numberText,mapGridPosition player, _counter];
	}; 
};
 