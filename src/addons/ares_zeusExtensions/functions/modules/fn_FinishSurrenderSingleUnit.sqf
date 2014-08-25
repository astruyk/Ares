_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_unitUnderCursor = [_logic] call Ares_fnc_GetUnitUnderCursor;

	_unitUnderCursor switchMove "";
	
	_unitUnderCursor action ["sitDown", _unitUnderCursor];
	
	[objnull, format["Unit %1 is now movable again.", _unitUnderCursor]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true