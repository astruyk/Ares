#include "\ares_zeusExtensions\module_header.hpp"

_targetCount = missionNamespace getVariable ["Ares_ArtilleryTargetCount", 0];
_targetPhoneticName = [_targetCount] call Ares_fnc_GetPhoneticName
_logic setName format ["Artillery Target %1", _targetPhoneticName];
missionNamespace setVariable ["Ares_ArtilleryTargetCount", _targetCount + 1, true];
[objNull, format ["Created Artillery Target '%1'", _targetPhoneticName]] call bis_fnc_showCuratorFeedbackMessage;

true
