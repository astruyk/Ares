_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// Ask the user for the radius to copy from.
	_dialogResult = ["Save Objects To Clipboard", ["Radius of copy", ["50m", "100m", "500m"]]] call Ares_fnc_ShowChooseDialog;
	[format["User chose radius with index '%1'", _dialogResult]] call Ares_fnc_LogMessage;
	if (count _dialogResult > 0) then
	{
		_radius = 100;
		switch (_dialogResult select 0) do
		{
			case 0: { _radius = 50; };
			case 1: { _radius = 100; };
			case 2: { _radius = 500; };
			default { _radius = 100; };
		};
		
		_text = [_logic, _radius] call Ares_fnc_ObjectsGrabber;

		copyToClipBoard _text;
		
		missionNamespace setVariable ['Ares_CopyPaste_Dialog_Text', _text];
		_dialog = createDialog "Ares_CopyPaste_Dialog";

		[objNull, format["Copied all objects in %1 metre radius.", _radius]] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;

true
