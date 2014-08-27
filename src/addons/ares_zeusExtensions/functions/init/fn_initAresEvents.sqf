// Only worry about doing this if we're not a dedicated server. Dedicated servers don't get UI.
if(isServer && isDedicated) exitWith {};

[] spawn {
	[] call Ares_fnc_waitForZeus;

	//Skip event loading for non-curator players
	if(!([player] call Ares_fnc_isZeus)) exitWith {};
	
	["Initializing Events ..."] call Ares_fnc_DisplayMessage;
	{
		//_x addEventHandler ["CuratorWaypointEdited", { _this call Ares_fnc_HandleWaypointEdited;	}];
		//_x addEventHandler ["CuratorWaypointPlaced", { _this call Ares_fnc_HandleWaypointPlaced; }];
		//_x addEventHandler ["CuratorWaypointSelectionChanged", { _this call Ares_fnc_HandleWaypointSelectionChanged;	}];
		//_x addEventHandler ["CuratorGroupSelectionChanged", { _this call Ares_fnc_HandleGroupSelectionChanged; }];
	} foreach allCurators;

	["... Done initializing events."] call Ares_fnc_DisplayMessage;
};