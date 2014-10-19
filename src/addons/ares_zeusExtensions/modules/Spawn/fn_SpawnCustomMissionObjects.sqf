_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	if (isNil "Ares_CustomMissionObjectData" || (typeName Ares_CustomMissionObjectData != typeName []) || (count Ares_CustomMissionObjectData == 0)) then
	{
		[objNull, "This mission does not define any custom objects."] call bis_fnc_showCuratorFeedbackMessage;
	}
	else
	{
		// Generate the dialog to ask the user what to spawn.
		_optionNames = [];
		{
			_optionNames pushBack (_x select 0);
		} forEach Ares_CustomMissionObjectData;
		_dialogResult = ["Spawn Custom Mission Object", ["Type:", _optionNames]] call Ares_fnc_ShowChooseDialog;

		if (count _dialogResult > 0) then
		{
			// Look up the code block associated with the user's choice. The code block is
			// always at index 1 (the name is at index 0).
			_chosenOptionIndex = _dialogResult select 0;
			_codeBlock = (Ares_CustomMissionObjectData select (_chosenOptionIndex)) select 1;
			
			// Execute the code block
			_objectsToAddToCurator = [position _logic] call _codeBlock;
			
			// Add the returned object(s) to the Curator.
			if (!isNull _objectsToAddToCurator) then
			{
				if (typeName _objectsToAddToCurator == typeName []) then
				{
					[_objectsToAddToCurator] call Ares_fnc_AddUnitsToCurator;
				}
				else
				{
					[[_objectsToAddToCurator]] call Ares_fnc_AddUnitsToCurator;
				};
			};
			
			[objNull, "Spawned object."] call bis_fnc_showCuratorFeedbackMessage;
		};
	};
};

deleteVehicle _logic;
true