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
				switch (_unit getVariable["AresCaptureState", -1]) do
				{
					case 0:
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
					case 1:
					{
						if (local _unit) then
						{
							removeAllWeapons _unit; // TODO have them drop their stuff instead of disappearing
							_unit enableAI "ANIM";
							_unit enableAI "TARGET";
							_unit enableAI "AUTOTARGET";
							
							_unit disableAI "MOVE";
						};
						_unit switchMove "";
						_unit playActionNow "SitDown";
					};
					default
					{
						// Unknown capture state!
					};
				};
			};
		};
		publicVariable "Ares_AddSurrenderActionsFunction";
	};

	// Determine if we've already captured the unit in the past
	if (alive _unitToCapture) then
	{
		_captureState = _unitToCapture getVariable ["AresCaptureState", -1];
		switch (_captureState) do
		{
			case -1: //Not yet captured
			{
				//Set this for all players so can add correct actions.
				_unitToCapture setVariable ["AresCaptureState", 0, true];

				// Broadcast to all players that this unit is surrendered. Will update their anim states in the mission.
				// We use a persistant call because we want it to be called later for JIP.
				[[_unitToCapture], "Ares_AddSurrenderActionsFunction", true, true] spawn BIS_fnc_MP;

				[objnull, "Unit surrendered."] call bis_fnc_showCuratorFeedbackMessage;
			};
			case 0: // Captured but not secured
			{
				//Set this for all players so can add correct actions.
				_unitToCapture setVariable ["AresCaptureState", 1, true];

				// Broadcast to all players that this unit is surrendered. Will update their anim states in the mission.
				// We use a persistant call because we want it to be called later for JIP.
				[[_unitToCapture], "Ares_AddSurrenderActionsFunction", true, true] spawn BIS_fnc_MP;

				[objnull, "Unit secured."] call bis_fnc_showCuratorFeedbackMessage;
			};
			default // Something else (secured maybe?)
			{
				[objnull, "Unit has already been secured."] call bis_fnc_showCuratorFeedbackMessage;
			};
		};
	}
	else
	{
		[objnull, format["Unit must be alive. (State: %1)", (_unitToCapture getVariable ["AresCaptureState", -1])]] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;
true