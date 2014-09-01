/*
	Returns a player that was previously invisible to a normal state.

	Parameters:
		0 - Object - The player to make visible again.
*/

_unit = _this select 0;

_unit setVariable ["Ares_unitVisibility", "visible"];

_unit setDamage 0;
_unit allowDamage true;
_unit setCaptive false;
_unit hideObjectGlobal false;

hint "Player is now visible again.";
sleep 3;
hint "";