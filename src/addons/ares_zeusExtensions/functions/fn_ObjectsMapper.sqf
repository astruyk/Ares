/*
	File: objectMapper.sqf
	Author: Joris-Jan van 't Land

	Description:
	Takes an array of data about a dynamic object template and creates the objects.

	Parameter(s):
	0: (Position) - The anchor point to position the objects relative to or [0,0,0] for absolute positioning.
	1: (Array of data) - The data for the objects to paste in. See Ares_fnc_ObjectsGrabber.

	Returns:
	Created objects (Array)
	
	Modified for Ares by Anton Struyk
*/

private ["_newAnchorObject", "_objs", "_preserveOrientations"];
_newAnchorObject = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_objs = [_this, 1, [[0,0,0]], [[]]] call BIS_fnc_Param;
_preserveOrientations = [_this, 2, false, [false]] call BIS_fnc_Param;

// The copy script will have added the reference point as the last object in the array.
// Get the position from it, and then remove it from the array so we no longer process it.
_originalAnchorPosition = _objs select ((count _objs) - 1);
_objs resize ((count _objs) - 1);

//Make sure there are definitions in the final object array
if ((count _objs) == 0) exitWith {debugLog "Log: [BIS_fnc_objectMapper] No elements in the object array!"; []};

private ["_newObjs"];
_newObjs = [];

private ["_useAbsolutePositions"];
_useAbsolutePositions = isNull _newAnchorObject;

private ["_newAnchorX", "_newAnchorY", "_newAnchorZ"];
_newAnchorX = (position _newAnchorObject) select 0;
_newAnchorY = (position _newAnchorObject) select 1;
_newAnchorZ = (position _newAnchorObject) select 2;

{
	private ["_type", "_originalPosition", "_azimuth", "_fuel", "_damage", "_orientation", "_ASL", "_newObj"];
	_type = _x select 0;
	_originalPosition = _x select 1;
	_azimuth = _x select 2;
	
	//Optionally map certain features if they're included in the data. Order must match the grabber order.
	if ((count _x) > 3) then {_fuel = _x select 3};
	if ((count _x) > 4) then {_damage = _x select 4};
	if ((count _x) > 5) then {_orientation = _x select 5};
	if ((count _x) > 6) then {_ASL = _x select 6};
	if (isNil "_ASL") then {_ASL = false;};

	_newPos = [_originalPosition select 0, _originalPosition select 1, _originalPosition select 2];
	if (!_useAbsolutePositions) then
	{
		// The new position = (new anchor position) + (old position relative to anchor)
		//                  = (new anchor position) + (old absolute position - old anchor position)
		_newPos = [
			_newAnchorX + ((_originalPosition select 0) - (_originalAnchorPosition select 0)),
			_newAnchorY + ((_originalPosition select 1) - (_originalAnchorPosition select 1)),
			_newAnchorZ + ((_originalPosition select 2) - (_originalAnchorPosition select 2))
			];
	};

	//Create the object and make sure it's in the correct location
	_newObj = _type createVehicle _newPos;
	_newObj setDir (_azimuth);
	if (!_ASL) then {_newObj setPos _newPos;} else {_newObj setPosASL _newPos;};
	
	//If fuel and damage were grabbed, map them
	if (!isNil "_fuel") then {_newObj setFuel _fuel};
	if (!isNil "_damage") then {_newObj setDamage _damage;};
	if (!isNil "_orientation" && _preserveOrientations && ((count _orientation) > 0)) then 
	{
		([_newObj] + _orientation) call BIS_fnc_setPitchBank;
	};
	_newObjs = _newObjs + [_newObj];
} forEach _objs;

_newObjs