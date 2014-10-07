_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

// Nothing to do here. This is just a placeholder.

if (_activated && local _logic) then
{
	// Use a public variable to ensure only one person is running the cleanup script.
	if (isNil "Ares_RunningGroupCleanup") then
	{
		Ares_RunningGroupCleanup = false;
		publicVariable "Ares_RunningGroupCleanup";
	};
	
	if (!Ares_RunningGroupCleanup) then
	{
		Ares_RunningGroupCleanup = true;
		publicVariable "Ares_RunningGroupCleanup";
		[] spawn 
		{
			while {Ares_RunningGroupCleanup} do
			{
				[{{deleteGroup _x} foreach allGroups;}] call Ares_fnc_BroadcastCode;
				sleep 30;
			};
		};
		[objNull, format["Started empty group cleanup every %1 seconds.", 30]] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		[objNull, "Group cleanup script already running."] call bis_fnc_showCuratorFeedbackMessage;
	};
	
};

deleteVehicle _logic;