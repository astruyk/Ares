#include "\ares_zeusExtensions\module_header.hpp"

_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

_blockToRunRemotely =
{
	_group = _this select 0;
	_group enableGunLights "AUTO";
	_group enableIRLasers false; //Units never use lasers by default.
};

[_blockToRunRemotely, [_groupUnderCursor], false] call Ares_fnc_BroadcastCode;

[objnull, "Forced lights to Auto."] call bis_fnc_showCuratorFeedbackMessage;

deleteVehicle _logic;
true