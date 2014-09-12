_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

	[(getPos _logic), (units _groupUnderCursor), -1, true, true] call Ares_fnc_ZenOccupyHouse;

	[objnull, "Garrisoned nearest building."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true