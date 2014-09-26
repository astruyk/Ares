_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_unitToCapture = [_logic] call Ares_fnc_GetUnitUnderCursor;

	// Check to see if we've ever called this before. If not, then broadcast the necessary code to the other clients.
	if (isNil "Ares_AddSurrenderActionsFunction") then
	{
		// Function that is executed on each machine to correctly call addAction to
		// set the actions available on each unit that is currently captured.
		Ares_AddSurrenderActionsFunction =
		{
			_unit = _this select 0; //For readability.

			if (alive _unit) then
			{
				if (_unit getVariable["AresHasCaputreActionsAdded", -1] == -1) then
				{
					_unit addAction ["Secure", { (_this select 0) setVariable["AresCaptureState", 1, true]; [[_this select 0], "Ares_AddSurrenderActionsFunction", true] spawn BIS_fnc_MP; }, [], 0, false, true, "", "(alive _target) && (player distance _target < 3) && (_target getVariable ['AresCaptureState', -1] == 0)"];
					_unit setVariable ["AresHasCaputreActionsAdded", 1];
				};
				
				// Set the animation states for the units based on their current capture state.
				if (_unit getVariable["AresCaptureState", -1] == 0) then
				{
					if (local _unit) then
					{
						_unit setCaptive true;			// Don't let other AI target them
						[_unit] join grpNull;			// Leave the group so they don't do stupid AI things.
						
						_unit disableAI "ANIM";		// Prevent him from leaving the Surrender animation after it finishes
						_unit disableAI "TARGET";		// Prevent the unit from reacting to existing targets. Otherwise they sometimes drop out of the captured animation.
						_unit disableAI "AUTOTARGET";	// Prevent the unit from reacting to new targets. Otherwise they sometimes drop out of the captured animation.
					};
					_unit switchMove "";
					_unit playActionNow "Surrender";
				};
				if (_unit getVariable["AresCaptureState", -1] == 1) then
				{
					if (local _unit) then
					{
						removeAllWeapons _unit; // TODO have them drop their stuff instead of disappearing
						_unit enableAI "ANIM";
						_unit enableAI "TARGET";
						_unit enableAI "AUTOTARGET";
					};
					_unit switchMove "";
					_unit playActionNow "SitDown";
				};
			};
		};
		publicVariable "Ares_AddSurrenderActionsFunction";
	};

	// Determine if we've already captured the unit in the past
	// TODO Maybe if Zeus tries to recapture an already captured unit it should secure them?
	if (alive _unitToCapture) then
	{
		_wasAlreadyCaptured = _unitToCapture getVariable ["AresCaptureState", -1] != -1;
		if (!_wasAlreadyCaptured) then
		{
			//Set this for all players so can add correct actions.
			_unitToCapture setVariable ["AresCaptureState", 0, true];

			// Capture him now. We keep track of things in an array
			// Set the correct state on the captured unit.
			[[_unitToCapture], "Ares_AddSurrenderActionsFunction", true, true] spawn BIS_fnc_MP;

			[objnull, format["Unit has surrendered. (State: %1)", (_unitToCapture getVariable ["AresCaptureState", -1])]] call bis_fnc_showCuratorFeedbackMessage;
		}
		else
		{
			[objnull, format["Unit has already surrendered. (State: %1)",(_unitToCapture getVariable ["AresCaptureState", -1])]] call bis_fnc_showCuratorFeedbackMessage;
		};
	}
	else
	{
		[objnull, format["Unit must be alive. (State: %1)", (_unitToCapture getVariable ["AresCaptureState", -1])]] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;
true