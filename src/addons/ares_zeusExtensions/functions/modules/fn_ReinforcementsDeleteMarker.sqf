_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_itemToDelete = nil;
	_itemToDeleteDistance = 15;
	_type = "";
	
	// Find the closest LZ.
	{
		if (_x distance _logic <= _itemToDeleteDistance) then
		{
			if (isNil "_itemToDelete") then
			{
				_itemToDelete = _x;
				_type = "LZ";
			}
			else
			{
				if ((_x distance _logic) < (_itemToDelete distance _logic)) then
				{
					_itemToDelete = _x;
					_type = "LZ";
				};
			};
		};
	} forEach (allMissionObjects "Ares_Module_Reinforcements_Create_Lz");

	// Find the closest RP (if it's closer than the closest LZ)
	{
		if (_x distance _logic <= _itemToDeleteDistance) then
		{
			if (isNil "_itemToDelete") then
			{
				_itemToDelete = _x;
				_type = "RP";
			}
			else
			{
				if ((_x distance _logic) < (_itemToDelete distance _logic)) then
				{
					_itemToDelete = _x;
					_type = "RP";
				};
			};
		};
	} forEach (allMissionObjects "Ares_Module_Reinforcements_Create_Rp");
	
	if (isNil "_itemToDelete") then
	{
		[objNull, "No Nearby RP or LZ Found"] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		deleteVehicle _itemToDelete;
		[objNull, format["Deleted %1", _type]] call bis_fnc_showCuratorFeedbackMessage;
	};
	
};

deleteVehicle _logic;

true
