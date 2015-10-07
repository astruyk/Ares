[
	"Arsenal",
	"Paste From Clipboard",
	{
		_ammoBox = _this select 1;
		Ares_CopyPaste_Dialog_Text = '';
		_parsedValue = [] call Ares_fnc_GetArrayDataFromUser;
		if (typeName _parsedValue == typeName []) then
		{
			if (isNull _ammoBox) then
			{
				_ammoBox = "B_supplyCrate_F" createVehicle (_this select 0);
				clearWeaponCargoGlobal _ammoBox;
				clearMagazineCargoGlobal _ammoBox;
				clearItemCargoGlobal _ammoBox;
				clearBackpackCargoGlobal _ammoBox;
				[[_ammoBox]] call Ares_fnc_AddUnitsToCurator;
			};
			[_ammoBox, _parsedValue, true] call Ares_fnc_ArsenalSetup;
			[objNull, "Arsenal objects added."] call bis_fnc_showCuratorFeedbackMessage;
		}
		else
		{
			if (_parsedValue != "CANCELLED") then
			{
				[objNull, format ["%1. Was the data in the right format?", _parsedValue]] call bis_fnc_showCuratorFeedbackMessage;
			};
		};
	}
] call Ares_fnc_RegisterCustomModule;