/*
File: fn_weed.sqf
*/

//Close inventory
closeDialog 0;

//Attemp to start effect..
cutText["","BLACK OUT",1];
player setFatigue 1;
sleep 1;
//Activate ppEffects we need
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;
cutText["","BLACK IN",1];
//Let's go for 45secs of effetcs
cutText["","BLACK OUT",1];
sleep 5;
cutText["","BLACK IN",1];
player setDamage 0.1;

for "_i" from 0 to 44 do
{
	ppColor=ppEffectCreate["ColorCorrections",1999];
	ppColor ppEffectEnable true;
	ppColor ppEffectAdjust[0.5,1,0,[1,1,1,0],[1,1,1,0.0],[1,1,1,1.0]];
	ppColor ppEffectCommit 0;
    "chromAberration" ppEffectAdjust [random 0.35,random 0.35,true];
    "chromAberration" ppEffectCommit 1;   
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 5, 1, random 5];
    sleep 1;
};


//Stop effects
ppEffectDestroy ppColor;
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
player setFatigue 0;
sleep 6;

//Deactivate ppEffects
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;