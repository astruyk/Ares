_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_dialogResult = ["Remove Objects From Curator", ["Remove...", ["All units in mission", "All units within 50m", "All units within 100m", "All units within 500m"], 1]] call Ares_fnc_ShowChooseDialog;

	if (count _dialogResult > 0) then
	{
		_objectsToRemove = vehicles + (allMissionObjects "Man") + (allMissionObjects "Air") + (allMissionObjects "Ammo");
		
		if (_dialogResult select 0 != 0) then
		{
			_filteredList = [];
			_radius = 50;
			switch (_dialogResult select 0) do
			{
				case 1: { _radius = 50; };
				case 2: { _radius = 100; };
				case 3: { _radius = 500; };
				default { _radius = 50; };
			};
			
			{
				if (_logic distance _x <= _radius) then
				{
					_filteredList set [count _filteredList, _x];
				};
			} forEach _objectsToRemove;
			_objectsToRemove = _filteredList;
		};
		
		[_objectsToRemove, false] call Ares_fnc_AddUnitsToCurator;

		[objNull, format["Removed %1 objects to curator.", count _objectsToRemove]] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;