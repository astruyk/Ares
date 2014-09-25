
/*
	Makes a player invisible and prevents them from taking damage or interacting with AI.

	Parameters:
		0 - Object - The player to make invisible.
		1 - Boolean - True to make the player invisible, false to make them visible again.
*/

_unit = _this select 0;
_shouldBeInvisible = _this select 1;

_updateVisibilityBlock = {
	_unit = _this select 0;
	_shouldBeInvisible = _this select 1;
	if (_shouldBeInvisible) then
	{
		_unit setVariable ["Ares_isUnitInvisible", "true", true];
	}
	else
	{
		_unit setVariable ["Ares_isUnitInvisible", "false", true];
	};
	_unit setDamage 0;
	_unit allowDamage !_shouldBeInvisible;
	_unit setCaptive _shouldBeInvisible;
	_unit hideObjectGlobal _shouldBeInvisible;
};
[_updateVisibilityBlock, [_unit, _shouldBeInvisible], false] call Ares_fnc_BroadcastCode;

hint "Player is now invisible.";
sleep 3;
hint "";