_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_artillery = [_logic] call Ares_fnc_GetUnitUnderCursor;
	
	// Choose the kind of ammunition to fire
	// TODO allow the user to choose how the target is chosen
	// TODO translate the ammunition classes into something more readable.
	// TODO allow the player to choose the number of rounds to fire
	_allAmmunition = getArtilleryAmmo [_artillery];
	
	// Create the dialog to ask the user about the rounds to fire.
	_dialog = createDialog "Ares_Artillery_Dialog";
	
	// Add ammunition types
	{
		lbAdd [2100, _x];
	} forEach _allAmmunition;
	lbSetCurSel  [2101, missionNamespace getVariable ["Ares_ArtilleryDialog_AmmoType", 0]];
	
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
	lbAdd [2102, "Furthest"];
	lbSetCurSel  [2102, missionNamespace getVariable ["Ares_ArtilleryDialog_ChooseTarget", 0]];
	
	waitUntil { !dialog };
	
	
	_dialogResult = missionNamespace getVariable ["Ares_Dialog_Result", -1];
	if (_dialogResult != -1) then
	{
		// Get the data that the dialog set.
		_selectedAmmoType = _allAmmunition select (missionNamespace getVariable ["Ares_ArtilleryDialog_AmmoType", 0]);
		_roundsToFire = missionNamespace getVariable ["Ares_ArtilleryDialog_Rounds", 1];
		_targetChooseAlgorithm = missionNamespace getVariable ["Ares_ArtilleryDialog_ChooseTarget", 0];
		
		// Choose a target to fire at
		_allTargets = allMissionObjects "Ares_Module_Behaviour_Create_Artillery_Target";
		
		_targetsInRange = [];
		{
			if ((position _x) inRangeOfArtillery [[_artillery], _selectedAmmoType]) then
			{
				_targetsInRange set [count _targetsInRange, _x];
			};
		} forEach _allTargets;
		
		if (count _targetsInRange > 0) then
		{
			_selectedTarget = _allTargets call BIS_fnc_selectRandom;
			
			enableEngineArtillery true;
			_roundEta = _artillery getArtilleryETA [position _selectedTarget, _selectedAmmoType];
			_artillery commandArtilleryFire [(position _selectedTarget), _selectedAmmoType, _roundsToFire];
			
			[objNull, format ["Firing at target. ETA %1", _roundEta]] call bis_fnc_showCuratorFeedbackMessage;
		}
		else
		{
			[objNull, "No targets in range"] call bis_fnc_showCuratorFeedbackMessage;
		};
	};
};
deleteVehicle _logic;
true
