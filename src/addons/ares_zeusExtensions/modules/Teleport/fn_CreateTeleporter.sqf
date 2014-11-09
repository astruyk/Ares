_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// Create a function in the mission namespace on all players machines to add the
	// teleport action.
	Ares_addNewTeleportMarkerActions =
	{
		_newMarker = _this select 0;

		if (isNil "Ares_TeleportMarkers") then { Ares_TeleportMarkers = []; };

		{
			// TODO deal with deleted markers.... Conditions?
			if (_x != _newMarker && alive _x) then
			{
				// Add an action to THIS marker to teleport to OTHER marker.
				_actionName = format ["Teleport to %1", _x getVariable ["teleportMarkerName", "??"]];
				_newMarker addAction [_actionName, {
						_teleportTarget = _this select 3;
						if (isNil "_teleportTarget" || !(alive _teleportTarget)) then
						{
							hint "Destination no longer exists...";
							sleep 3;
							hint "";
						}
						else
						{
							titleText ["You are being teleported...", "BLACK", 1];  sleep 1; titleFadeOut 2;
							player setPos (getPos _teleportTarget);
						};
					}, _x];

				// Add action to OTHER marker to teleport to THIS marker.
				_actionName = format ["Teleport to %1", _newMarker getVariable ["teleportMarkerName", "??"]];
				_x addAction [_actionName, {
						_teleportTarget = _this select 3;
						if (isNil "_teleportTarget" || !(alive _teleportTarget)) then
						{
							hint "Destination no longer exists...";
							sleep 3;
							hint "";
						}
						else
						{
							titleText ["You are being teleported...", "BLACK", 1]; sleep 1; titleFadeOut 2;
							player setPos (getPos _teleportTarget);
						};
					}, _newMarker];
			};
		} forEach (Ares_TeleportMarkers);
	};

	// Create a new teleport marker and add it to the list of markers that exist.
	_teleportMarker = "FlagPole_F" createVehicle (getPos _logic);
	_isFirstCallToCreateTeleporter = false;
	if (isNil "Ares_TeleportMarkers") then
	{
		Ares_TeleportMarkers = [];
		_isFirstCallToCreateTeleporter = true;
		publicVariable "Ares_addNewTeleportMarkerActions";
	};
	Ares_TeleportMarkers pushBack _teleportMarker;
	publicVariable "Ares_TeleportMarkers";

	// Set the name of the marker (used in the action)
	_teleportMarkerName = [(count Ares_TeleportMarkers) - 1] call Ares_fnc_GetPhoneticName;
	_teleportMarker setVariable ["teleportMarkerName", _teleportMarkerName, true];

	// Make the teleport marker editable in zeus (needs to run on server)
	[[_teleportMarker]] call Ares_fnc_AddUnitsToCurator;

	// Call this to add the teleport marker actions on all machines. Persistent for JIP people as well.
	[[_teleportMarker], "Ares_addNewTeleportMarkerActions", true, _isFirstCallToCreateTeleporter] call BIS_fnc_MP;

	[objNull, format["Created teleporter '%1'", _teleportMarkerName]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true
