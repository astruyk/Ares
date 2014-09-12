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

	(Modified for use with Ares)
*/

private ["_anchorPos", "_anchorDim", "_grabOrientation"];
_anchorPos = [_this, 0, [0, 0], [[]]] call BIS_fnc_Param;
_anchorDim = [_this, 1, 50, [-1]] call BIS_fnc_Param;
_grabOrientation = [_this, 2, false, [false]] call BIS_fnc_Param;

private ["_objs"];
_objs = nearestObjects [_anchorPos, ["All"], _anchorDim];

//Formatting for output
private ["_br", "_tab", "_outputText"];
_br = toString [13, 10];
_tab = toString [9];

//Adding meta-data
//_outputText = "/*" + _br + "Grab data:" + _br;
//_outputText = _outputText + "Mission: " + (if (missionName == "") then {"Unnamed"} else {missionName}) + _br;
//_outputText = _outputText + "World: " + worldName + _br;
//_outputText = _outputText + "Anchor position: [" + (str (_anchorPos select 0)) + ", " + (str (_anchorPos select 1)) + "]" + _br;
//_outputText = _outputText + "Area size: " + (str _anchorDim) + _br;
//_outputText = _outputText + "Using orientation of objects: " + (if (_grabOrientation) then {"yes"} else {"no"}) + _br + "*/" + _br + _br;
//_outputText = _outputText + "[" + _br;
_outputText = "[" + _br;

//First filter illegal objects
{
	//Exclude non-dynamic objects (world objects)
	private ["_allDynamic"];
	_allDynamic = allMissionObjects "All";

	if (_x in _allDynamic) then
	{
		//Exclude characters
		private ["_sim"];
		_sim = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "simulation");

		if (_sim in ["soldier"]) then
		{
			_objs set [_forEachIndex, -1];
		};
	}
	else
	{
		_objs set [_forEachIndex, -1];
	};
} forEach _objs;

_objs = _objs - [-1];

//Process remaining objects
{
	private ["_type", "_ASL", "_objPos", "_dX", "_dY", "_z", "_azimuth", "_fuel", "_damage", "_orientation", "_varName", "_init", "_simulation", "_replaceBy", "_outputArray"];
	_type = typeOf _x;
	_ASL = _x getVariable ["ASL", false];
	if (!_ASL) then {_objPos = position _x;} else {_objPos = getPosASL _x;}; //To cover some situations (inside objects with multiple roadways)
	_dX = (_objPos select 0) - (_anchorPos select 0);
	_dY = (_objPos select 1) - (_anchorPos select 1);
	_z = _objPos select 2;
	_azimuth = direction _x;
	_fuel = fuel _x;
	_damage = damage _x;
	if (_grabOrientation) then {_orientation = _x call BIS_fnc_getPitchBank;} else {_orientation = [];};
	_varName = vehicleVarName _x;
	_init = _x getVariable ["init", ""];
	//TODO: re-enable once 3D editor simulation is fixed
	//_simulation = simulationEnabled _x;
	_simulation = _x getVariable ["simulation", true];

	_replaceBy = _x getVariable ["replaceBy", ""];
	if (_replaceBy != "") then {_type = _replaceBy;};

	_outputArray = [_type, [_dX, _dY, _z], _azimuth, _fuel, _damage, _orientation, _varName, _init, _simulation, _ASL];
	_outputText = _outputText + _tab + (str _outputArray);
	_outputText = if (_forEachIndex < ((count _objs) - 1)) then {_outputText + ", " + _br} else {_outputText + _br};

	debugLog (format ["Log: objectGrabber: %1", _outputArray]);
} forEach _objs;

_outputText = _outputText + "]";
copyToClipboard _outputText;

_outputText