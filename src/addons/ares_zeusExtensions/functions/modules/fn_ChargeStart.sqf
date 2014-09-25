_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

	_waypointPos = getWPPos [_groupUnderCursor, 1];
	if (_waypointPos select 0 != 0 && _wayPointPos select 1 != 0) then
	{
		_groupUnderCursor setBehaviour "AWARE";
		_groupUnderCursor setSpeedMode "FULL";
		{
			_x disableAI "TARGET";
			_x disableAI "AUTOTARGET";

			_x setUnitPos "UP";
			_x doMove _waypointPos;
		} forEach units _groupUnderCursor;
		[objnull, "Units charging."] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		[objnull, "Requires waypoint to be placed for group."] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;
true