_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_itemToDelete = nil;
	_itemToDeleteDistance = 15;
	
	// Find the closest Artillery target.
	{
		if (_x distance _logic <= _itemToDeleteDistance) then
		{
			if (isNil "_itemToDelete") then
			{
				_itemToDelete = _x;
			}
			else
			{
				if ((_x distance _logic) < (_itemToDelete distance _logic)) then
				{
					_itemToDelete = _x;
				};
			};
		};
	} forEach (allMissionObjects "Ares_Module_Behaviour_Create_Artillery_Target");

	if (isNil "_itemToDelete") then
	{
		[objNull, "No Nearby Artillery Target Found"] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		deleteVehicle _itemToDelete;
		[objNull, format["Deleted %1", _type]] call bis_fnc_showCuratorFeedbackMessage;
	};
	
};

deleteVehicle _logic;

true
