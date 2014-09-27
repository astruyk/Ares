_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// Create the ammo box
	_ammoBox = "Box_NATO_Wps_F" createVehicle (getPos _logic);

	// Remove all the things from the box
	clearWeaponCargoGlobal _ammoBox;
	clearMagazineCargoGlobal _ammoBox;
	clearItemCargoGlobal _ammoBox;

	// Add arsenal to the box
	_availableWeapons = ["arifle_MX_F","arifle_MX_SW_F","arifle_MXC_F"];

	_availableBackpacks = ["B_AssaultPack_rgr"];
	_availableHeadgear = [
		"H_HelmetB",
		"H_HelmetB_camo",
		"H_HelmetB_paint",
		"H_HelmetB_light",
		"H_Booniehat_indp",
		"H_Booniehat_mcamo",
		"H_Booniehat_grn",
		"H_Booniehat_tan",
		"H_Booniehat_dirty",
		"H_Booniehat_khk_hs",
		"H_HelmetB_plain_mcamo",
		"H_HelmetB_plain_blk",
		"H_HelmetSpecB",
		"H_HelmetSpecB_paint1",
		"H_HelmetSpecB_paint2",
		"H_HelmetSpecB_blk",
		"H_HelmetB_grass",
		"H_HelmetB_snakeskin",
		"H_HelmetB_desert",
		"H_HelmetB_black",
		"H_HelmetB_sand",
		"H_PilotHelmetHeli_B",
		"H_CrewHelmetHeli_B",
		"H_MilCap_mcamo",
		"H_MilCap_oucamo",
		"H_MilCap_rucamo",
		"H_MilCap_gry",
		"H_HelmetB_light_grass",
		"H_HelmetB_light_snakeskin",
		"H_HelmetB_light_desert",
		"H_HelmetB_light_black",
		"H_HelmetB_light_sand",
		"H_Beret_blk",
		"H_Beret_red",
		"H_Beret_grn",
		"H_Beret_grn_SF",
		"H_Beret_brn_SF",
		"H_Beret_02",
		"H_Beret_Colonel",
		"H_Watchcap_blk",
		"H_Watchcap_khk",
		"H_Watchcap_camo",
		"H_Watchcap_sgg"
		];
	_availableGoogles = ["G_Combat"];
	_availableUniforms = [
		"U_B_CombatUniform_mcam",
		"U_B_CombatUniform_mcam_tshirt",
		"U_B_CombatUniform_mcam_vest",
		"U_B_HeliPilotCoveralls",
		"U_B_SpecopsUniform_sgg",
		"U_B_PilotCoveralls"
		];
	_availableVests = [];
	_availableWeaponItems = [];
	_availableMagazines = ["30Rnd_65x39_caseless_mag"];

	[_ammoBox, _availableBackpacks, true] call BIS_fnc_addVirtualBackpackCargo;
	[_ammoBox, _availableHeadgear + _availableGoogles + _availableUniforms + _availableVests + _availableWeaponItems, true] call BIS_fnc_addVirtualItemCargo;
	[_ammoBox, _availableMagazines, true] call BIS_fnc_addVirtualMagazineCargo;
	[_ammoBox, _availableWeapons, true] call BIS_fnc_addVirtualWeaponCargo;
	
	["AmmoboxInit", [_ammoBox, false, {true}]] call BIS_fnc_arsenal;
	[[_ammoBox]] call Ares_fnc_AddUnitsToCurator;

	[objNull, "Created basic arsenal ammo box."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true
