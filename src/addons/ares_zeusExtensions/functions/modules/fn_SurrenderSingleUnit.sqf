_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_unitToCapture = [_logic] call Ares_fnc_GetUnitUnderCursor;

	// TODO move these function definitions to a static place (no need to call publicVariable to sync them every time we surrender a unit).
	Ares_RefreshSurrenderActionsFunction =
	{
		_unit = _this select 0;
		
		// Remove all the actions for each capture state
		{
			_id = _unit getVariable [_x, -1];
			if (_id != -1) then
			{
				_unit removeAction _id;
				_unit setVariable [_x, -1];
			};
		} forEach  ["AresSecureActionId"];

		// Check the capture state and re-add the appropriate actions back
		_currentUnitState = _unit getVariable "AresCaptureState";
		switch (_currentUnitState) do
		{
			case 0:
			{
				// Surrendered
				_id = _unit addAction ["Secure",  { [[_this select 0], "Ares_SecureCaptiveFunction", true, false] spawn BIS_fnc_MP }];
				_unit setVariable ["AresSecureActionId", _id];
			};
			case 1:
			{
				// Secured Nothing else you can do (yet)
			};
			default:
			{
			};
		};
	};
	publicVariable "Ares_CheckSurrenderStateFunction";
	
	Ares_SurrenderFunction = 
	{
		_unit = _this select 0;
		if (local _unit) then
		{
			//Set this for all players so can set corre
			_unit setVariable ["AresCaptureState", 0, true];
			
			_unit setCaptive true;			// Don't let other AI target them
			[_unit] join grpNull;			// Leave the group so they don't do stupid AI things.
			removeAllWeapons _unit;			// TODO have unit drop their weapon instead of magically disappearing
			_unit disableAI "TARGET";		// Prevent the unit from reacting to existing targets. Otherwise they sometimes drop out of the captured animation.
			_unit disableAI "AUTOTARGET";	// Prevent the unit from reacting to new targets. Otherwise they sometimes drop out of the captured animation.
		};
		
		// Make sure all of the other clients have the right actions now that we've changed the units state.
		[[_unit], "Ares_RefreshSurrenderActionsFunction", true, false] spawn BIS_fnc_MP;
	};
	publicVariable "Ares_SurrenderFunction";
	
	Ares_SecureCaptiveFunction = 
	{
		_unit = _this select 0;
		
		if (local _unit) then
		{
			removeAllWeapons _unit;
			_unit switchMove "";
			_unit action ["sitDown", _unit];
		};
		
		// Make sure all of the other clients have the right actions now that we've changed the units state.
		[[_unit], "Ares_RefreshSurrenderActionsFunction", true, false] spawn BIS_fnc_MP;
	};
	publicVariable "Ares_SecureCaptiveFunction";
	
	// Execute the capture on all machines.
	[[_unitToCapture], "Ares_SurrenderFunction", true, false] spawn BIS_fnc_MP;
	
	[objnull, format["Unit %1 has surrendered.", _unitToCapture]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true