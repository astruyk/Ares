_logic = _this select 0;

// Generate list of the players to teleport.
_playersToTeleport = [];
{
	if (isPlayer _x) then
	{
		_playersToTeleport set [count _playertToTeleport, _x];
	};
} forEach allUnits;

// Get the location to teleport them to.
_location = getPos _logic;

// Call the teleport function.
[_playersToTeleport, _location] call Ares_fnc_TeleportPlayers;

if (local _logic) then {
	deleteVehicle _logic;
};