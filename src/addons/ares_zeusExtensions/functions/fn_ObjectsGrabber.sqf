/*
	File: objectGrabber.sqf
	Author: Joris-Jan van 't Land

	Description:
	Converts a set of placed objects to an object array for the DynO mapper.
	Places this information in the debug output for processing.

	Parameter(s):
	_this select 0: position of the anchor point (Array)
	_this select 1: size of the covered area (Scalar)
	_this select 2: grab object orientation? (Boolean) [default: false]

	Returns:
	Ouput text (String)

	(Modified for use with Ares by AntonStruyk)
*/

private ["_anchorObject", "_anchorDim", "_grabOrientation"];
_anchorObject = [_this, 0] call BIS_fnc_Param;
_anchorDim = [_this, 1, 50, [-1]] call BIS_fnc_Param;

private ["_objs"];
_objs = nearestObjects [(position _anchorObject), ["All"], _anchorDim];

//First filter illegal objects
{
	//Exclude non-dynamic objects (world objects)
	private ["_allDynamic", "_excludeFlag", "_objectType"];
	_allDynamic = allMissionObjects "All";

	_excludeFlag = false;
	if (_x in _allDynamic) then
	{
		//Exclude characters
		private ["_sim"];
		_sim = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "simulation");

		if (_sim in ["soldier"]) then
		{
			_excludeFlag = true;
		};
	}
	else
	{
		_excludeFlag = true;
	};
	
	 _objectType = typeOf _x;
	 _typeBlacklist = [
		"Ares_Module_Save_Objects_For_Paste",
		"GroundWeaponHolder",
		"Salema_F",
		"Ornate_random_F",
		"Mackerel_F",
		"Tuna_F",
		"Mullet_F", 
		"CatShark_F",
		"Rabbit_F",
		"Snake_random_F",
		"Turtle_F",
		"Hen_random_F",
		"Cock_random_F",
		"Cock_white_F",
		"Sheep_random_F"];
	if (_objectType in _typeBlacklist || _x == player) then
	{
		_excludeFlag = true;
	};
	
	if (_excludeFlag) then
	{
		_objs set [_forEachIndex, -1];
	};
} forEach _objs;

_objs = _objs - [-1];

//Formatting for output
private ["_br", "_tab", "_outputText"];
_br = toString [13, 10];
_tab = toString [9];

// Start the output
_outputText = "[";

//Process non-filtered objects
_objectsToSave = [];
{
	private ["_type", "_objPos", "_dX", "_dY", "_z", "_azimuth", "_fuel", "_damage", "_outputArray"];
	_type = typeOf _x;
	_objPos = getPosASL _x;
	_xPos = _objPos select 0;
	_yPos = _objPos select 1;
	_zPos = _objPos select 2;
	_azimuth = direction _x;
	_fuel = fuel _x;
	_damage = damage _x;

	_outputArray = [_type, [_xPos, _yPos, _zPos], _azimuth, _fuel, _damage];
	_outputText = _outputText + (str _outputArray);
	_outputText = _outputText + ",";
} forEach _objs;

// Add an entry for holding the anchor position. This will be extracted if we want to do a relative paste later.
_outputText = _outputText + format ["[%1, %2, %3]", (getPosASL _anchorObject) select 0,  (getPosASL _anchorObject) select 1, (getPosASL _anchorObject) select 2] + "]";
copyToClipboard _outputText;
_outputText