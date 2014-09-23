_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

	_waypointPos = getWPPos [_groupUnderCursor, 1];
	
	_leader = leader _groupUnderCursor;
	{
		//if (local _x) then
		//{
			/*if (_x != _leader) then
			{
				[_x] joinSilent grpNull;
				(group _x) copyWaypoints (group _leader);
				(group _x) setBehaviour "AWARE";
				(group _x) setSpeedMode "FULL";
				(group _x) setCombatMode "BLUE";
			};*/

			if (_waypointPos select 0 != 0 && _wayPointPos select 1 != 0) then
			{
				doStop _x;
				_x doMove _waypointPos;
			};
			_x setUnitPos "UP";
			_x forceSpeed -1;
			_x disableAI "TARGET";
			_x disableAI "AUTOTARGET";
			_x disableAI "FSM";
		//};
	} forEach units _groupUnderCursor;
	_groupUnderCursor setBehaviour "AWARE";
	_groupUnderCursor setSpeedMode "FULL";
	//_groupUnderCursor setCombatMode "BLUE";
	
	

	[objnull, "Units charging."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true