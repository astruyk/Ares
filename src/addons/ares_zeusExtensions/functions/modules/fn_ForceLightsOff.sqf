_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

	_blockToRunRemotely =
	{
		_group = _this select 0;
		_group enableGunLights "forceOff";
		_group enableIRLasers false;
	};

	[_blockToRunRemotely, [_groupUnderCursor], false] call Ares_fnc_BroadcastCode;

	[objnull, "Forced Lights Off."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true