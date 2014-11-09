Ares_Reinforcement_Unit_Pools =
[
	[
		"CSAT", // Name of the faction
		east, // The side of the faction
		"", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
		["O_MRAP_02_F", "O_G_Offroad_01_F", "O_Quadbike_01_F"], // Scouts and unarmed light vehicles
		["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F", "O_G_Offroad_01_armed_F"], // Armed light vehicles
		["O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F"], // Dedicated troop trucks
		["O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_F"], // Armed + Armored Troop Transports
		["O_Heli_Light_02_unarmed_F", "O_Heli_Transport_04_bench_F", "O_Heli_Transport_04_covered_F"], // Unarmed helicopters
		["O_Heli_Light_02_F", "O_Heli_Light_02_v2_F"], // Armed helicopters
		["O_Boat_Transport_01_F", "O_G_Boat_Transport_01_F"], // Unarmed boats
		["O_Boat_Armed_01_hmg_F"], // Armed boats
		[
			// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
			["O_Soldier_TL_F", "O_Soldier_lite_F", "O_Soldier_lite_F", "O_Soldier_GL_F", "O_soldier_M_F"],
			["O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_A_F", "O_Soldier_GL_F", "O_Soldier_lite_F"]
		],
		[
			// Amphibious squad setups to load into boats. Note - these may get truncated to fit into empty spaces or small vehicles.
			["O_diver_TL_F", "O_diver_F", "O_diver_F", "O_diver_F", "O_diver_F"]
		]
	],
	[
		"NATO", // Name of the faction
		west, // The side of the faction
		"", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
		["B_MRAP_01_F", "B_G_Offroad_01_F", "B_Quadbike_01_F"], // Scouts and unarmed light vehicles
		["B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"], // Armed light vehicles
		["B_Truck_01_transport_F", "B_Truck_01_covered_F"], // Dedicated troop trucks
		["B_APC_Tracked_01_rcws_F", "B_APC_Wheeled_01_cannon_F"], // Armed + Armored Troop Transports
		["B_Heli_Light_01_F", "B_Heli_Transport_03_unarmed_F"],// Unarmed helicopters
		["B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F", "B_Heli_Transport_03_F"], // Armed helicopters
		["B_Boat_Transport_01_F", "B_G_Boat_Transport_01_F"],// Unarmed boats
		["B_Boat_Armed_01_minigun_F"], // Armed boats
		[
			// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
			["B_Soldier_TL_F", "B_soldier_AR_F", "B_Soldier_lite_F", "B_Soldier_lite_F", "B_Soldier_lite_F"],
			["B_Soldier_TL_F", "B_Soldier_GL_F", "B_Soldier_F", "B_Soldier_lite_F", "B_Soldier_lite_F"]
		],
		[
			// Amphibious squad setups to load into boats. Note - these may get truncated to fit into empty spaces or small vehicles.
			["O_diver_TL_F", "O_diver_F", "O_diver_F", "O_diver_F", "O_diver_F"]
		]
	],
	[
		"AAF", // Name of the faction
		resistance, // The side of the faction
		"", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
		["I_G_Offroad_01_F","I_Quadbike_01_F", "I_MRAP_03_F"], // Scouts and unarmed light vehicles
		["I_G_Offroad_01_armed_F", "I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"], // Armed light vehicles
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
		],
		[
			// Amphibious squad setups to load into boats. Note - these may get truncated to fit into empty spaces or small vehicles.
			["O_diver_TL_F", "O_diver_F", "O_diver_F", "O_diver_F", "O_diver_F"]
		]
	],
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
		],
		[
			// Amphibious squad setups to load into boats. Note - these may get truncated to fit into empty spaces or small vehicles.
			["O_diver_TL_F", "O_diver_F", "O_diver_F", "O_diver_F", "O_diver_F"]
		]
	],
	[
		"RHS Russian Forces (MSV)", // Name of the faction
		east, // The side of the faction
		"RHS_Main", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
		["rhs_tigr_msv", "RHS_UAZ_MSV_01", "rhs_uaz_open_MSV_01"], // Scouts and unarmed light vehicles
		["O_G_Offroad_01_armed_F"], // Armed light vehicles
		["rhs_gaz66_msv", "rhs_gaz66o_msv", "rhs_gaz66_r142_msv", "rhs_typhoon_vdv", "RHS_Ural_MSV_01", "RHS_Ural_Open_MSV_01", "RHS_Ural_VDV_01"], // Dedicated troop trucks
		["rhs_btr70_msv", "rhs_btr60_msv", "rhs_bmp1_XX", "rhs_btr80_msv", "rhs_btr80a_msv"], // Armed + Armored Troop Transports
		["rhs_ka60_grey", "rhs_ka60_c", "RHS_Mi8AMT_vdv", "RHS_Mi8AMT_vvs", "RHS_Mi8AMT_vvsc", "RHS_Mi8mt_vdv", "RHS_Mi8AMT_vvs", "RHS_Mi8AMT_vvsc"], // Unarmed helicopters
		["RHS_Mi24P_vdv", "RHS_Mi8AMTSh_vdv", "RHS_Mi8AMTSh_vvs", "RHS_Mi8AMTSh_vvsc"], // Armed helicopters
		["O_Boat_Transport_01_F", "O_G_Boat_Transport_01_F"], // Unarmed boats
		["B_Boat_Armed_01_minigun_F"], // Armed boats
		[
			// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
			["rhs_msv_junior_sergeant", "rhs_msv_machinegunner", "rhs_msv_machinegunner_assistant", "rhs_msv_efreitor", "rhs_msv_rifleman"],
			["rhs_msv_sergeant", "rhs_msv_grenadier", "rhs_msv_efreitor", "rhs_msv_rifleman", "rhs_msv_marksman"]
		],
		[
			// Amphibious squad setups to load into boats. Note - these may get truncated to fit into empty spaces or small vehicles.
			["O_diver_TL_F", "O_diver_F", "O_diver_F", "O_diver_F", "O_diver_F"]
		]
	],
	[
		"RHS US Forces", // Name of the faction
		west, // The side of the faction
		"RHSUSF_Main", // The name of the root class for the addon that defines these units (must exist or the side will not show up). Use "" to always show.
		["rhsusf_m1025_w", "rhsusf_m1025_d", "rhsusf_m1025_w_s", "rhsusf_m1025_w_s"], // Scouts and unarmed light vehicles
		["rhsusf_m113_usarmy", "rhsusf_m113d_usarmy"], // Armed light vehicles
		["B_Truck_01_transport_F", "B_Truck_01_covered_F"], // Dedicated troop trucks
		["RHS_M2A2_wd", "RHS_M2A2", "RHS_M2A2_BUSKI_wd", "RHS_M2A2_BUSKI", "RHS_M2A3_wd", "RHS_M2A3", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKI", "RHS_M2A3_BUSKIII_wd", "RHS_M2A3_BUSKIII", "RHS_M6_wd", "RHS_M6"], // Armed + Armored Troop Transports
		["rhs_uh60m_mev", "rhs_uh60m_mev_d"], // Unarmed helicopters
		["rhs_ch_47f", "rhs_ch_47f_light", "rhs_uh60m", "rhs_uh60m_d"], // Armed helicopters
		["B_Boat_Transport_01_F", "B_G_Boat_Transport_01_F"], // Unarmed boats
		["I_Boat_Armed_01_minigun_F"], // Armed boats
		[
			// Squad setups to load into vehicles. Note - these may get truncated to fit into empty spaces or small vehicles.
			["rhsusf_army_ocp_squadleader", "rhsusf_army_ocp_machinegunner", "rhsusf_army_ocp_machinegunnera", "rhsusf_army_ocp_riflemanl", "rhsusf_army_ocp_riflemanl"],
			["rhsusf_army_ocp_teamleader", "rhsusf_army_ocp_grenadier", "rhsusf_army_ocp_rifleman", "rhsusf_army_ocp_medic", "rhsusf_army_ocp_marksman"]
		],
		[
			// Amphibious squad setups to load into boats. Note - these may get truncated to fit into empty spaces or small vehicles.
			["O_diver_TL_F", "O_diver_F", "O_diver_F", "O_diver_F", "O_diver_F"]
		]
	]
];
