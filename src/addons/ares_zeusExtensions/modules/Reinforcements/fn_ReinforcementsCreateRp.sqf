#include "\ares_zeusExtensions\module_header.hpp"

if (isNil "Ares_ReinforcementRpCount") then
{
	Ares_ReinforcementRpCount = 0;
};

_targetPhoneticName = [Ares_ReinforcementRpCount] call Ares_fnc_GetPhoneticName;
_logic setName format ["RP %1", _targetPhoneticName];
[objNull, format ["Created RP '%1'", _targetPhoneticName]] call bis_fnc_showCuratorFeedbackMessage;
Ares_ReinforcementRpCount = Ares_ReinforcementRpCount + 1;
publicVariable "Ares_ReinforcementRpCount";

true
