#include "\ares_zeusExtensions\module_header.hpp"

_rpCount = missionNamespace getVariable ["Ares_ReinforcementRpCount", 0];
_targetPhoneticName = [_rpCount] call Ares_fnc_GetPhoneticName
_logic setName format ["RP %1", _targetPhoneticName];
missionNamespace setVariable ["Ares_ReinforcementRpCount", _rpCount + 1, true];
[objNull, format ["Created RP '%1'", _targetPhoneticName]] call bis_fnc_showCuratorFeedbackMessage;
true
