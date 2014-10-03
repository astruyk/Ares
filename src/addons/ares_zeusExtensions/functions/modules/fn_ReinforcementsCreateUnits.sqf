_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// TODO choose a WP for the vehicle to unload at and send them there.
	_allLzs = allMissionObjects "Ares_Module_Reinforcements_Create_Lz";
	if (count _allLzs > 0) then
	{
		// Show the dialog to let the user choose options.
		_dialog = createDialog "Ares_Reinforcement_Dialog";
		
		// Add Side options
		lbAdd [2100, "NATO"];
		lbAdd [2100, "CSAT"];
		lbAdd [2100, "AAF"];
		lbSetCurSel  [2100, missionNamespace getVariable ["Ares_ReinforcementDialog_LastSelected_Side", 1]];
		
		// Add Vehicle Type options
		lbAdd [2101, "Unarmed Light Vehicles + Scouts"];
		lbAdd [2101, "Armed Light Vehicles"];
		lbAdd [2101, "Dedicated Troop Trucks"];
		lbAdd [2101, "APC's & Heavy Troop Transports"];
		lbAdd [2101, "Unarmed Aircraft"];
		lbAdd [2101, "Light Armed Aircraft"];
		lbSetCurSel  [2101, missionNamespace getVariable ["Ares_ReinforcementDialog_LastSelected_VehicleType", 2]];
		
		// Add vehicle behaviours
		lbAdd [2102, "RTB and Despawn"];
		lbAdd [2102, "Stay at LZ"];
		lbSetCurSel  [2102, missionNamespace getVariable ["Ares_ReinforcementDialog_LastSelected_VehicleBehaviour", 0]];
		
		// Add LZ choosing algorithms
		lbAdd [2103, "Random"];
		lbAdd [2103, "Nearest"];
		lbSetCurSel  [2103, missionNamespace getVariable ["Ares_ReinforcementDialog_LastSelected_Lz_Algorithm", 0]];

		// Add RP choosing algorithms
		lbAdd [2104, "Random"];
		lbAdd [2104, "Nearest"];
		lbSetCurSel  [2104, missionNamespace getVariable ["Ares_ReinforcementDialog_LastSelected_Rp_Algorithm", 0]];

		waitUntil { !dialog; };
		_dialogResult = missionNamespace getVariable ["Ares_ReinforcementDialog_Result", -1];
		
		if (_dialogResult == 1) then
		{
			// The user chose 'OK'. We should spawn stuff.
		
			// Side indexes are used to lookup things in the tables
			
			
			// Data can be accessed as follows:
			// (((_data select <sideIndex>) select <dataTypeIndex>) select <specificDataOrArray>
			// Where <sideIndex> is the index of the side you want (0=NATO, 1=CSAT, 2=AAF)
			// Where <dataTypeIndex> is the type of data you want (0 = Vehicle Classes, 1 = Squad Setups)
			// Where <specificDataOrArray> is an index into the data type (varies with data).
			_data =
			[
				[	// 0 - NATO
					[	// 0 - Vehicle Classes
						[	// 0 - Unarmed Light (recon) vehicles & Trucks
							"B_MRAP_01_F", "B_G_Offroad_01_F", "B_Quadbike_01_F"
						],
						[	// 1 - Armed Light (recon) vehicles & Trucks
							"B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"
						],
						[	// 2 - Dedicated Troop Transports
							"B_Truck_01_transport_F", "B_Truck_01_covered_F"
						],
						[	// 3 - Armed + Armoured Troop Transports
							"B_APC_Tracked_01_rcws_F", "B_APC_Wheeled_01_cannon_F"
						],
						[	// 4 - Unarmed Aircraft
							"B_Heli_Light_01_F"
						],
						[	// 5 - Armed Transport Aircraft
							"B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F"
						]
					],
					[	// 1 - Squad Sets
						["B_Soldier_TL_F", "B_soldier_AR_F", "B_Soldier_lite_F", "B_Soldier_lite_F", "B_Soldier_lite_F"],
						["B_Soldier_TL_F", "B_Soldier_GL_F", "B_Soldier_F", "B_Soldier_lite_F", "B_Soldier_lite_F"]
					]
				],
				
				[	// 1 - CSAT
					[	// 0 - Vehicle Classes
						[	// 0 - Unarmed Light (recon) vehicles & Trucks
							"O_MRAP_02_F", "O_G_Offroad_01_F", "O_Quadbike_01_F"
						],
						[	// 1 - Armed Light (recon) vehicles & Trucks
							"O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F", "O_G_Offroad_01_armed_F"
						],
						[	// 2 - Dedicated Troop Transports
							"O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F"
						],
						[	// 3 - Armed + Armoured Troop Transports
							"O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_F"
						],
						[	// 4 - Unarmed Aircraft
							"O_Heli_Light_02_unarmed_F"
						],
						[	// 5 - Armed Transport Aircraft
							"O_Heli_Light_02_F"
						]
					],
					[	// 1 - Squad Sets
						["O_Soldier_TL_F", "O_Soldier_lite_F", "O_Soldier_lite_F", "O_Soldier_GL_F", "O_soldier_M_F"],
						["O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_A_F", "O_Soldier_GL_F", "O_Soldier_lite_F"]
					]
				],
				
				[	// 2 - AAF
					[	// Vehicle Classes
						[	// 0 - Unarmed Light (recon) vehicles & Trucks
							"I_G_Offroad_01_F","I_Quadbike_01_F", "I_MRAP_03_F"
						],
						[	// 1 - Armed Light (recon) vehicles & Trucks
							"I_G_Offroad_01_armed_F", "I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"
						],
						[	// 2 - Dedicated Troop Transports
							"I_Truck_02_covered_F", "I_Truck_02_transport_F"
						],
						[	// 3 - Armed + Armoured Troop Transports
							"I_APC_tracked_03_cannon_F", "I_APC_Wheeled_03_cannon_F"
						],
						[	// 4 - Unarmed Aircraft
							"I_Heli_Transport_02_F", "I_Heli_light_03_unarmed_F"
						],
						[	// 5 - Armed Transport Aircraft
							"I_Heli_light_03_F"
						]
					],
					[	// 1 - Squad Sets
						["I_Soldier_SL_F", "I_Soldier_AR_F", "I_Soldier_A_F", "I_Soldier_lite_F", "I_Soldier_lite_F"],
						["I_Soldier_TL_F", "I_Soldier_GL_F", "I_soldier_F", "I_soldier_F", "I_Soldier_lite_F"]
					]
				]
			];
		
			// Get the data from the dialog to use when choosing what units to spawn
			_dialogSide =             missionNamespace getVariable ["Ares_ReinforcementDialog_Selected_Side", -1];
			_dialogVehicleClass =     missionNamespace getVariable ["Ares_ReinforcementDialog_Selected_VehicleType", -1];
			_dialogVehicleBehaviour = missionNamespace getVariable ["Ares_ReinforcementDialog_Selected_VehicleBehaviour", -1];
			_dialogLzAlgorithm =      missionNamespace getVariable ["Ares_ReinforcementDialog_Selected_Lz_Algorithm", -1];
			_dialogRpAlgorithm =      missionNamespace getVariable ["Ares_ReinforcementDialog_Selected_Rp_Algorithm", -1];
			_lzSize = 20;	// TODO make this a dialog parameter.
			_rpSize = 20;	// TODO make this a dialog parameters.
			
			// Save the chosen values for next time the dialog is shown.
			missionNamespace setVariable ["Ares_ReinforcementDialog_LastSelected_Side", _dialogSide];
			missionNamespace setVariable ["Ares_ReinforcementDialog_LastSelected_VehicleType", _dialogVehicleClass];
			missionNamespace setVariable ["Ares_ReinforcementDialog_LastSelected_VehicleBehaviour", _dialogVehicleBehaviour];
			missionNamespace setVariable ["Ares_ReinforcementDialog_LastSelected_Lz_Algorithm", _dialogLzAlgorithm];
			missionNamespace setVariable ["Ares_ReinforcementDialog_LastSelected_Rp_Algorithm", _dialogRpAlgorithm];
			
			[format ["Dialog results: Side=%1, VehicleType=%2, Behaviour=%3, LzAlgorithm=%4, RpAlgorithm=%5", _dialogSide, _dialogVehicleClass, _dialogVehicleBehaviour, _dialogLzAlgorithm, _dialogRpAlgorithm]] call Ares_fnc_LogMessage;

			// Convert into a usable value
			_side = west;
			if (_dialogSide == 1) then { _side = east; };
			if (_dialogSide == 2) then { _side = resistance; };
			
			// Choose an LZ to unload at.
			_lz = _allLzs call BIS_fnc_selectRandom;
			
			// Choose the nearest LZ to the spawn point if that behaviour was chosen.
			if (_dialogLzAlgorithm == 1) then
			{
				{
					if (_lz distance _x < _lz distance (position _logic)) then
					{
						_lz = _x;
					};
				} forEach _allLzs;
			};

			// Spawn a vehicle, send it to the LZ and have it unload the troops before returning home and
			// deleting itself.
			_vehicleType = (((_data select _dialogSide) select 0) select _dialogVehicleClass) call BIS_fnc_selectRandom;
			_vehicleGroup = ([position _logic, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle) select 2;

			_vehicleDummyWp = _vehicleGroup addWaypoint [position _vehicle, 0];
			_vehicleUnloadWp = _vehicleGroup addWaypoint [position _lz, _lzSize];
			_vehicleUnloadWp setWaypointType "TR UNLOAD";
			if (_dialogVehicleClass == 4 || _dialogVehicleClass == 5) then 
			{
				// Special settings for helicopters. Otherwise they tend to run away instead of land
				// if the LZ is hot.
				_vehicleGroup allowFleeing 0; // Especially for helos... They're very cowardly.
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
				_vehicleReturnWp = _vehicleGroup addWaypoint [position _logic, 0];
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
			while	{
					((vehicle (leader _vehicleGroup)) emptyPositions "Cargo") >= 3 // Don't try to fill in slots with a squad if there are less than 3 spaces
					|| (_dialogVehicleClass == 0 && ((vehicle (leader _vehicleGroup)) emptyPositions "Cargo") > 0) // ... unless this is a light vehicle (and so will have fewer positions total)
					}
			do
			{
				_squadType = ((_data select _dialogSide) select 1) call BIS_fnc_selectRandom;
				_freeSpace = (vehicle (leader _vehicleGroup)) emptyPositions "Cargo";
				if (_freeSpace < count _squadType) then
				{
					// Trim the squad size so they will fit.
					_squadType resize _freeSpace;
				};
				
				_infantryGroup = [[0, 0, 0], _side, _squadType] call BIS_fnc_spawnGroup;
				{
					_x moveInCargo (vehicle (leader _vehicleGroup));
				} foreach(units _infantryGroup);

				// Get out at the LZ
				_infantryUnloadWP = _infantryGroup addWaypoint [(getWpPos _vehicleUnloadWp), 0];
				_infantryUnloadWP setWaypointType "GETOUT";
				_infantryUnloadWP synchronizeWaypoint [_vehicleUnloadWp];

				// Choose a RP for the squad to head to once unloaded and set their waypoint.
				if (count _allRps > 0) then
				{
					_rp = _allRps call BIS_fnc_selectRandom;

					// Choose the nearest RP to the LZ instead if that behaviour was selected.
					if (_dialogRpAlgorithm == 1) then
					{
						{
							if (_lz distance _x < _lz distance _rp) then
							{
								_rp = _x;
							};
						} forEach _allRps;
					};
					
					_infantryRpWp = _infantryGroup addWaypoint [position _rp, _rpSize];
				}
				else
				{
					_infantryMoveOnWp = _infantryGroup addWaypoint [position _lz, _rpSize];
				};
				
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
		}
		else
		{
			// The user chose 'Cancel'. We should abort.
		};
	}
	else
	{
		[objNull, "You must have at least one LZ for the transport to head to."] call bis_fnc_showCuratorFeedbackMessage;
	};
};
deleteVehicle _logic;
true
