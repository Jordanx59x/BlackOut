/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn 
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_gangMarkers;}};
		};
	};
	
	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
	};
	
	// ANTI ² 
	case 41:
    {
		if((_code in (actionKeys "SelectAll") || _code in (actionKeys "ForceCommandingMode"))) then 
		{
			[] call life_fnc_p_openIphone;
			player setDamage ((getDammage player) + 0.15);
			hint parseText format["!!! LA TRICHE EST INTERDITE !!!<br/> Le MetaGaming c'est MAL<br/> Ou ça fait MAL...<br/><t size='1.4'><t color='#FF0000'>Tu viens de perdre 15 points de vie !</t></t>"];
		};
	};
	
	//report alt + f4
	case 62:
    {
		private ["_player"];
		_player = player;
		
		if(_alt && !_shift) then 
		{
			diag_log format ["SERVER: %1 ALT+F4 to disconnect (report it)",_player getVariable["realname",name _player]];
			[[1,format["SERVER: %1 a utilisé ALT+F4 pour déconnecter (merci de le signaler à un Admin.)",_player getVariable["realname",name _player]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		};
    };
	
	// SHIFT+M pour mettre ou retirer les boules quiès
	case 51:
	{
		if(_shift) then
		{
			if (soundVolume != 1) then 
			{
				1 fadeSound 1;
				titleText ["Vous avez enlevé vos boules quiès.", "PLAIN"];
			}
			else
			{
				1 fadeSound 0.1;
				titleText ["Vous avez mis vos boules quiès.", "PLAIN"];
			};
		};	
    };
	
	//Surrender Shift + B
    case 48:
    {
        if(_shift) then {_handled = true;};

        if (_shift) then
        {
            if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
            {
                if (player getVariable ["surrender", false]) then
                {
                    player setVariable ["surrender", false, true];
                } else
                {
                    [] spawn life_fnc_surrender;
                };
            };
        };
    };

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	
	//Shift + L in vehicle Cop/Medic lights
	case 38: 
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","B_Heli_Light_01_F","B_Heli_Transport_01_F","I_Heli_light_03_unarmed_F","O_MRAP_02_F","cl3_suv_black","demian2435_swat_offroad","demian2435_swat_hunter","demian2435_police_car","demian2435_police_helicopter"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
		
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};
	
	// O, Police Gate Opener
    case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
	};
	
	//TAB Vehicle Key
	case 15:
	{
		if(playerSide in [civilian] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 29.670;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Radio OFF","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Radio ON","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == civilian) then {
					[[_veh],"life_fnc_thug",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					//[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
	
	//F Key
	case 33:
	{
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
	
	//C + Shift
    case 46:
    {    
        if(_shift && (!life_action_inUse) && (vehicle player == player) ) then
        {
            {
                _str = [_x] call life_fnc_varToStr;
                _val = missionNameSpace getVariable _x;
                if(_val > 0 ) then
                {
                    if( _str == "Spitzhacke" || _str == "pickaxe" || _str == "pioche" ) then
                    {
                        [] spawn life_fnc_pickAxeUse;
                    };
                };
            } foreach life_inv_items;
        }
    };
	
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat "Vous avez déverrouillé votre véhicule.";
						player say3D "unlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};	
						systemChat "Vous avez vérrouillé votre véhicule.";
						player say3D "car_lock";
					};
				};
			};
		};
	};
	
	//Ninja(Shift + Num 1)
	case 79:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Moi j'aime le riz cantonné !!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
	};

	//Kneebend Lent(Shift + Num 2)
	case 80:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Tranquille ma gueule~"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
		};
	};

	//Mouvement rapide(Shift + Num 3)
	case 81:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Allez on bouge !!!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		};
	};

	//Pompes(Shift + Num 4)
	case 75:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["POMPES SHEGUEY!!!!!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
						player say3D "pompes";
		};
	};
};
_handled;