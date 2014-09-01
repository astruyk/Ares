_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// Create a new teleport marker and add it to the list of markers that exist.
	_teleportMarker = "Land_AncientPillar_F" createVehicle (getPos _logic);
	if (isNil "Ares_TeleportMarkers") then
	{
		Ares_TeleportMarkers = [];
		publicVariable "Ares_addNewTeleportMarkerActions";
	};
	Ares_TeleportMarkers set [count Ares_TeleportMarkers, _teleportMarker];
	publicVariable "Ares_TeleportMarkers";

	// Set the name of the marker (used in the action)
	_teleportMarkerNames = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliet", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "X-Ray", "Yankee", "Zulu"];
	_teleportMarkerName = _teleportMarkerNames select ((count Ares_TeleportMarkers) - 1);
	_teleportMarker setVariable ["teleportMarkerName", _teleportMarkerName, true];

	// Create a function in the mission namespace on all players machines to add the
	// teleport action.
	Ares_addNewTeleportMarkerActions =
	{
		_newMarker = _this select 0;

		if (isNil "Ares_TeleportMarkers") then { Ares_TeleportMarkers = []; };

		{
			// TODO deal with deleted markers.... Conditions?
			if (_x != _newMarker) then
			{
				// Add an action to THIS marker to teleport to OTHER marker.
				_actionName = format ["Teleport to %1", [_x getVariable ["teleportMarkerName", "??"]]];
				_actionText = format ["player setPos %1", getPos _x];
				_newMarker addAction [_actionName, _actionText];

				// Add action to OTHER marker to teleport to THIS marker.
				_actionName = format ["Teleport to %1", _newMarker getVariable ["teleportMarkerName", "??"]];
				_actionText = format ["player setPos %1", getPos _newMarker];
				_x addAction [_actionName, _actionText];
			};
		} forEach (Ares_TeleportMarkers);
	};

	// Call this to add the teleport marker actions on all machines. Persistent for JIP people as well.
	[[_teleportMarker], "Ares_addNewTeleportMarkerActions", true, true] call BIS_fnc_MP;

	[objNull, format["Created teleporter '%1'", _teleportMarkerName]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true
