/*
	Transfers ownership for all groups to the server

	Parameters:
		0: Specific group or objNull for all groups (default objNull)
		1: Bool - show debug output (optional, default false)
*/
params[["_group", grpNull, [grpNull]], ["_debugOn", false, [false]]];

// Require this function
if (isNil "Ares_ChangeOwnerToServerFunction") then
{
	Ares_ChangeOwnerToServerFunction =
	{
		params[["_groups", grpNull, [grpNull]], ["_debugOn", false, [false]]];

		if (isNull _groups) then
		{
			_groups = allGroups;
		}
		else
		{
			_groups = [_groups]; // Make an array of this one
		};

		// Loop all groups
		{
			// Check if group is owned by the server or not
			if ((groupOwner _x) != 2) then
			{
				_playerInGroup = false;
				{
					if (isPlayer _x) exitWith { _playerInGroup = true; };
				} forEach (units _x);

				// Transfer group if no players are part of the group
				if (!_playerInGroup) then
				{
					_x setGroupOwner 2;
					if (_debugOn) then
					{
						_debugTxt = format ["[ARES] Changing owner to server for %1", _x];
						if (isDedicated) then
						{
							diag_log _debugTxt;
						}
						else
						{
							systemChat _debugTxt;
						};
					};
				};
			};
		} foreach _groups;
	};
	publicVariable "Ares_ChangeOwnerToServerFunction";
};

[[_group, _debugOn], "Ares_ChangeOwnerToServerFunction", false] call BIS_fnc_MP;
