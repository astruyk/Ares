_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_unitUnderCursor = [_logic] call Ares_fnc_GetUnitUnderCursor;
	
	_vehicle = vehicle _unitUnderCursor;
	if (_vehicle isKindOf "Helicopter") then
	{
		_groupUnderCursor = (group _unitUnderCursor);
		_landingPos = (position _vehicle) findEmptyPosition [0, 500, (typeOf _vehicle)];
		if (count _landingPos > 0) then
		{
			// Remove other waypoints.
			while {(count (waypoints _groupUnderCursor)) > 0} do
			{
				deleteWaypoint ((waypoints _groupUnderCursor) select 0);
			};

			_waypoint = _groupUnderCursor addWaypoint [_landingPos, 0];
			_waypoint setWaypointType "TR UNLOAD";
			_unitUnderCursor allowFleeing 0;
			
			[objnull, "Landing helicopter ASAP."] call bis_fnc_showCuratorFeedbackMessage;
		}
		else
		{
			[objnull, "Unable to find landing zone."] call bis_fnc_showCuratorFeedbackMessage;
		};
	}
	else
	{
		[objnull, "Module must be placed on a helicopter."] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;
true