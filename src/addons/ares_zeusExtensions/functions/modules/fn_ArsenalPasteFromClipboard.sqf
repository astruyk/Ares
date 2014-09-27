_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_ammoBox = [_logic] call Ares_fnc_GetUnitUnderCursor;
	_text = copyFromClipboard;
	_objectArray = call (compile _text);
	
	if (count _objectArray == 4) then
	{
		[_ammoBox, _objectArray] call Ares_fnc_ArsenalSetup;
		[objNull, "Arsenal objects added."] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		[objNull, "Clipboard data could not be decoded. Was it in the right format?"] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;
true