_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// Ask the user for the radius to copy from.
	_dialogResult = [["50m", "100m", "500m"], 0, "Choose radius of copy:"] call Ares_fnc_GetDialogChoiceFromUser;
	[format["User chose radius with index '%1'", _dialogResult]] call Ares_fnc_LogMessage;
	if (_dialogResult != -1) then
	{
		_radius = 100;
		switch (_dialogResult) do
		{
			case 0: { _radius = 50; };
			case 1: { _radius = 100; };
			case 2: { _radius = 500; };
			default { _radius = 100; };
		};
		
		_centerPosition = position _logic;
		_text = [_centerPosition, _radius, true] call Ares_fnc_ObjectsGrabber;

		copyToClipBoard _text;
		
		missionNamespace setVariable ['Ares_CopyPaste_Dialog_Text', _text];
		_dialog = createDialog "Ares_CopyPaste_Dialog";

		[objNull, format["Copied all objects in %1 metre radius.", _radius]] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;

true
