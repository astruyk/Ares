_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	private["_objectArray"];
	
	_ammoBox = [_logic] call Ares_fnc_GetUnitUnderCursor;
	if (not isNil "_ammoBox") then
	{
		_dialog = createDialog "Ares_CopyPaste_Dialog";
		waitUntil { dialog };
		waitUntil { !dialog };
		_text = missionNamespace getVariable ["Ares_clipboard", "[]"];
		try
		{
			if (isNil { call (compile _text) }) then
			{
				throw "Failed to parse";
			};
			_objectArray = call (compile _text);
			if (typeName _objectArray != typeName []) then
			{
				throw "Bad clipboard data";
			};
			if (count _objectArray != 4) then
			{
				throw "Wrong number of elements in array";
			};
			[_ammoBox, _objectArray] call Ares_fnc_ArsenalSetup;
			[objNull, "Arsenal objects added."] call bis_fnc_showCuratorFeedbackMessage;
		}
		catch
		{
			[objNull, format ["%1. Was the data in the right format?", _exception]] call bis_fnc_showCuratorFeedbackMessage;
		};
	};
};

deleteVehicle _logic;
true