_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_ammoBox = [_logic] call Ares_fnc_GetUnitUnderCursor;

	_text = copyFromClipboard;
	_objectArray = call (compile _text);

	[
		_ammoBox,
		_objectArray select 0,
		_objectArray select 1,
		_objectArray select 2,
		_objectArray select 3
	] call Ares_fnc_ArsenalSetup;

	[objNull, "Copied items from arsenal to clipboard."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true