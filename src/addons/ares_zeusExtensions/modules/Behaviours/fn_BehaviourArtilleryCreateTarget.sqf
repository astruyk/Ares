#include "\ares_zeusExtensions\module_header.hpp"

if (isNil "Ares_ArtilleryTargetCount") then
{
	Ares_ArtilleryTargetCount = 0;
};

_targetPhoneticName = [Ares_ArtilleryTargetCount] call Ares_fnc_GetPhoneticName;
_logic setName format ["Artillery Target %1", _targetPhoneticName];
[objNull, format ["Created Artillery Target '%1'", _targetPhoneticName]] call bis_fnc_showCuratorFeedbackMessage;
Ares_ArtilleryTargetCount = Ares_ArtilleryTargetCount + 1;
publicVariable "Ares_ArtilleryTargetCount";

true
