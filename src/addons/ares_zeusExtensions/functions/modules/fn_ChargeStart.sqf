_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

	_groupUnderCursor setBehaviour "AWARE";
	_groupUnderCursor setSpeedMode "FULL";
	_groupUnderCursor setCombatMode "BLUE";
	_groupUnderCursor enableAttack false;
	{
		[_x] spawn
		{
			_unit = _this select 0;
			_unit disableAI "TARGET";
			_unit disableAI "AUTOTARGET";
			_unit disableAI "FSM";
			_unit setVariable ["Ares_IsCharging", true];

			_isCharging = true;
			while {_isCharging && alive _unit} do
			{
				if (stance _unit != "STAND") then
				{
					_unit setBehaviour "AWARE";
					_unit setUnitPos "UP";
				};
				sleep 1;
				_isCharging = _unit getVariable["Ares_IsCharging", false];
			};

			if (alive _unit) then
			{
				_unit setUnitPos "AUTO";
				_unit enableAI "TARGET";
				_unit enableAI "AUTOTARGET";
				_unit enableAI "FSM";
				(group _unit) setCombatMode "YELLOW";
				(group _unit) enableAttack true;
			};
		};
	} forEach units _groupUnderCursor;
	[objnull, "Units charging."] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true