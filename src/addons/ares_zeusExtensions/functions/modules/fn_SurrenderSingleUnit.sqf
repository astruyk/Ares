_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_unitToCapture = [_logic] call Ares_fnc_GetUnitUnderCursor;

	// Function that is executed on each machine to correctly call addAction to
	// set the actions available on each unit that is currently captured.
	Ares_RefreshSurrenderActionsFunction =
	{
		// TODO support refreshing only one unit if it's passed in as a parameter
		{
			_unit = _x; //For readability.

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
			_currentUnitState = _unit getVariable ["AresCaptureState", -1];
			switch (_currentUnitState) do
			{
				case 0:
				{
					// Surrendered
					_id = _unit addAction ["Secure",  { [[_this select 0], "Ares_SecureCaptiveFunction", true] spawn BIS_fnc_MP; }];
					_unit setVariable ["AresSecureActionId", _id];
				};
				case 1:
				{
					// Secured Nothing else you can do (yet)
				};
				default
				{
					// Nothing to do here.
				};
			};

		} forEach (Ares_CapturedUnitList);
	};

	// Function that marks a unit as being in the Surrendered state and makes
	// the appropriate AI changes.
	Ares_SurrenderUnitFunction =
	{
		_unit = _this select 0;

		if (local _unit) then
		{
			//Set this for all players so can add correct actions.
			_unit setVariable ["AresCaptureState", 0, true];

			_unit setCaptive true;			// Don't let other AI target them
			[_unit] join grpNull;			// Leave the group so they don't do stupid AI things.
			removeAllWeapons _unit;			// TODO have unit drop their weapon instead of magically disappearing
			_unit disableAI "TARGET";		// Prevent the unit from reacting to existing targets. Otherwise they sometimes drop out of the captured animation.
			_unit disableAI "AUTOTARGET";	// Prevent the unit from reacting to new targets. Otherwise they sometimes drop out of the captured animation.
			_unit action ["Surrender", _unit];	// Go into the 'surrendered' animation.
		};

		// Make sure all of the other clients have the right actions now that we've changed the units state.
		// [[_unit], "Ares_RefreshSurrenderActionsFunction", true, false] spawn BIS_fnc_MP;
		// Don't actually need to do this since it'll get called by zeus after invoking this function.
	};

	// Function that marks a unit as being in the captive state and makes the
	// appropriate AI changes.
	Ares_SecureCaptiveFunction =
	{
		_unit = _this select 0;

		if (local _unit) then
		{
			_unit setVariable ["AresCaptureState", 1, true];

			removeAllWeapons _unit;
			_unit switchMove "";
			_unit action ["SitDown", _unit];
		};

		// Make sure all of the other clients have the right actions now that we've changed the units state.
		[[_unit], "Ares_RefreshSurrenderActionsFunction", true] spawn BIS_fnc_MP;
	};

	_firstCallToCaptureAnyUnit = false;
	if (isNil "Ares_CapturedUnitList") then
	{
		_firstCallToCaptureAnyUnit = true;
		Ares_CapturedUnitList = [];

		// If we haven't set the captured unit list before, we know this is the
		// first time we're in the function. Sync the code we need to run captures.
		publicVariable "Ares_RefreshSurrenderActionsFunction";
		publicVariable "Ares_SurrenderUnitFunction";
		publicVariable "Ares_SecureCaptiveFunction";
	};

	// Determine if we've already captured the unit in the past
	// TODO Maybe if Zeus tries to recapture an already captured unit it should secure them?
	_wasAlreadyCaptured = false;
	{
		if (_x == _unitToCapture) then
		{
			_wasAlreadyCaptured = true;
		};
	} forEach (Ares_CapturedUnitList);

	if (!_wasAlreadyCaptured) then
	{
		// Capture him now. We keep track of things in an array
		// so that JIP players can be sure to get actions added to ALL captured units
		// without requring a bunch of seperate persistent BIS_fnc_MP calls.
		Ares_CapturedUnitList set [count Ares_CapturedUnitList, _unitToCapture];
		publicVariable "Ares_CapturedUnitList";

		// Set the correct state on the captured unit.
		[[_unitToCapture], "Ares_SurrenderUnitFunction", true] spawn BIS_fnc_MP;

		// Execute the function to update the actions on all JIP machines as well, so if they join later
		// they get the actions added. Only make it persistent if this is the first call.
		[[], "Ares_RefreshSurrenderActionsFunction", true, _firstCallToCaptureAnyUnit] spawn BIS_fnc_MP;

		[objnull, format["Unit %1 has surrendered. (%2)", _unitToCapture, (count Ares_CapturedUnitList)]] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		[objnull, format["Unit %1 has already surrendered. (State: )", _unitToCapture, (_unitToCapture getVariable ["AresCaptureState", -1])]] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;
true