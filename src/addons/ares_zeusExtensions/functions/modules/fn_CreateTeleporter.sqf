_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// Create a function in the mission namespace on all players machines to add the
	// teleport action.
	Ares_addNewTeleportMarkerActions =
	{
		_teleportMarker = _this select 0;

		{
			// TODO deal with deleted markers.... Conditions?
			if (_x != _teleportMarker) then
			{
				// Add an action to THIS marker to teleport to OTHER marker.
				_actionName = format ["Teleport to %1", [_x getVariable ["teleportMarkerName", "??"]]];
				_teleportMarker addAction [_actionName, { (_this select 1) setPos (getPos (_this select 0)); }];

				// Add action to OTHER marker to teleport to THIS marker.
				_actionName = format ["Teleport to %1", _teleportMarker getVariable ["teleportMarkerName", "??"]];
				_x addAction [_actionName, { (_this select 1) setPos (getPos (_this select 0)); }];
			};
		} forEach Ares_teleportMarkers;
	};
	publicVariable "Ares_addNewTeleportMarkerActions";

	_teleportMarkerNames = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliet", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "X-Ray", "Yankee", "Zulu"];

	_teleportMarker = "Land_RedWhitePole_F" createVehicle (getPos _logic);
	_teleportMarkerName = _teleportMarkerNames select (count Ares_teleportMarkers);
	_teleportMaker setVariable ["teleportMarkerName", _teleportMarkerName, true];

	// Add this to the list of teleport markers that exist.
	Ares_teleportMarkers set [(count Ares_teleportMarkers), _teleportMarker];
	publicVariable "Ares_teleportMarkers";

	// Call this to add the teleport marker actions on all machines. Persistent for JIP people as well.
	[_teleportMarker, "Ares_addNewTeleportMarkerActions", true, true] call BIS_fnc_MP;
};

deleteVehicle _logic;
true
