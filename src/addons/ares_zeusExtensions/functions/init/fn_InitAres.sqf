// Init unit pools
call compile preprocessFileLineNumbers '\ares_zeusExtensions\Ares_Reinforcement_Unit_Pools.sqf';

// Force a module of ours to load so that we will get the Ares scripts in the menu list. This only works if outside the spawn call.
//["Ares_Module_Test"] call BIS_fnc_activateAddons; // Temporarily removed to try other UI init functions.
//[] spawn { activateAddons ["Ares"]; }; // This also works. Not sure which is best.

[] spawn {
	[] call Ares_fnc_waitForZeus;

	["Initializing...."] call Ares_fnc_LogMessage;

	[] call Ares_fnc_InitAresPlayerActions;

	["... Done Initializing."] call Ares_fnc_LogMessage;
};