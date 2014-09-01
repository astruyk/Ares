_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then {
	_playersToTeleport = [player]; // TODO get the currently selected unit somehow.... (need event handler for when selection changed I think.)

	// Get the location to teleport to.
	_location = getPos _logic;

	// Call the teleport function.
	[_playersToTeleport, _location] call Ares_fnc_TeleportPlayers;

	[objNull, format["Teleported zeus to %1", _location]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;