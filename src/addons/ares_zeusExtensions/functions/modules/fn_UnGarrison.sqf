_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

	{
		_x doMove (getPos _x);
	} forEach(units _groupUnderCursor);

	[objnull, "Units released from garrison."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true