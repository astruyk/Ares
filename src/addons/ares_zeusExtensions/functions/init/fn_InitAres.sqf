// Init some special data that Ares will use. These will sometimes be modified by missions.
call compile preprocessFileLineNumbers '\ares_zeusExtensions\data\Ares_Reinforcement_Unit_Pools.sqf';

// Blacklist for modules that grab objects. These types should not be added to Zeus automatically.
Ares_EditableObjectBlacklist =
	[
		"Ares_Module_Util_Create_Composition",
		"Ares_Module_Save_Objects_For_Paste",
		"ModuleCurator_F",
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
		"Sheep_random_F"
	];

[] spawn {
	[] call Ares_fnc_waitForZeus;

	["Initializing...."] call Ares_fnc_LogMessage;

	[] call Ares_fnc_InitAresPlayerActions;

	["... Done Initializing."] call Ares_fnc_LogMessage;
};