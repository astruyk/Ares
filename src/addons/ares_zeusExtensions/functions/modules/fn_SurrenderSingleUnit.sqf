_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_unitUnderCursor = [_logic] call Ares_fnc_GetUnitUnderCursor;

	_unitUnderCursor setCaptive true;
	removeAllWeapons _unitUnderCursor;
	_unitUnderCursor action ["Surrender", _unitUnderCursor];
	
	[objnull, format["Removed NVGoogles from %1", _unitUnderCursor]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true