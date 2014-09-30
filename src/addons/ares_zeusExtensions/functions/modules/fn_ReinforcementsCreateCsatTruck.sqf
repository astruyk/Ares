_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_vehicleClasses = ["O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F", "O_G_Offroad_01_F", "O_MRAP_02_F"];
	_squads = [
		["O_Soldier_TL_F", "O_Soldier_lite_F", "O_Soldier_lite_F", "O_Soldier_GL_F", "O_soldier_M_F"],
		["O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_A_F", "O_Soldier_GL_F", "O_Soldier_lite_F"]
	];
	
	_vehicleType = _vehicleClasses call BIS_fnc_selectRandom;
	_squadType = _squads call BIS_fnc_selectRandom;
	
	_vehicle = _vehicleType createVehicle (position _logic);
	_squad = [[0, 0, 0], EAST, _chosenSquad] call BIS_fnc_spawnGroup;
	{
		_x moveInCargo _vehicle;
	} foreach(units _squad);

	// TODO choose a WP for the vehicle to unload at and send them there.
	// TODO choose a RP for the squad to head to once unlocked and set their waypoint.
	
	[objNull, "Created LZ"] call bis_fnc_showCuratorFeedbackMessage;
};
deleteVehicle _logic;
true
