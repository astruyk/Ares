if (isNil "Ares_Reinforcement_Mission_Unit_Pools") then
{
	Ares_Reinforcement_Mission_Unit_Pools = [];
};

Ares_Reinforcement_Mission_Unit_Pools pushBack
	[
		"Canadian Armed Forces", // Name of the faction
		west, // The side of the faction
		"CFB_Skins", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
		["B_MRAP_01_F", "B_G_Offroad_01_F", "B_Quadbike_01_F"], // Scouts and unarmed light vehicles
		["B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"], // Armed light vehicles
		["B_Truck_01_transport_F", "B_Truck_01_covered_F"], // Dedicated troop trucks
		["B_APC_Tracked_01_rcws_F", "B_APC_Wheeled_01_cannon_F"], // Armed + Armored Troop Transports
		["CFB_Helo_Griffon_Unarmed", "CFB_Helo_Cyclone"], // Unarmed helicopters
		["CFB_Helo_Griffon"], // Armed helicopters
		["B_Boat_Transport_01_F", "B_G_Boat_Transport_01_F"], // Unarmed boats
		["I_Boat_Armed_01_minigun_F"], // Armed boats
		[
			// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
			["CFB_TW_Soldier_TL", "CFB_TW_Soldier_AR", "CFB_TW_Soldier", "CFB_TW_Soldier_AmmoBearer", "CFB_TW_Soldier_Marksman"],
			["CFB_TW_Soldier_TL", "CFB_TW_Soldier_GL", "CFB_TW_Soldier_MMG", "CFB_TW_Soldier", "CFB_TW_Soldier"]
		]
	];
Ares_Reinforcement_Mission_Unit_Pools pushBack
	[
		"CFB Rebels", // Name of the faction
		east, // The side of the faction
		"CFB_Skins", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
		["O_Quadbike_01_F", "O_G_Offroad_01_armed_F", "CFB_Rebel_Technical", "O_G_Quadbike_01_F"], // Scouts and unarmed light vehicles
		["O_G_Offroad_01_armed_F", "CFB_Rebel_Technical_Armed"], // Armed light vehicles
		["O_Truck_02_transport_F", "O_Truck_02_covered_F"], // Dedicated troop trucks
		[], // Armed + Armored Troop Transports
		[], // Unarmed helicopters
		[], // Armed helicopters
		["O_Boat_Transport_01_F", "O_G_Boat_Transport_01_F"], // Unarmed boats
		[], // Armed boats
		[
			// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
			["CFB_Rebel_SL", "CFB_Rebel_AR", "CFB_Rebel_Soldier", "CFB_Rebel_AR", "CFB_Rebel_Soldier_Lite"],
			["CFB_Rebel_TL", "CFB_Rebel_GL", "CFB_Rebel_Marksman_Lite", "CFB_Rebel_Soldier", "CFB_Rebel_Medic"]
		]
	];
