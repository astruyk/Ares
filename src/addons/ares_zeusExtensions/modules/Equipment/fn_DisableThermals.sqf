_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_unit = [_logic] call Ares_fnc_GetUnitUnderCursor;

	(vehicle _unit) disableTIEquipment true;

	[objnull, "Disabled thermal vision."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true