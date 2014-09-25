_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

	_groupUnderCursor setBehaviour "AWARE";
	_groupUnderCursor setSpeedMode "AUTO";
	{
		_x enableAI "TARGET";
		_x enableAI "AUTOTARGET";
		_x enableAI "FSM";
		
		_x setUnitPos "AUTO";
		_x doMove (position _x);
	} forEach units _groupUnderCursor;
	[objnull, "Units stopped charging."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true