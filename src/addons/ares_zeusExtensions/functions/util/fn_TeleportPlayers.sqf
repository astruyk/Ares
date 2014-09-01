_playersToTeleport = _this select 0;
_teleportLocation = _this select 1;

// TODO improve this.
{
	_smallRandomOffset = [random 3, random 3, 0];
	_x setPos (_teleportLocation vectorAdd _smallRandomOffset);
} forEach _playersToTeleport;