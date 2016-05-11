[
	"Util",
	"Transfer to server",
	{
		private ["_unitUnderCursor"];
		_unitUnderCursor = _this select 1;
		if (not isNull _unitUnderCursor) then
		{
			private ["_playerInGroup"];
			_playerInGroup = false;
			{
				if (isPlayer _x) exitWith { _playerInGroup = true; };
			} forEach (units (group _unitUnderCursor));
			if (not _playerInGroup) then
			{
				[group _unitUnderCursor] call Ares_fnc_TransferGroupsToServer;
				["Group will be transfered to the server."] call Ares_fnc_ShowZeusMessage;
			}
			else
			{
				["Cannot transfer a group with player units."] call Ares_fnc_ShowZeusMessage;
			};
		}
		else
		{
			[] call Ares_fnc_TransferGroupsToServer;
			["All groups will be transfered to the server"] call Ares_fnc_ShowZeusMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;
