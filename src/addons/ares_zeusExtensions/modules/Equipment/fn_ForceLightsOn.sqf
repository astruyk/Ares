#include "\ares_zeusExtensions\module_header.hpp"

_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

_blockToRunRemotely =
{
	_group = _this select 0;
	_group enableGunLights "forceOn";
	_group enableIRLasers true;
};

[_blockToRunRemotely, [_groupUnderCursor], false] call Ares_fnc_BroadcastCode;

[objnull, "Forced lights on."] call bis_fnc_showCuratorFeedbackMessage;

deleteVehicle _logic;
true