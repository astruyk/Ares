[
	"Util",
	"Change Player Sides",
	{
		_unitUnderCursor = _this select 1;
		
		_units = [];
		_side = east;
		if (isNull _unitUnderCursor) then
		{
			_dialogResult = [
				"Choose side For all players",
				[
					["Side", ["East (Opfor)", "West (Blufor)", "Independent (Greenfor)", "Civilian"]]
				]
			] call Ares_fnc_ShowChooseDialog;
			
			if (count _dialogResult > 0) then
			{
				switch (_dialogResult select 0) do
				{
					case 1: { _side = west; };
					case 2: { _side = independent; };
					case 3: { _side = civilian; };
				};
				
				{
					if (isPlayer _x) then
					{
						_units pushBack _x;
					};
				} forEach allUnits;
				
				
				["Players Side Changed."] call Ares_fnc_ShowZeusMessage;
			};
		}
		else
		{
			_dialogResult = [
				"Choose Side",
				[
					["Side", ["East (Opfor)", "West (Blufor)", "Independent (Greenfor)", "Civilian"]],
					["Change side for", ["Entire group", "Selected player only"]]
				]
			] call Ares_fnc_ShowChooseDialog;
			
			if (count _dialogResult > 0) then
			{
				switch (_dialogResult select 0) do
				{
					case 1: { _side = west; };
					case 2: { _side = independent; };
					case 3: { _side = civilian; };
				};
				
				switch (_dialogResult select 1) do
				{
					case 0:
					{
						_units = units (group _unitUnderCursor);
					};
					case 1:
					{
						_units pushBack _unitUnderCursor;
					};
				};
			};
		};
		
		if (count _units > 0) then
		{
			_newGroup = createGroup _side;
			_units join _newgroup;
			["Changed side for %1 players.", count _units] call Ares_fnc_ShowZeusMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;