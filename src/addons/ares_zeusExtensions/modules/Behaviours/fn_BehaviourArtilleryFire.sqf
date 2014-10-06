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
	_dialogResult = [_allAmmunition, 0, "Choose Ammunition Type:"] call Ares_fnc_GetDialogChoiceFromUser;
	
	if (_dialogResult != -1) then
	{
		_selectedAmmoType = _allAmmunition select _dialogResult;
		
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
			_artillery commandArtilleryFire [(position _selectedTarget), _selectedAmmoType, 1];
			
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
