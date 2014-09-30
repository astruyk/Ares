_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// TODO choose a WP for the vehicle to unload at and send them there.
	_allLzs = allMissionObjects "Ares_Module_Reinforcements_Create_Lz";
	if (count _allLzs > 0) then
	{
		// Choose a vehicle, a squad configuration, and an LZ to head to.
		_vehicleClasses = ["O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F", "O_G_Offroad_01_F"];
		_squads = [
			["O_Soldier_TL_F", "O_Soldier_lite_F", "O_Soldier_lite_F", "O_Soldier_GL_F", "O_soldier_M_F"],
			["O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_A_F", "O_Soldier_GL_F", "O_Soldier_lite_F"]
		];
		_vehicleType = _vehicleClasses call BIS_fnc_selectRandom;
		_squadType = _squads call BIS_fnc_selectRandom;
		_lz = _allLzs call BIS_fnc_selectRandom;

		// Spawn the vehicle and squad and load the units into the vehicle.
		_vehicleGroup = ([position _logic, 0, _vehicleType, east] call BIS_fnc_spawnVehicle) select 2;
		_infantryGroup = [[0, 0, 0], EAST, _squadType] call BIS_fnc_spawnGroup;
		{
			_x moveInCargo (vehicle (leader _vehicleGroup));
		} foreach(units _infantryGroup);
		
		// Send the vehicle to the RP to unload the troops and then return to current location
		_vehicleWp = _vehicleGroup addWaypoint [position _lz, 0];
		[_vehicleGroup, 0] setWaypointType "TR UNLOAD";
		_vehicleGroup addWaypoint [position _logic, 1];
		
		// Get out at the LZ
		_infantryGetOutWp = _infantryGroup addWaypoint [position _lz, 0];
		[_infantryGroup, 0] setWaypointType "GETOUT";
		[_infantryGroup, 0] synchronizeWaypoint [[_vehicleGroup,0]];
		
		// Choose a RP for the squad to head to once unloaded and set their waypoint.
		_allRps = allMissionObjects "Ares_Module_Reinforcements_Create_Rp";
		
		if (count _allRps > 0) then
		{
			_rp = _allRps call BIS_fnc_selectRandom;
			_infantryRallyWp = _infantryGroup addWaypoint [position _rp, 1];
			[_infantryGroup, 1] setWaypointType "DESTROY";
			[objNull, "Transport dispatched to LZ. Squad will head to RP."] call bis_fnc_showCuratorFeedbackMessage;
		}
		else
		{
			[objNull, "Transport dispatched to LZ. Squad will defend LZ."] call bis_fnc_showCuratorFeedbackMessage;
		};
		
		[(units _infantryGroup) + (units _vehicleGroup)] call Ares_fnc_AddUnitsToCurator;
	}
	else
	{
		[objNull, "You must have at least one LZ for the transport to head to."] call bis_fnc_showCuratorFeedbackMessage;
	};

	
	
};
deleteVehicle _logic;
true
