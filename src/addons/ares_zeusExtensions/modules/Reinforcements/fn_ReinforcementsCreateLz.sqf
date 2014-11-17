#include "\ares_zeusExtensions\module_header.hpp"

_lzCount = missionNamespace getVariable ["Ares_ReinforcementLzCount", 0];
_targetPhoneticName = [_lzCount] call Ares_fnc_GetPhoneticName
_logic setName format ["LZ %1", _targetPhoneticName];
missionNamespace setVariable ["Ares_ReinforcementLzCount", _lzCount + 1, true];
[objNull, format ["Created LZ '%1'", _targetPhoneticName]] call bis_fnc_showCuratorFeedbackMessage;

true;
