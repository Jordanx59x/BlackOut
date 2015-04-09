#include <macro.h>
/*
    File: fn_adminDebugCon.sqf
    Author: ColinM9991
    
    Description:
    Opens the Debug Console.
*/
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint "Tu n'es pas d'un level assez haut.";};

createDialog "RscDisplayDebugPublic";