_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

// Nothing to do here. This is just a placeholder.

if (_activated && local _logic) then
{
	_groupCountsPerSide = [0,0,0,0]; // NATO, CSAT, AAF, CIVILIAN
	
	{
		if(local _x) then
		{
			switch (side _x) do
			{
				case blufor: { _groupCountsPerSide set [0, (_groupCountsPerSide select 0) + 1]; };
				case opfor: { _groupCountsPerSide set [1, (_groupCountsPerSide select 1) + 1]; };
				case independent: { _groupCountsPerSide set [2, (_groupCountsPerSide select 2) + 1]; };
				case civilian: { _groupCountsPerSide set [3, (_groupCountsPerSide select 3) + 1]; };
				default {};
			};
		};
	} foreach allGroups;

	// TODO figure out cap and determine how many free slots are left.

	[] spawn
	{
		hint format["Local groups:\n    NATO: %1\n    CSAT: %2\n    AAF: %3\n    CIV: %4", (_groupCountsPerSide select 0), (_groupCountsPerSide select 1), (_groupCountsPerSide select 2), (_groupCountsPerSide select 3)];
		sleep 5;
		hint "";
	};
};

deleteVehicle _logic;