_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;
	
	_doesGroupContainAnyPlayer = false;
	{
		if (isPlayer _x) exitWith { _doesGroupContainAnyPlayer = true; };
	} forEach (units _groupUnderCursor);
	
	if (_doesGroupContainAnyPlayer) then
	{
		[objnull, "Cannot garrison groups containing playable units."] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		[(getPos _logic), (units _groupUnderCursor), 150, true, false] call Ares_fnc_ZenOccupyHouse;
		[objnull, "Garrisoned nearest building."] call bis_fnc_showCuratorFeedbackMessage;
	};

};

deleteVehicle _logic;
true