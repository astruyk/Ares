/*
	Adds custom Ares spawns for some CAF_AG groups.
	
	Usage in init.sqf:
	[] execVM "Ares_Add_CAF_AG_Units.sqf";
	
	Requires "Ares_CreateCustomMissionObject.sqf" script to be available.
*/

Spawn_Caf_Ag_Group = 
{
	_position = _this select 0;
	_numberOfUnits = _this select 1;
	
	_units = [];
	_group = createGroup east;
	for "_i" from 1 to _numberOfUnits do
	{
		_unitType = ["CAF_AG_ME_T_AK47", "CAF_AG_ME_T_AK74", "CAF_AG_ME_T_PKM", "CAF_AG_ME_T_RPG", "CAF_AG_ME_T_GL", "CAF_AG_ME_T_SVD", "CAF_AG_ME_T_RPK74"] call BIS_fnc_selectRandom;
		_unit = _group createUnit [_unitType, _position, [],  0, "FORM"];
		_units pushBack _unit;
	};
	_units;
};

[
	[
		"CAF Agressors - Spawn Lone Unit",
		{
			_units = [(_this select 0), 1] call Spawn_Caf_Ag_Group;
			_units;
		}
	],
	[
		"CAF Agressors - Spawn 2-Man Group",
		{
			_units = [(_this select 0), 2] call Spawn_Caf_Ag_Group;
			_units;
		}
	],
	[
		"CAF Agressors - Spawn 4-Man Group",
		{
			_units = [(_this select 0), 4] call Spawn_Caf_Ag_Group;
			_units;
		}
	],
	[
		"CAF Agressors - Spawn 6-Man Group",
		{
			_units = [(_this select 0), 6] call Spawn_Caf_Ag_Group;
			_units;
		}
	],
	[
		"CAF Agressors - Spawn 10-Man Group",
		{
			_units = [(_this select 0), 10] call Spawn_Caf_Ag_Group;
			_units;
		}
	],
	[
		"Delete Units Within 10m",
		{
			_objects = nearestObjects [(_this select 0), ["AllVehicles"], 10];
			{
				deleteVehicle _x;
			} forEach _objects;
			[];
		}
	],
	[
		"Delete Units Within 100m",
		{
			_objects = nearestObjects [(_this select 0), ["AllVehicles"], 100];
			{
				deleteVehicle _x;
			} forEach _objects;
			[];
		}
	]
] execVM "Ares_CreateCustomMissionObject.sqf";