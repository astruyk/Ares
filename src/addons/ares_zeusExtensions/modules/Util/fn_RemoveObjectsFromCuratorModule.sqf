#include "\ares_zeusExtensions\module_header.hpp"
_dialogResult = ["Remove Objects From Curator", ["Remove...", ["All units in mission", "All units within 50m", "All units within 100m", "All units within 500m"], 1]] call Ares_fnc_ShowChooseDialog;

if (count _dialogResult > 0) then
{
	// Grab objects in the selected radius
	_objectsToRemove = [];
	if (_dialogResult select 0 == 0) then
	{
		_objectsToRemove = allMissionObjects "All";
	}
	else
	{
		_radius = 50;
		switch (_dialogResult select 0) do
		{
			case 1: { _radius = 50; };
			case 2: { _radius = 100; };
			case 3: { _radius = 500; };
			default { _radius = 50; };
		};
		_objectsToRemove = nearestObjects [(position _logic), ["All"], _radius];
	};
	
	[_objectsToRemove, false] call Ares_fnc_AddUnitsToCurator;

	[objNull, format["Removed %1 objects to curator.", count _objectsToRemove]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;