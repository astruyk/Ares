#define DISPLAY_NAME_INDEX 0
#define SIDE_INDEX 1
#define ADDON_CLASS_INDEX 2
#define VEHICLE_POOL_START_INDEX 3
#define SCOUT_UNIT_POOL_INDEX 3
#define UNARMED_HELO_UNIT_POOL_INDEX 7
#define ARMED_HELO_UNIT_POOL_INDEX 8
#define UNARMED_BOAT_UNIT_POOL_INDEX 9
#define ARMED_BOAT_UNIT_POOL_INDEX 10
#define INFANTRY_UNIT_POOL_INDEX 11
#define DIVER_UNIT_POOL_INDEX 12

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

scopeName "main";
if (_activated && local _logic) then
{
	if (isNil "Ares_Reinforcement_Unit_Pools"
		|| isNull Ares_Reinforcement_Unit_Pools
		|| typeName Ares_Reinforcement_Unit_Pools != typeName []
		|| count Ares_Reinforcement_Unit_Pools == 0) then
	{
		[objNull, "Unable to load unit pools. Is your 'Ares_Reinforcement_Unit_Pools.sqf' file corrupt?"] call bis_fnc_showCuratorFeedbackMessage;
		breakTo "main";
	};
	
	_allLzs = allMissionObjects "Ares_Module_Reinforcements_Create_Lz";
	if (count _allLzs == 0) then
	{
		[objNull, "You must have at least one LZ for the transport to head to."] call bis_fnc_showCuratorFeedbackMessage;
		breakTo "main";
	};
	
	// Generate list of pool names to let user choose from
	_poolNames = [];
	{
		_poolNames pushBack (_x select DISPLAY_NAME_INDEX);
	} forEach Ares_Reinforcement_Unit_Pools;
	
	// Show the user the dialog
	_dialogResult = ["Create Reinforcements",
		[
			["Side", _poolNames, 0],
			["Vehicle Type", ["Unarmed Light Vehicles + Scouts", "Armed Light Vehicles", "Dedicated Troop Trucks", "APC's & Heavy Troop Transports", "Unarmed Aircraft", "Light Armed Aircraft", "Unarmed Boats", "Armed Boats"]],
			["Vehicle Behaviour After Dropoff", ["RTB and Despawn", "Stay at LZ"]],
			["Vehicle Landing Zone", ["Random", "Nearest", "Farthest", "Least Used"]],
			["Unit Rally Point", ["Random", "Nearest", "Farthest", "Least Used"]]
		]
	] call Ares_fnc_ShowChooseDialog;

	if (count _dialogResult == 0) then
	{
		// The user chose 'Cancel'. We should abort.
		breakTo "main";
	};

	// Get the data from the dialog to use when choosing what units to spawn
	_dialogPool =             _dialogResult select 0;
	_dialogVehicleClass =     _dialogResult select 1;
	_dialogVehicleBehaviour = _dialogResult select 2;
	_dialogLzAlgorithm =      _dialogResult select 3;
	_dialogRpAlgorithm =      _dialogResult select 4;
	_lzSize = 20;	// TODO make this a dialog parameter?
	_rpSize = 20;	// TODO make this a dialog parameters?
	_spawnPosition = position _logic;
	if (not isNil "Ares_CuratorObjectPlaces_LastPlacedObjectPosition") then
	{
		_spawnPosition = Ares_CuratorObjectPlaces_LastPlacedObjectPosition;
	};
	
	// Lz's for helicopters get more randomness because they tend to crash into eachother.
	if (_dialogVehicleClass == UNARMED_HELO_UNIT_POOL_INDEX || _dialogVehicleClass == ARMED_HELO_UNIT_POOL_INDEX) then
	{
		_lzSize = 150;
	};

	[format ["Dialog results: Side=%1, VehicleType=%2, Behaviour=%3, LzAlgorithm=%4, RpAlgorithm=%5", _dialogSide, _dialogVehicleClass, _dialogVehicleBehaviour, _dialogLzAlgorithm, _dialogRpAlgorithm]] call Ares_fnc_LogMessage;

	// Choose an LZ to unload at.
	_lz = _allLzs call BIS_fnc_selectRandom;
	
	// Choose the LZ based on the chosen behaviour
	if (_dialogLzAlgorithm == 1) then
	{
		// Nearest
		_lz = [_spawnPosition, _allLzs] call Ares_fnc_GetNearest;
	};
	if (_dialogLzAlgorithm == 2) then
	{
		// Farthest
		_lz = [_spawnPosition, _allLzs] call Ares_fnc_GetFarthest;
	};
	if (_dialogLzAlgorithm == 3) then
	{
		// Least used
		{
			if (_x getVariable ["Ares_Lz_Count", 0] < _lz getVariable ["Ares_Lz_Count", 0]) then
			{
				_lz = _x;
			};
		} forEach _allLzs;
	};
	
	// Now that we've chosen an LZ, increment the count for it.
	_lz setVariable ["Ares_Lz_Count", (_lz getVariable ["Ares_Lz_Count", 0]) + 1];

	// Get the unit pool and the side it's associated with
	_pool = Ares_Reinforcement_Unit_Pools select _dialogPool;
	_side = _pool select SIDE_INDEX;

	// Spawn a vehicle, send it to the LZ and have it unload the troops before returning home and
	// deleting itself.
	_vehicleType = (_pool select (_dialogVehicleClass + VEHICLE_POOL_START_INDEX)) call BIS_fnc_selectRandom;
	_vehicleGroup = ([_spawnPosition, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle) select 2;

	_vehicleDummyWp = _vehicleGroup addWaypoint [position _vehicle, 0];
	_vehicleUnloadWp = _vehicleGroup addWaypoint [position _lz, _lzSize];
	_vehicleUnloadWp setWaypointType "TR UNLOAD";
	
	// Make the driver full skill. This makes him less likely to do dumb things
	// when they take contact.
	(driver (vehicle (leader _vehicleGroup))) setSkill 1;
	
	if (_dialogVehicleClass == UNARMED_HELO_UNIT_POOL_INDEX || _dialogVehicleClass == ARMED_HELO_UNIT_POOL_INDEX) then 
	{
		// Special settings for helicopters. Otherwise they tend to run away instead of land
		// if the LZ is hot.
		{
			_x allowFleeing 0; // Especially for helos... They're very cowardly.
		} forEach (crew (vehicle (leader _vehicleGroup)));
		_vehicleUnloadWp setWaypointTimeout [0,0,0];
	}
	else
	{
		_vehicleUnloadWp setWaypointTimeout [5,10,20]; // Give the units some time to get away from truck
	};
	
	// Generate the waypoints for after the transport drops off the troops.
	if (_dialogVehicleBehaviour == 0) then
	{
		// RTB and despawn.
		_vehicleReturnWp = _vehicleGroup addWaypoint [_spawnPosition, 0];
		_vehicleReturnWp setWaypointTimeout [2,2,2]; // Let the unit stop before being despawned.
		_vehicleReturnWp setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} foreach thisList;"];
	};
	if (_dialogVehicleBehaviour == 1) then
	{
		// Nothing to do. Vehicle will sit tight.
	};
	
	// Add vehicle to curator
	 [(units _vehicleGroup) + [(vehicle (leader _vehicleGroup))]] call Ares_fnc_AddUnitsToCurator;

	// Define this once.. Before spawning troops.
	_allRps = allMissionObjects "Ares_Module_Reinforcements_Create_Rp";

	// Spawn the units and load them into the vehicle
	_vehicle = vehicle (leader _vehicleGroup);
	_maxCargoSpacesToLeaveEmpty = 3;
	if (_dialogVehicleClass == SCOUT_UNIT_POOL_INDEX) then
	{
		// Light vehicles shouldn't leave empty seats, otherwise they often won't have any units at all.
		_maxCargoSpacesToLeaveEmpty = 0;
	};
	while { (_vehicle emptyPositions "Cargo") > _maxCargoSpacesToLeaveEmpty }
	do
	{
		private ["_squadMembers"];
		if (_dialogVehicleClass == UNARMED_BOAT_UNIT_POOL_INDEX || _dialogVehicleClass == ARMED_BOAT_UNIT_POOL_INDEX) then
		{
			_squadMembers = (_pool select INFANTRY_UNIT_POOL_INDEX) call BIS_fnc_selectRandom;
		}
		else
		{
			_squadMembers = (_pool select DIVER_UNIT_POOL_INDEX) call BIS_fnc_selectRandom;
		};
		_freeSpace = (vehicle (leader _vehicleGroup)) emptyPositions "Cargo";
		if (_freeSpace < count _squadMembers) then
		{
			// Trim the squad size so they will fit.
			_squadMembers resize _freeSpace;
		};
		
		// Spawn the squad members.
		_infantryGroup = [_spawnPosition, _side, _squadMembers] call BIS_fnc_spawnGroup;

		// Choose a RP for the squad to head to once unloaded and set their waypoint.
		if (count _allRps > 0) then
		{
			_rp = _allRps call BIS_fnc_selectRandom;

			// Choose the RP based on the algorithm chosen
			if (_dialogRpAlgorithm == 1) then
			{
				_rp = [position _lz, _allRps] call Ares_fnc_GetNearest;
			};
			if (_dialogRpAlgorithm == 2) then
			{
				_rp = [position _lz, _allRps] call Ares_fnc_GetFarthest;
			};
			if (_dialogRpAlgorithm == 3) then
			{
				// Least used
				{
					if (_x getVariable ["Ares_Rp_Count", 0] < _rp getVariable ["Ares_Rp_Count", 0]) then
					{
						_rp = _x;
					};
				} forEach _allRps;
			};

			// Now that we've chosen an RP, increment the count for it.
			_rp setVariable ["Ares_Rp_Count", (_rp getVariable ["Ares_Rp_Count", 0]) + 1];
			
			_infantryRpWp = _infantryGroup addWaypoint [position _rp, _rpSize];
		}
		else
		{
			_infantryMoveOnWp = _infantryGroup addWaypoint [position _lz, _rpSize];
		};
		
		// Load the units into the vehicle.
		{
			_x moveInCargo (vehicle (leader _vehicleGroup));
		} foreach(units _infantryGroup);
		
		// Add infantry to curator
		[(units _infantryGroup)] call Ares_fnc_AddUnitsToCurator;
	};
	
	if (count _allRps > 0) then
	{
		[objNull, "Transport dispatched to LZ. Squad will head to RP."] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		[objNull, "Transport dispatched to LZ. Squad will stay at LZ."] call bis_fnc_showCuratorFeedbackMessage;
	};
};
deleteVehicle _logic;
true
