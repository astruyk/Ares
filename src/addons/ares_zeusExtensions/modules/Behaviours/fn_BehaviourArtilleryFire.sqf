_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_artillery = [_logic] call Ares_fnc_GetUnitUnderCursor;
	
	// Choose the kind of ammunition to fire
	_allAmmunition = getArtilleryAmmo [_artillery];
	
	if (count _allAmmunition > 0) then
	{
		// Create the dialog to ask the user about the rounds to fire.
		_dialog = createDialog "Ares_Artillery_Dialog";
		
		// Add ammunition types
		{
			lbAdd [2100, _x];
		} forEach _allAmmunition;
		lbSetCurSel  [2100, missionNamespace getVariable ["Ares_ArtilleryDialog_AmmoType", 0]];
		
		// Add Ammo Counts
		lbAdd [2101, "1"];
		lbAdd [2101, "2"];
		lbAdd [2101, "3"];
		lbAdd [2101, "4"];
		lbAdd [2101, "5"];
		lbSetCurSel  [2101, missionNamespace getVariable ["Ares_ArtilleryDialog_Rounds", 0]];
		
		// Add target choices
		lbAdd [2102, "Random"];
		lbAdd [2102, "Nearest"];
		lbAdd [2102, "Farthest"];
		lbSetCurSel  [2102, missionNamespace getVariable ["Ares_ArtilleryDialog_ChooseTarget", 0]];
		
		waitUntil { !dialog };
		
		_dialogResult = missionNamespace getVariable ["Ares_Dialog_Result", -1];
		if (_dialogResult != -1) then
		{
			// Get the data that the dialog set.
			_selectedAmmoType = _allAmmunition select (missionNamespace getVariable ["Ares_ArtilleryDialog_AmmoType", 0]);
			_roundsToFire = (missionNamespace getVariable ["Ares_ArtilleryDialog_Rounds", 1]) + 1; // +1 since the options are 0-based. (0 actually fires a whole clip)
			_targetChooseAlgorithm = missionNamespace getVariable ["Ares_ArtilleryDialog_ChooseTarget", 0];
			
			// Choose a target to fire at
			_allTargets = allMissionObjects "Ares_Module_Behaviour_Create_Artillery_Target";
			
			// Make sure we only consider targets that are in range.
			_targetsInRange = [];
			{
				if ((position _x) inRangeOfArtillery [[_artillery], _selectedAmmoType]) then
				{
					_targetsInRange set [count _targetsInRange, _x];
				};
			} forEach _allTargets;
			
			if (count _targetsInRange > 0) then
			{
				// Choose a target to fire at
				_selectedTarget = _allTargets call BIS_fnc_selectRandom;
				if (_targetChooseAlgorithm == 1) then
				{
					_selectedTarget = [position _logic, _targetsInRange] call Ares_fnc_GetNearest;
				};
				if (_targetChooseAlgorithm == 2) then
				{
					_selectedTarget = [position _logic, _targetsInRange] call Ares_fnc_GetFarthest;
				};
				
				// Fire at the target
				enableEngineArtillery true;
				_roundEta = _artillery getArtilleryETA [position _selectedTarget, _selectedAmmoType];
				_artillery commandArtilleryFire [(position _selectedTarget), _selectedAmmoType, _roundsToFire];
				
				[objNull, format ["Firing %1 rounds of '%2' at target. ETA %3", _roundsToFire, _selectedAmmoType, _roundEta]] call bis_fnc_showCuratorFeedbackMessage;
			}
			else
			{
				[objNull, "No targets in range"] call bis_fnc_showCuratorFeedbackMessage;
			};
		};
	};
};
deleteVehicle _logic;
true
