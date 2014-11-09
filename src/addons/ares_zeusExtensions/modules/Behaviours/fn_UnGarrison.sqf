_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

	// Give the units a move order since that cancels the 'stop' order we gave them when
	// garrisoning. Choose a point outside so they try to leave the building.
	_outsidePos = [getPos (leader _groupUnderCursor), [3,15], 2, 0] call Ares_fnc_GetSafePos;
	{
		//_x enableAI "MOVE";
		//_x doMove _outsidePos;
		(_units select _unitIndex) forceSpeed -1;
		} forEach(units _groupUnderCursor);

	[objnull, "Units released from garrison."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true
