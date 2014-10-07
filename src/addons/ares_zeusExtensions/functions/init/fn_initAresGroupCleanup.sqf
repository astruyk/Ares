// Use a public variable to ensure only one person is running the cleanup script.
if (isNil "Ares_RunningGroupCleanup") then
{
	Ares_RunningGroupCleanup = false;
	publicVariable "Ares_RunningGroupCleanup";
};
/*
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
};*/	