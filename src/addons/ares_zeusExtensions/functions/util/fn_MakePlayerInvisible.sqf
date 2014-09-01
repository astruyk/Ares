
/*
	Makes a player invisible and prevents them from taking damage or interacting with AI.

	Parameters:
		0 - Object - The player to make invisible.
*/

_unit = _this select 0;

_unit setVariable ["Ares_unitVisibility", "invisible"];

_unit allowDamage false;
_unit setCaptive true;
_unit hideObjectGlobal true;

hint "Player is now invisible.";
sleep 3;
hint "";