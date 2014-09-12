_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	[position _logic] spawn
	{
		_centerPosition = _this select 0;
		sleep 0.01;
		_text = [_centerPosition, 500, true] call Ares_fnc_ObjectsGrabber;

		copyToClipBoard _text;
	};

	[objNull, format["Copied objects to clipboard."]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;

true
