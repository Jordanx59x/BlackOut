/*
File : fn_civIdentity.sqf
Author: Wawixs

Comments:
Shows the identity card to other players
*/

private["_target","_ret","_message"];

_target = cursorTarget;
_ret = _this;

if(playerSide != civilian) exitWith
{
	hint "Tu n'es pas civil...";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then exitWith{};

if(license_civ_rebel) then {
	_message = format["<img size='8' color='#FFFFFF' image='textures\fakeidentity.paa'/><br/><br/><t size='1.5'>%1</t><br/><t size='0.6'>%2</t><br/><t size='0.5'>Civil d'Altis</t>", name player,[_ret select 0] call life_fnc_numberText];

	[[player, _message],"life_fnc_civIdentityShown",_target,false] spawn life_fnc_MP;
} else {
	_message = format["<img size='8' color='#FFFFFF' image='textures\identity.paa'/><br/><br/><t size='1.5'>%1</t><br/><t size='0.6'>%2</t><br/><t size='0.5'>Civil d'Altis</t>", name player,[_ret select 0] call life_fnc_numberText];

	[[player, _message],"life_fnc_civIdentityShown",_target,false] spawn life_fnc_MP;
};