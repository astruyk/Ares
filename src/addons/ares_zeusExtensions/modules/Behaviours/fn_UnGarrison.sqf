#include "\ares_zeusExtensions\module_header.hpp"

_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

// Give the units a move order since that cancels the 'stop' order we gave them when
// garrisoning. Choose a point outside so they try to leave the building.
_outsidePos = [getPos (leader _groupUnderCursor), [3,15], 2, 0] call Ares_fnc_GetSafePos;
{
	//_x enableAI "MOVE";
	//_x doMove _outsidePos;
	_x forceSpeed -1;
} forEach(units _groupUnderCursor);

[objnull, "Units released from garrison."] call bis_fnc_showCuratorFeedbackMessage;

deleteVehicle _logic;
true
