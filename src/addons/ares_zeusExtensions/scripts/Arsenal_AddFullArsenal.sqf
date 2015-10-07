[
	"Arsenal",
	"Add Full Arsenal",
	{
		_ammoBox = _this select 1;
		if (isNull _ammoBox) then
		{
			_ammoBox = "B_supplyCrate_F" createVehicle (_this select 0);
			clearWeaponCargoGlobal _ammoBox;
			clearMagazineCargoGlobal _ammoBox;
			clearItemCargoGlobal _ammoBox;
			clearBackpackCargoGlobal _ammoBox;
			[[_ammoBox]] call Ares_fnc_AddUnitsToCurator;
		};
		["AmmoboxInit", [_ammoBox, true]] spawn BIS_fnc_arsenal;
		["Arsenal Added"] call Ares_fnc_ShowZeusMessage;
	}
] call Ares_fnc_RegisterCustomModule;