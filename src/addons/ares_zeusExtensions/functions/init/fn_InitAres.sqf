// Create a flag we can check for debug things later.
missionnamespace setVariable ["Ares_debugging", true];

[] spawn {
	["Initializing...."] call Ares_fnc_DisplayMessage;
	
	// Do init stuff....
	
	["... Done Initializing."] call Ares_fnc_DisplayMessage;
};