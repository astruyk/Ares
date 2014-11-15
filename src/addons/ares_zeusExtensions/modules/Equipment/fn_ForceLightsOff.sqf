#include "\ares_zeusExtensions\module_header.hpp"

_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

_blockToRunRemotely =
{
	_group = _this select 0;
	_group enableGunLights "forceOff";
	_group enableIRLasers false;
};

[_blockToRunRemotely, [_groupUnderCursor], false] call Ares_fnc_BroadcastCode;

[objnull, "Forced Lights Off."] call bis_fnc_showCuratorFeedbackMessage;

deleteVehicle _logic;
true