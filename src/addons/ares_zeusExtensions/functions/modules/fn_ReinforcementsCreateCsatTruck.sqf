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
		_allRps = allMissionObjects "Ares_Module_Reinforcements_Create_Rp";

		// Choose an LZ to unload at.
		_lz = _allLzs call BIS_fnc_selectRandom;

		// Spawn a vehicle, send it to the LZ and have it unload the troops before returning home and
		// deleting itself.
		_vehicleGroup = ([position _logic, 0, ( _vehicleClasses call BIS_fnc_selectRandom), east] call BIS_fnc_spawnVehicle) select 2;
		_vehicleDummyWp = _vehicleGroup addWaypoint [position _vehicle, 0];
		_vehicleUnloadWp = _vehicleGroup addWaypoint [position _lz, 0];
		_vehicleUnloadWp setWaypointType "TR UNLOAD";
		_vehicleReturnWp = _vehicleGroup addWaypoint [position _logic, 0];
		_vehicleReturnWp setWaypointStatements ["true", "deleteVehicle (vehicle this); {deleteVehicle _x} foreach thisList;"];

		// Spawn the units and load them into the vehicle
		_squadType = _squads call BIS_fnc_selectRandom;
		_freeSpace = (vehicle _vehicleGroup) emptyPositions "Cargo";
		if (_freeSpace < count _squadType) then
		{
			// Trim the squad size so they will fit.
			_squadType resize _freeSpace;
		};
		_infantryGroup = [[0, 0, 0], EAST, _squadType] call BIS_fnc_spawnGroup;
		{
			_x moveInCargo (vehicle (leader _vehicleGroup));
		} foreach(units _infantryGroup);

		// Get out at the LZ
		_infantryUnloadWP = _infantryGroup addWaypoint [position _lz, 0];
		_infantryUnloadWP setWaypointType "GETOUT";
		_infantryUnloadWP synchronizeWaypoint [_vehicleUnloadWp];
		
		// Choose a RP for the squad to head to once unloaded and set their waypoint.
		if (count _allRps > 0) then
		{
			_rp = _allRps call BIS_fnc_selectRandom;
			_infantryRpWp = _infantryGroup addWaypoint [position _rp, 0];
			[objNull, "Transport dispatched to LZ. Squad will head to RP."] call bis_fnc_showCuratorFeedbackMessage;
		}
		else
		{
			_infantryMoveOnWp = _infantryGroup addWaypoint [position _lz, 20];
			[objNull, "Transport dispatched to LZ. Squad will defend LZ."] call bis_fnc_showCuratorFeedbackMessage;
		};
		
		[(units _infantryGroup) + (units _vehicleGroup) + [(vehicle (leader _vehicleGroup))]] call Ares_fnc_AddUnitsToCurator;
	}
	else
	{
		[objNull, "You must have at least one LZ for the transport to head to."] call bis_fnc_showCuratorFeedbackMessage;
	};
};
deleteVehicle _logic;
true
