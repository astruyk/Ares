[
	"Arsenal",
	"Add Arsenal Ammo",
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
		
		_allMagazines = (configFile >> "CfgMagazines") call BIS_fnc_getCfgSubClasses;
		_magazines = [];
		{
			_config = configFile >> "CfgMagazines" >> _x;
			_scope = getNumber (_config >> "scope");
			if (_scope >= 2) then
			{
				_magazines pushBack _x;
			};
		} forEach _allMagazines;
		
		[_ammoBox, [[], [], _magazines, []]] call Ares_fnc_ArsenalSetup;
		["Arsenal Ammo Added"] call Ares_fnc_ShowZeusMessage;
	}
] call Ares_fnc_RegisterCustomModule;
