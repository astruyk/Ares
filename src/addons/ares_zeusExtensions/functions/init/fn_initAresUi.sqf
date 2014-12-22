["Ares_fnc_InitAresUi called..."] call Ares_fnc_LogMessage;

// Only worry about doing this if we're not a dedicated server. Dedicated servers don't get UI.
if(isServer && isDedicated) exitWith {};

[] spawn {
	// Wait for there to be A zeus unit.
	[] call Ares_fnc_waitForZeus;

	// Wait until THIS player is a zeus unit.
	while { !([player] call Ares_fnc_isZeus) } do
	{
		//["Unit not zeus..."] call Ares_fnc_LogMessage;
		sleep 1;
	};
	
	["Initializing UI ..."] call Ares_fnc_LogMessage;
	
	["Ares"] spawn Ares_fnc_MonitorCuratorDisplay;

	["... Done initializing UI."] call Ares_fnc_LogMessage;
};