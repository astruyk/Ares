_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// Create the ammo box
	_ammoBox = "Box_NATO_Wps_F" createVehicle (getPos _logic);

	// Add some items to arsenal.
	["AmmoBoxInit", [_ammoBox, false]] call BIS_fnc_arsenal;
	
	_availableBackpacks = ["B_AssaultPack_rgr"];
	_availableHeadgear = ["H_HelmetB"];
	_availableGoogles = ["G_Combat"];
	_availableUniforms = ["U_B_CombatUniform_mcam"];
	_availableVests = [];
	_availableWeaponItems = [];
	_availableMagazines = ["30Rnd_65x39_caseless_mag"];
	_availableWeapons = ["arifle_MX_F","arifle_MX_SW_F","arifle_MXC_F"];
	
	[_ammoBox, _availableBackpacks, true] call BIS_fnc_addVirtualBackpackCargo;
	[_ammoBox, _availableHeadgear + _availableGoogles + _availableUniforms + _availableVests + _availableWeaponItems, true] call BIS_fnc_addVirtualItemCargo;
	[_ammoBox, _availableMagazines, true] call BIS_fnc_addVirtualMagazineCargo;
	[_ammoBox, _availableWeapons, true] call BIS_fnc_addVirtualWeaponCargo;


	[[_ammoBox]] call Ares_fnc_AddUnitsToCurator;

	[objNull, "Created basic arsenal ammo box."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true
