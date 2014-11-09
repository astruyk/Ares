// Init unit pools
call compile preprocessFileLineNumbers '\ares_zeusExtensions\Ares_Reinforcement_Unit_Pools.sqf';

// Force a module of ours to load so that we will get the Ares scripts in the menu list. This only works if outside the spawn call.
//["Ares_Module_Test"] call BIS_fnc_activateAddons; // Temporarily removed to try other UI init functions.
//[] spawn { activateAddons ["Ares"]; }; // This also works. Not sure which is best.

// Blacklist for modules that grab objects. These types should not be added to Zeus automatically.
Ares_EditableObjectBlacklist = [
		"Ares_Module_Save_Objects_For_Paste",
		"GroundWeaponHolder",
		"Salema_F",
		"Ornate_random_F",
		"Mackerel_F",
		"Tuna_F",
		"Mullet_F", 
		"CatShark_F",
		"Rabbit_F",
		"Snake_random_F",
		"Turtle_F",
		"Hen_random_F",
		"Cock_random_F",
		"Cock_white_F",
		"Sheep_random_F"];

[] spawn {
	[] call Ares_fnc_waitForZeus;

	["Initializing...."] call Ares_fnc_LogMessage;

	[] call Ares_fnc_InitAresPlayerActions;

	["... Done Initializing."] call Ares_fnc_LogMessage;
};