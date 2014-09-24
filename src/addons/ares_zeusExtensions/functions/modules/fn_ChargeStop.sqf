_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

	_groupUnderCursor setBehaviour "AWARE";
	_groupUnderCursor setSpeedMode "NORMAL";
	{
		_x setVariable ["Ares_IsCharging", false];
	} forEach units _groupUnderCursor;
	[objnull, "Units stopped charging."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true