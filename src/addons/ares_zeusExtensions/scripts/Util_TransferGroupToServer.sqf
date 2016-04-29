[
	"Util",
	"Transfer group to server",
	{
		private ["_groupUnderCursor"];
		["BehaviourPatrol: Getting group under cursor"] call Ares_fnc_LogMessage;
		_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;
		["BehaviourPatrol: Got group under cursor"] call Ares_fnc_LogMessage;
		if (not isNull _groupUnderCursor) then {
			private ["_playerInGroup"];
			_playerInGroup = false;
			{
				if (isPlayer _x) exitWith { _playerInGroup = true; };
			} forEach (units _groupUnderCursor);
			if(not _playerInGroup) then {
				[_groupUnderCursor] call Ares_fnc_TransferGroupsToServer;
				["Group will be transfered to the server."] call Ares_fnc_ShowZeusMessage;
			} else {
				["Cannot transfer a group with player units."] call Ares_fnc_ShowZeusMessage;
			};
		} else {
			["No unit or group under cursor!!"] call Ares_fnc_LogMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;
