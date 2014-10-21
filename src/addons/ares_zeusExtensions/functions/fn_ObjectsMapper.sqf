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
_newAnchorX = (getPosASL _newAnchorObject) select 0;
_newAnchorY = (getPosASL _newAnchorObject) select 1;
_newAnchorZ = (getPosASL _newAnchorObject) select 2;

{
	private ["_type", "_originalPosition", "_azimuth", "_fuel", "_damage", "_orientation", "_newObj"];
	_type = _x select 0;
	_originalPosition = _x select 1;
	_azimuth = _x select 2;
	
	//Optionally map certain features if they're included in the data. Order must match the grabber order.
	if ((count _x) > 3) then {_fuel = _x select 3};
	if ((count _x) > 4) then {_damage = _x select 4};
	if ((count _x) > 5) then {_orientation = _x select 5};

	if (_useAbsolutePositions) then
	{
		_newObj = createVehicle [_type, (ASLToATL _originalPosition), [], 0, "CAN_COLLIDE"];
		//_newObj setPosASL _originalPosition; // Just in case?
	}
	else
	{
		
		// The new position = (new anchor position) + (old position relative to anchor)
		//                  = (new anchor position) + (old absolute position - old anchor position)
		_newPos = [
			_newAnchorX + ((_originalPosition select 0) - (_originalAnchorPosition select 0)),
			_newAnchorY + ((_originalPosition select 1) - (_originalAnchorPosition select 1)),
			0
			];

		_newObj = createVehicle [_type, _newPos, [], 0, "CAN_COLLIDE"];
		_heightAboveTerrainAtOriginalPosition = (_originalPosition select 2) - (getTerrainHeightASL _originalPosition);
		if (_heightAboveTerrainAtOriginalPosition > 0.1) then
		{
			_newHeightASL = (getTerrainHeightASL _newPos) + _heightAboveTerrainAtOriginalPosition;
			_newObj setPosASL [_newPos select 0, _newPos select 1, _newHeightASL];
		};
	};
	
	// Orient the object correctly
	_newObj setDir (_azimuth);
	
	//If fuel and damage were grabbed, map them
	if (!isNil "_fuel") then {_newObj setFuel _fuel};
	if (!isNil "_damage") then {_newObj setDamage _damage;};
	if (!isNil "_orientation" && _preserveOrientations && ((count _orientation) > 0)) then 
	{
		([_newObj] + _orientation) call BIS_fnc_setPitchBank;
	};
	_newObjs pushback _newObj;
} forEach _objs;

_newObjs