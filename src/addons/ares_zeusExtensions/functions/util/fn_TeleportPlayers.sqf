_playersToTeleport = _this select 0;
_teleportLocation = _this select 1;

// Show some text to the players that are going to be teleported.
Ares_playersToShowMessageTo = _teleportLocation;
publicVariable "Ares_playersToShowMessageTo";
[{ if (player in Ares_playersToShowMessageTo) then { titleText ["You are being teleported...", "BLACK", 1]; titleFadeOut 2; };}, "BIS_fnc_spawn"] call BIS_fnc_MP;

// TODO improve this.
{
	_smallRandomOffset = [(random 6) - 3, (random 6) - 3, 0];
	_x setPos (_teleportLocation vectorAdd _smallRandomOffset);
} forEach _playersToTeleport;
