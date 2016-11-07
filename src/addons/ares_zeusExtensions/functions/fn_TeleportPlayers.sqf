/*
 * Author: Anthon, Fisher
 * Zeus module function to teleport players
 *
 * Arguments:
 * 0: PlayersToTeleport <OBJECTS>
 * 1: Teleport Location <ARRAY>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [_playersToTeleport, _location] call Ares_fnc_TeleportPlayers;
 *
 */


_playersToTeleport = _this select 0;
_teleportLocation = _this select 1;
_showTeleportMessage = [_this, 2, true, [true]] call BIS_fnc_param;

// Show some text to the players that are going to be teleported.
if (_showTeleportMessage) then
{
	Ares_playersToShowMessageTo = _playersToTeleport;
	publicVariable "Ares_playersToShowMessageTo";
	[{ if (player in Ares_playersToShowMessageTo) then { titleText ["You are being teleported...", "BLACK", 1]; sleep 1; titleFadeOut 2; };}, "BIS_fnc_spawn"] call BIS_fnc_MP;
};

// TODO improve this.
{
	[_x, _teleportLocation, _showTeleportMessage] spawn {
		_unit = _this select 0;
		_teleportLocation = _this select 1;
		_showTeleportMessage = _this select 2;
		if (_showTeleportMessage) then
		{
			sleep 1;
		};
		
		//if Unit in vehicle, kick them out
		if (vehicle _unit != _unit) then
		{
			_unit action["Eject", vehicle _unit];
		}; 
		
		//Teleport player using BIS_fnc_moveToRespawnPosition
		[_unit, _teleportLocation] call BIS_fnc_moveToRespawnPosition;
	};
} forEach _playersToTeleport;
