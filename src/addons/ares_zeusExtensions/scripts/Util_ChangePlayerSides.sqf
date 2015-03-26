[
	"Util",
	"Change Player Sides",
	{
		_dialogResult = [
			"Choose Side For Players",
			[
				["Side", ["East (Opfor)", "West (Blufor)", "Independent (Greenfor)", "Civilian"]]
			]
		] call Ares_fnc_ShowChooseDialog;
		
		if (count _dialogResult > 0) then
		{
			_side = east;
			switch (_dialogResult select 0) do
			{
				case 1: { _side = west; };
				case 2: { _side = independent; };
				case 3: { _side = civilian; };
			};
			_newGroup = createGroup _side;
			_allPlayers = [];
			{
				if (isPlayer _x) then
				{
					_allPlayers pushBack _x;
				};
			} forEach allUnits;
			_allPlayers join _newgroup;
			
			["Players Side Changed."] call Ares_fnc_ShowZeusMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;