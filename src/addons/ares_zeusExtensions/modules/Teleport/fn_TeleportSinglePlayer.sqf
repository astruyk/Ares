private ["_closestMarker", "_closestMarkerDistance"];

#include "\ares_zeusExtensions\module_header.hpp"

// Get the unit this was applied to.
_playerToTeleport = [_logic] call Ares_fnc_GetUnitUnderCursor;

if (!isPlayer _playerToTeleport) then
{
	[objNull, "You must drop this on a playable unit."] call bis_fnc_showCuratorFeedbackMessage;
}
else
{
	_closestMarker = objNull;
	_closestMarkerDistance = 9999999999;
	if (!isNil "Ares_TeleportMarkers") then
	{
		{
			if (alive _x) then
			{
				_distanceToPlayer = _playerToTeleport distance _x;
				if (isNull _closestMarker || _distanceToPlayer < _closestMarkerDistance) then
				{
					_closestMarker = _x;
					_closestMarkerDistance = _distanceToPlayer;
				};
			};
		} forEach Ares_TeleportMarkers;
	};

	if (isNull _closestMarker) then
	{
		[objNull, "You must place a teleporter first."] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		// Get the location to teleport them to.
		_location = getPos _closestMarker;

		// Call the teleport function.
		[[_playerToTeleport], _location] call Ares_fnc_TeleportPlayers;

		[objNull, format["Teleported player to %1", _location]] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;
true
