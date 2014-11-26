if (isNil "Ares_Reinforcement_Mission_Unit_Pools") then
{
	Ares_Reinforcement_Mission_Unit_Pools = [];
};

Ares_Reinforcement_Mission_Unit_Pools pushBack
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
		]
	];
Ares_Reinforcement_Mission_Unit_Pools pushBack
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
		]
	];
