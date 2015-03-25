[
	"Arsenal",
	"Remove Arsenal",
	{
		_unitUnderCursor = _this select 1;
		if (not (isNull _unitUnderCursor)) then
		{
			["AmmoboxExit", _unitUnderCursor] spawn BIS_fnc_arsenal;
		};
	}
] call Ares_fnc_RegisterCustomModule;