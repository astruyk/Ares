_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

	if (not isnull _groupUnderCursor) then
	{
		_dialogResult =
			["Begin Patrol",
					[
						["Size of patrol grid:", ["50m", "100m", "150m", "200m", "500m"]],
						["Behaviour:", ["Relaxed", "Cautious", "Searching"]],
						["Direction:", ["Clockwise", "Counter-Clockwise"]],
						["Delay at waypoints:", ["None", "15s", "30s", "1m"]]
					]
			] call Ares_fnc_ShowChooseDialog;
		if (count _dialogResult > 0) then
		{
			_radius = 50;
			switch (_dialogResult select 0) do
			{
				case 0: { _radius = 50; };
				case 1: { _radius = 100; };
				case 2: { _radius = 150; };
				case 3: { _radius = 200; };
				case 4: { _radius = 500; };
				default { _radius = 50; };
			};
			
			switch (_dialogResult select 1) do
			{
				// Case0 and default
				default
				{
					// Relaxed
					_groupUnderCursor setBehaviour "SAFE";
					_groupUnderCursor setSpeedMode "LIMITED";
				};
				case 1:
				{
					// Cautious
					_groupUnderCursor setBehaviour "AWARE";
					_groupUnderCursor setSpeedMode "LIMITED";
				};
				case 2:
				{
					// Searching
					_groupUnderCursor setBehaviour "COMBAT";
					_groupUnderCursor setSpeedMode "NORMAL";
				};
			};
			
			_moveClockwise = (_dialogResult select 2) == 0;

			_delay = [0, 0, 0];
			switch (_dialogResult select 3) do
			{
				default {}; // Already set default (0) values
				case 1:
				{
					// 15s
					_delay = [12, 15, 17];
				};
				case 2:
				{
					// 30s
					_delay = [20, 30, 40];
				};
				case 3:
				{
					// 1m
					_delay = [45, 60, 75];
				};
			};
			
			// Remove other waypoints.
			 while {(count (waypoints _groupUnderCursor)) > 0} do
			{
				deleteWaypoint ((waypoints _groupUnderCursor) select 0);
			};

			// Make a circle with the unit's current location at the center.
			_numberOfWaypoints = 6;
			_degreesPerWaypoint =  360 / _numberOfWaypoints;
			if (!_moveClockwise) then
			{
				_degreesPerWaypoint = _degreesPerWaypoint * -1;
			};
			_centerPoint = position _logic;
			for "_waypointNumber" from 0 to (_numberOfWaypoints - 1) do
			{
				_currentDegrees = _degreesPerWaypoint * _waypointNumber;
				_waypoint = _groupUnderCursor addWaypoint [[_centerPoint, _radius, _currentDegrees] call BIS_fnc_relPos, 5];
				_waypoint setWaypointTimeout _delay;
			};
			
			// Add a waypoint at the location of the first WP. We started at 0 degrees.
			// We don't delay the cycle WP since then we'd have double-time before moving.
			_waypoint = _groupUnderCursor addWaypoint [[_centerPoint, _radius, 0] call BIS_fnc_relPos, 5];
			_waypoint setWaypointType "CYCLE";
			
			[objnull, "Circular patrol path setup for units."] call bis_fnc_showCuratorFeedbackMessage;
		};
	};
};

deleteVehicle _logic;
true