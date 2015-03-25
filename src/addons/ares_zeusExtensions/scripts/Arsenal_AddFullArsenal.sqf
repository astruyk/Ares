[
	"Arsenal",
	"Add Full Arsenal",
	{
		_unitUnderCursor = _this select 1;
		if (not (isNull _unitUnderCursor)) then
		{
			["AmmoboxInit", [_unitUnderCursor, true]] spawn BIS_fnc_arsenal;
		};
	}
] call Ares_fnc_RegisterCustomModule;