_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_parsedValue = [] call Ares_fnc_GetArrayDataFromUser;
	if (typeName _parsedValue == typeName []) then
	{
		_createdUnits = [(position _logic), _parsedValue, false] call Ares_fnc_ObjectsMapper;
		[_createdUnits] call Ares_fnc_AddUnitsToCurator;
		[objNull, format["%1 Objects Created at %2.", count _createdUnits, (position _logic)]] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		if (_parsedValue == "CANCELLED") then
		{
			// Do nothing. The paste was cancelled by the user.
		}
		else
		{
			[objNull, format ["%1. Was the data in the right format?", _parsedValue]] call bis_fnc_showCuratorFeedbackMessage;
		};
	};
};

deleteVehicle _logic;
true
