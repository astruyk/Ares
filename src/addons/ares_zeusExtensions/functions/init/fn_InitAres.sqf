// Init some special data that Ares will use. These will sometimes be modified by missions.
call compile preprocessFileLineNumbers '\ares_zeusExtensions\data\Ares_Reinforcement_Unit_Pools.sqf';

// Add any custom modules we want
call compile preprocessFileLineNumbers '\ares_zeusExtensions\scripts\registerBuiltInCustomModules.sqf';

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

if(isServer && isDedicated) exitWith { ["Aborting Ares init - Dedicated server detected."] call Ares_fnc_LogMessage; };

[] spawn {
	[] call Ares_fnc_waitForZeus;
	
	// Wait until THIS player is a zeus unit.
	while { !([player] call Ares_fnc_isZeus) } do
	{
		//["Unit not zeus..."] call Ares_fnc_LogMessage;
		sleep 1;
	};

	["Adding Player Actions..."] call Ares_fnc_LogMessage;
	// Add actions to Zeus to go invisible and to come back from being invisible
	player addAction ["<t color='#ff0000'>Go invisible</t>", {[_this select 3, true] spawn Ares_fnc_MakePlayerInvisible; }, player, 1.5, false, false, "", "([player] call Ares_fnc_IsZeus) && (player getVariable [""Ares_isUnitInvisible"", ""false""] == ""false"")"];
	player addAction ["<t color='#00ff00'>Become Visible</t>", {[_this select 3, false] spawn Ares_fnc_MakePlayerInvisible; }, player, 1.5, false, false, "", "([player] call Ares_fnc_IsZeus) && (player getVariable [""Ares_isUnitInvisible"", ""false""] == ""true"")"];
	["... Done adding player actions."] call Ares_fnc_LogMessage;
	
	["Initializing UI ..."] call Ares_fnc_LogMessage;
	["Ares"] spawn Ares_fnc_MonitorCuratorDisplay;
	["... Done initializing UI."] call Ares_fnc_LogMessage;
	
	["Initializing Events ..."] call Ares_fnc_LogMessage;
	_didRegisterForEvents = false;
	{
		if ((getassignedcuratorunit _x) == player) then
		{
			["Found curator instance, registering for callbacks..."] call Ares_fnc_LogMessage;
			_x addEventHandler ["CuratorObjectPlaced", { _this call Ares_fnc_HandleCuratorObjectPlaced; }];
			_x addEventHandler ["CuratorObjectDoubleClicked", { _this call Ares_fnc_HandleCuratorObjectDoubleClicked; }];
			_didRegisterForEvents = true;
		}
		else
		{
			["Skipping curator with different assigned unit."] call Ares_fnc_LogMessage;
		}
	} foreach allCurators;
	if (_didRegisterForEvents) then
	{
		["... Done initializing events (Success)."] call Ares_fnc_LogMessage;
	}
	else
	{
		["... Failed initializing events!"] call Ares_fnc_LogMessage;
	};
};