_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

// Nothing to do here. This is just a placeholder.

if (_activated && local _logic) then
{
	if (isNil "Ares_RunningGroupCleanup") then
	{
		[objNull, "No cleanup script running."] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		Ares_RunningGroupCleanup = false;
		publicVariable "Ares_RunningGroupCleanup";
		
		[objNull, "Stopped cleanup script."] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;