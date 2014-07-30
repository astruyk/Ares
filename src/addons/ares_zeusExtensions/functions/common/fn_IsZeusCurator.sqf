_unit = _this select 0;
_result = false;

{
	_player = getassignedcuratorunit _x;
	if(_unit == _player) exitWith {
		_result = true
	};
} foreach allCurators;

_result