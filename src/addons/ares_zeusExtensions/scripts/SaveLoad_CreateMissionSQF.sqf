[
	"Save/Load",
	"Generate Mission SQF",
	{
		_output = [];
		_radius = 100;
		_position = _this select 0;
		
		_emptyObjects = [];
		_vehicles = [];
		_groups = [];
		
		_objectsToFilter = curatorEditableObjects (allCurators select 0);
		{
			_ignoreFlag = false;
			if ((typeOf _x) in Ares_EditableObjectBlacklist || _x == player) then
			{
				_ignoreFlag = true;
			};
			
			if (!_ignoreFlag && _x distance _position <= _radius) then
			{
				_output pushBack (format ["Processing object: %1 - %2", _x, typeof(_x)]);
				_ignoreFlag = true;
				_isUnit = (_x isKindOf "CAManBase")
					|| (_x isKindOf "car")
					|| (_x isKindOf "tank")
					|| (_x isKindOf "air")
					|| (_x isKindOf "StaticWeapon")
					|| (_x isKindOf "ship");
				if (_isUnit) then
				{
					if (_x isKindOf "CAManBase") then
					{
						_output pushBack "Is a man.";
						if ((group _x) in _groups) then
						{
							_output pushBack "In an old group.";
						}
						else
						{
							_output pushBack "In a new group.";
							_groups pushBack (group _x);
						};
						
					}
					else
					{
						if (count crew _x > 0) then
						{
							_output pushBack "Is a vehicle with units.";
							if ((group _x) in _groups) then
							{
								_output pushBack "In an old group.";
							}
							else
							{
								_output pushBack "In a new group.";
								_groups pushBack (group _x);
							};
						}
						else
						{
							_output pushBack "Is an empty vehicle.";
						};
						_vehicles pushBack _x;
					};
				}
				else
				{
					if (_x isKindOf "Logic") then
					{
						_output pushBack "Is a logic. Ignoring.";
					}
					else
					{
						_output pushBack "Is an empty vehicle.";
						_emptyObjects pushBack _x;
					};
				};
			}
			else
			{
				_output pushBack (format ["Ignoring object: %1 - %2", _x, typeof(_x)]);
			};
		} forEach _objectsToFilter;
		
		// HACK - We'll dump everything we've written so far since it's just debug data anyways.
		{
			diag_log _x;
		} forEach _output;
		_output = [];
		
		{
			_output pushBack format [
				"_newObject = createVehicle ['%1', [%2, %3, %4], [], 0, 'CAN_COLLIDE']; _newObject setDir %5; _newObjects pushBack _newObject;",
				(typeOf _x),
				(position _x) select 0,
				(position _x) select 1,
				(position _x) select 2,
				(getDir _x)];
		} forEach _emptyObjects;
		
		{
			_output pushBack format [
				"_newGroup = createGroup %1; ",
				(side _x)];
			_groupVehicles = [];
			// Process all the infantry in the group
			{
				if (vehicle _x == _x) then
				{
					_output pushBack format [
						"_newUnit = _newGroup createUnit ['%1', [%2, %3, %4], [], 0, 'CAN_COLLIDE']; _newUnit setSkill %5; _newUnit setRank '%6'; _newUnit setFormDir %7; _newUnit setDir %7;",
						(typeOf _x),
						(position _x) select 0,
						(position _x) select 1,
						(position _x) select 2,
						(skill _x),
						(rank _x),
						(getDir _x)];
				}
				else
				{
					if (not ((vehicle _x) in _groupVehicles)) then
					{
						_groupVehicles pushBack (vehicle _x);
					};
				};
			} forEach (units _x);
			
			// Create the vehicles that are part of the group.
			{
				_output pushBack format [
					"_newObject = createVehicle ['%1', [%2, %3, %4], [], 0, 'CAN_COLLIDE']; _newObjects pushBack _newObject; createVehicleCrew _newObject; (crew _newObject) join _newGroup; _newObject setDir %5; _newObject setFormDir %5;",
					(typeOf _x),
					(position _x) select 0,
					(position _x) select 1,
					(position _x) select 2,
					(getDir _x)];
			} forEach _groupVehicles;
			
			// Set group behaviours
			_output pushBack format [
				"_newGroup setFormation '%1'; _newGroup setCombatMode '%2'; _newGroup setBehaviour '%3'; _newGroup setSpeedMode '%4';",
				(formation _x),
				(combatMode _x),
				(behaviour (leader _x)),
				(speedMode _x)];
				
			{
				if (_forEachIndex > 0) then
				{
					_output pushBack format [
						"_newWaypoint = _newGroup addWaypoint [[%1, %2, %3], %4]; _newWaypoint setWaypointType '%5';%6 %7 %8",
						(waypointPosition _x) select 0,
						(waypointPosition _x) select 1,
						(waypointPosition _x) select 2,
						0,
						(waypointType _x),
						if ((waypointSpeed _x) != 'UNCHANGED') then { "_newWaypoint setWaypointSpeed '" + (waypointSpeed _x) + "'; " } else { "" },
						if ((waypointFormation _x) != 'NO CHANGE') then { "_newWaypoint setWaypointFormation '" + (waypointFormation _x) + "'; " } else { "" },
						if ((waypointCombatMode _x) != 'NO CHANGE') then { "_newWaypoint setWaypointCombatMode '" + (waypointCombatMode _x) + "'; " } else { "" }
						];
				};
			} forEach (waypoints _x)
		} forEach _groups;
		
		_text = "";
		{
			diag_log _x;
			_text = _text + _x;
		} forEach _output;
		
		missionNamespace setVariable ['Ares_CopyPaste_Dialog_Text', _text];
		_dialog = createDialog "Ares_CopyPaste_Dialog";
		["Generated SQF from mission objects."] call Ares_fnc_ShowZeusMessage;
	}
] call Ares_fnc_RegisterCustomModule;