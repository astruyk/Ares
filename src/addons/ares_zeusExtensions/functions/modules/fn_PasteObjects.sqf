_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_text = copyFromClipboard;
	_objectArray = call (compile _text);

	_createdUnits = [(position _logic), 0, _objectArray] call Ares_fnc_ObjectsMapper;
	[_createdUnits] call Ares_fnc_AddUnitsToCurator;

	[objNull, format["%1 Objects Created (out of %2).", count _createdUnits, count _objectArray]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true
