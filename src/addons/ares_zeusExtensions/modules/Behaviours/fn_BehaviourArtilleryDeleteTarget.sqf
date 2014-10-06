_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_itemToDelete = [position _logic, allMissionObjects "Ares_Module_Behaviour_Create_Artillery_Target"] call Ares_fnc_GetNearest;

	if (isNull _itemToDelete || _itemToDelete distance _logic > 15) then
	{
		[objNull, "No Nearby Artillery Target Found"] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		deleteVehicle _itemToDelete;
		[objNull, "Deleted Target"] call bis_fnc_showCuratorFeedbackMessage;
	};
	
};

deleteVehicle _logic;

true
