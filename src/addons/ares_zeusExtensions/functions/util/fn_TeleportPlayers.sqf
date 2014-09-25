_playersToTeleport = _this select 0;
_teleportLocation = _this select 1;

// Show some text to the players that are going to be teleported.
Ares_playersToShowMessageTo = _playersToTeleport;
publicVariable "Ares_playersToShowMessageTo";
[{ if (player in Ares_playersToShowMessageTo) then { titleText ["You are being teleported...", "BLACK", 1]; sleep 1; titleFadeOut 2; };}, "BIS_fnc_spawn"] call BIS_fnc_MP;

// TODO improve this.
{
	[_x, _teleportLocation] spawn {
		_unit = _this select 0;
		_teleportLocation = _this select 1;
		sleep 1;

		// If the player is in a vehicle, kick them out.
		if (vehicle _unit != _unit) then
		{
			_unit action ["Eject", vehicle _unit];
		};

		_smallRandomOffset = [(random 6) - 3, (random 6) - 3, 0];
		_unit setPos (_teleportLocation vectorAdd _smallRandomOffset);
	};
} forEach _playersToTeleport;
