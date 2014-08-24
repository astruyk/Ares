// Only worry about doing this if we're not a dedicated server. Dedicated servers don't get UI.
if(isServer && isDedicated) exitWith {};

[] spawn {
	[] call Ares_fnc_waitForZeus;

	//Don't do anything for non-zeus players.
	if(!([player] call Ares_fnc_isZeus)) exitWith {};
	
	["Initializing UI ..."] call Ares_fnc_DisplayMessage;
	
	["Ares"] spawn Ares_fnc_MonitorCuratorDisplay;
	//[] spawn Ares_fnc_SetupDisplayHandlers;

	["... Done initializing UI."] call Ares_fnc_DisplayMessage;
};