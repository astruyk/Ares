Ares_Reinforcement_Unit_Pools =
[
	[
		"CSAT", // Name of the faction
		east, // The side of the faction
		"", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
		["O_MRAP_02_F", "O_G_Offroad_01_F", "O_Quadbike_01_F"], // Scouts and unarmed light vehicles
		["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"], // Armed light vehicles
		["O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F"], // Dedicated troop trucks
		["O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_F"], // Armed + Armored Troop Transports
		["O_Heli_Light_02_unarmed_F", "O_Heli_Transport_04_bench_F", "O_Heli_Transport_04_covered_F"], // Unarmed helicopters
		["O_Heli_Light_02_F", "O_Heli_Light_02_v2_F"], // Armed helicopters
		["O_Boat_Transport_01_F", "O_G_Boat_Transport_01_F"], // Unarmed boats
		["O_Boat_Armed_01_hmg_F"], // Armed boats
		[
			// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
			["O_Soldier_TL_F", "O_Soldier_GL_F", "O_Soldier_F", "O_Soldier_lite_F", "O_soldier_M_F"],
			["O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_A_F", "O_Soldier_GL_F", "O_Soldier_F"]
		]
	],
	[
		"NATO", // Name of the faction
		west, // The side of the faction
		"", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
		["B_MRAP_01_F", "B_G_Offroad_01_F", "B_Quadbike_01_F"], // Scouts and unarmed light vehicles
		["B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F"], // Armed light vehicles
		["B_Truck_01_transport_F", "B_Truck_01_covered_F"], // Dedicated troop trucks
		["B_APC_Tracked_01_rcws_F", "B_APC_Wheeled_01_cannon_F"], // Armed + Armored Troop Transports
		["B_Heli_Light_01_F", "B_Heli_Transport_03_unarmed_F"],// Unarmed helicopters
		["B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F", "B_Heli_Transport_03_F"], // Armed helicopters
		["B_Boat_Transport_01_F", "B_G_Boat_Transport_01_F"],// Unarmed boats
		["B_Boat_Armed_01_minigun_F"], // Armed boats
		[
			// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
			["B_Soldier_TL_F", "B_soldier_AR_F", "B_Soldier_A_F", "B_Soldier_F", "B_Soldier_lite_F"],
			["B_Soldier_TL_F", "B_Soldier_GL_F", "B_soldier_M_F", "B_Soldier_F", "B_Soldier_lite_F"]
		]
	],
	[
		"AAF", // Name of the faction
		resistance, // The side of the faction
		"", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
		["I_G_Offroad_01_F","I_Quadbike_01_F", "I_MRAP_03_F"], // Scouts and unarmed light vehicles
		["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"], // Armed light vehicles
		["I_Truck_02_covered_F", "I_Truck_02_transport_F"], // Dedicated troop trucks
		["I_APC_tracked_03_cannon_F", "I_APC_Wheeled_03_cannon_F"], // Armed + Armored Troop Transports
		["I_Heli_Transport_02_F", "I_Heli_light_03_unarmed_F"], // Unarmed helicopters
		["I_Heli_light_03_F"], // Armed helicopters
		["I_Boat_Transport_01_F", "I_G_Boat_Transport_01_F"], // Unarmed boats
		["I_Boat_Armed_01_minigun_F"], // Armed boats
		[
			// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
			["I_Soldier_SL_F", "I_Soldier_AR_F", "I_Soldier_A_F", "I_Soldier_lite_F", "I_Soldier_lite_F"],
			["I_Soldier_TL_F", "I_Soldier_GL_F", "I_soldier_F", "I_soldier_F", "I_Soldier_lite_F"]
		]
	]
];
