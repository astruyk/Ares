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
//// THERE IS A BUG HERE. ALL UNITS GO IN ALL BATTERIES.
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
			
			_units pushBack _unit;
			
		} forEach _batteries;
	};
	
} forEach _filteredObjects;

// DEBUG
_batteries call BIS_fnc_log;

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

// DEBUG
_pickBatteryResult call BIS_fnc_log;		
		
_battery = nil;
if (count _pickBatteryResult > 0) then 
{
	_battery = _batteries select (_pickBatteryResult select 0);
};

// DEBUG
_battery call BIS_fnc_log;

_pickFireMissionResult = nil;
if (count _battery > 0) then
{
	_units = _battery select 1;
	_artilleryAmmo = _battery select 2;
	
	// DEBUG
	_units call BIS_fnc_log;
	_artilleryAmmo call BIS_fnc_log;
	
	_numberOfGuns = [];
	{
		_numberOfGuns pushBack (str (_forEachIndex + 1));
	} forEach _units;
	
	// pick guns, rounds, ammo and coordinates
	_pickFireMissionResult = [
		"Pick fire mission details.",
		[
			["Guns", _numberOfGuns],
			["Rounds", []],
			["Ammo", _artilleryAmmo],
			["X", []],
			["Y", []]
		]] call Ares_fnc_ShowChooseDialog;
};


#include "\ares_zeusExtensions\module_footer.hpp"
