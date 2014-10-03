_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then {
	_objectsToAdd = vehicles + (allMissionObjects "Man") + (allMissionObjects "Air") + (allMissionObjects "Ammo");
	
	[_objectsToAdd] call Ares_fnc_AddUnitsToCurator;

	[objNull, format["Added %1 objects to curator.", count _objectsToAdd]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;