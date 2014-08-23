// Create a flag we can check for debug things later.
missionnamespace setVariable ["Ares_debugging", true];

// Force a module of ours to load so that we will get the Ares scripts in the menu list. This only works if outside the spawn call.
["Ares_Module_Test"] call BIS_fnc_activateAddons;
//[] spawn { activateAddons ["Ares"]; }; // This also works. Not sure which is best.

[] spawn {
	["Initializing...."] call Ares_fnc_DisplayMessage;

	// Do magic here.
	
	["... Done Initializing."] call Ares_fnc_DisplayMessage;
};