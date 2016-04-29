[
	"Util",
	"Transfer all groups to server",
	{
		[] call Ares_fnc_TransferGroupsToServer;
		["All groups will be transfered to the server"] call Ares_fnc_ShowZeusMessage;
	}
] call Ares_fnc_RegisterCustomModule;
