#include "\ares_zeusExtensions\module_header.hpp"

// get all units within 50m
_nearObjects = nearestObjects [(position _logic), ["All"], 50];

// Filter for artillery
_filteredObjects = [];
{
	_ammo = getArtilleryAmmo [_x];
	if (count _ammo > 0) then
	{
		_filteredObjects pushBack _x;
	};
	
} forEach _nearObjects;

/**
 * Group by type. The structure of batteries is
 * [
 *   ["Type name", [Unit1, unit2, ...], [ammotype1, ammotype2, ...]],
 *   ["Type name", [Unit1, unit2, ...], [ammotype1, ammotype2, ...]]
 * ]
 */
_batteries = [];

// initialize type names
{
	_type = typeOf _x;	
	_alreadyContained = false;	
	{
		if (_x find _type > -1) then
		{
			_alreadyContained = true;
		};
	} forEach _batteries;
	
	if (!_alreadyContained) then
	{
		_ammo = getArtilleryAmmo [_x];
		_batteries pushBack [_type, [_x], _ammo];
	} 
	else 
	{
		_unit = _x;
		{
			_battery = _x;
			_units = _battery select 1;
			_unitType = typeOf _unit;
			
			if (_unitType == (_battery select 0)) then
			{
			  _units pushBack _unit;
			};			
			
		} forEach _batteries;
	};
	
} forEach _filteredObjects;

// pick battery
_batteryTypes = [];
{
	_batterytypes pushBack (_x select 0);
} forEach _batteries;

_pickBatteryResult = [
		"Pick battery to fire.",
		[
			["Battery", _batteryTypes]
		]] call Ares_fnc_ShowChooseDialog;
	
// Pick a battery
_battery = nil;
if (count _pickBatteryResult > 0) then 
{
	_battery = _batteries select (_pickBatteryResult select 0);
};

// Pick fire mission details
_fireMission = nil;
if (count _battery > 0) then
{
	_units = _battery select 1;
	_artilleryAmmo = _battery select 2;
	
	_numberOfGuns = [];
	{
		_numberOfGuns pushBack (str (_forEachIndex + 1));
	} forEach _units;
	
	// pick guns, rounds, ammo and coordinates
	_pickFireMissionResult = [
		"Pick fire mission details.",
		[
			["Guns", _numberOfGuns],
			["Rounds", ""],
			["Ammo", _artilleryAmmo],
			["X", ""],
			["Y", ""]
		]] call Ares_fnc_ShowChooseDialog;
	
	if (count _pickFireMissionResult > 0) then 
	{
		// TODO: Add validation that coordinates are actually numbers.
		_guns = (_numberOfGuns select (_pickFireMissionResult select 0));
		_rounds = _pickFireMissionResult select 1;
		_ammo = (_artilleryAmmo select (_pickFireMissionResult select 2));
		_targetX = _pickFireMissionResult select 3;
		_targetY = _pickFireMissionResult select 4;
		
		_fireMission = [_units, parseNumber _guns, parseNumber _rounds, _ammo, _targetX, _targetY];
	};	
};

// confirm and execute fire mission
if (count _fireMission > 0) then {
  _units = _fireMission select 0;
  _guns = _fireMission select 1;
  _rounds = _fireMission select 2;
  _ammo = _fireMission select 3;
  _targetX = _fireMission select 4;
  _targetY = _fireMission select 5; 
  
  // TODO: estimated flight time
  // TODO: Dialog without leaving zeus
  _message = format ["Confirm Fire Mission \n Battery %1 \n GRID %2 %3 \n %4 Guns %5 Rounds %6", (_battery select 0), _targetX, _targetY, _guns, _rounds, _ammo];
  //_result = [_message, "Confirm Fire Mission", true, true] call BIS_fnc_guiMessage;  
  
  if (/*_result*/ true) then 
  { 
	
	enableEngineArtillery true;
	if (isNil "Ares_FireArtilleryFunction") then
	{
		Ares_FireArtilleryFunction = {
			_artilleryUnit = _this select 0;
			_targetPos = _this select 1;
			_ammoType = _this select 2;
			_roundsToFire = _this select 3;
			enableEngineArtillery true;
			_artilleryUnit commandArtilleryFire [_targetPos, _ammoType, _roundsToFire];
		};
		publicVariable "Ares_FireArtilleryFunction";
	};
	
	_targetPos = [_targetX,_targetY] call CBA_fnc_mapGridToPos;

	
	_roundEta = 0;
	for "_i" from 1 to _guns do {
	  _artillery = _units select _i - 1;
	  
	  // TODO: add overlay for each shot
	  _roundEta = _artillery getArtilleryETA [_targetPos, _ammo];
	  	  
	  [[_artillery, _targetPos, _ammo, _rounds], "Ares_FireArtilleryFunction", _artillery] call BIS_fnc_MP;
	};

	[objNull, format ["Firing %1 rounds of '%2' at target. ETA %3", _rounds, _ammo, _roundEta]] call bis_fnc_showCuratorFeedbackMessage;
  } 
  else 
  {
    hint "Fire mission aborted!";
  }
};

#include "\ares_zeusExtensions\module_footer.hpp"
