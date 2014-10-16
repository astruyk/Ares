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

private ["_pos", "_objs"];
_pos = [_this, 0, [0, 0], [[]]] call BIS_fnc_Param;
_objs = [_this, 1, [[0,0,0]], [[]]] call BIS_fnc_Param;

// The copy script will have added the reference point as the last object in the array.
// Get the position from it, and then remove it from the array so we no longer process it.
_anchorPosition = _objs select ((count _objs) - 1);
_objs resize ((count _objs) - 1);

//Make sure there are definitions in the final object array
if ((count _objs) == 0) exitWith {debugLog "Log: [BIS_fnc_objectMapper] No elements in the object array!"; []};

private ["_newObjs"];
_newObjs = [];

private ["_posX", "_posY", "_useAbsolutePositions"];
_posX = _pos select 0;
_posY = _pos select 1;
_useAbsolutePositions = _posX == 0 && _posY == 0;

//Function to multiply a [2, 2] matrix by a [2, 1] matrix
private ["_multiplyMatrixFunc"];
_multiplyMatrixFunc =
{
	private ["_array1", "_array2", "_result"];
	_array1 = _this select 0;
	_array2 = _this select 1;

	_result =
	[
		(((_array1 select 0) select 0) * (_array2 select 0)) + (((_array1 select 0) select 1) * (_array2 select 1)),
		(((_array1 select 1) select 0) * (_array2 select 0)) + (((_array1 select 1) select 1) * (_array2 select 1))
	];

	_result
};

{
	private ["_type", "_relPos", "_azimuth", "_fuel", "_damage", "_orientation", "_ASL", "_newObj"];
	_type = _x select 0;
	_relPos = _x select 1;
	_azimuth = _x select 2;
	
	//Optionally map certain features if they're included in the data. Order must match the grabber order.
	if ((count _x) > 3) then {_fuel = _x select 3};
	if ((count _x) > 4) then {_damage = _x select 4};
	if ((count _x) > 5) then {_orientation = _x select 5};
	if ((count _x) > 6) then {_ASL = _x select 6};
	if (isNil "_ASL") then {_ASL = false;};

	_newPos = [_relPos select 0, _relPos select 1, _relPos select 2];
	if (!_useAbsolutePositions) then
	{
		// The new position = (new anchor position) + (old position relative to anchor)
		//                  = (new anchor position) + (old absolute position - old anchor position)
		_newPos = [
			_posX + ((_newPos select 0) - (_anchorPosition select 0)),
			_posY + ((_newPos select 1) - (_anchorPosition select 1)),
			_newPos select 2
			];
	};

	//Create the object and make sure it's in the correct location
	_newObj = _type createVehicle _newPos;
	_newObj setDir (_azimuth);
	if (!_ASL) then {_newObj setPos _newPos;} else {_newObj setPosASL _newPos;};
	
	//If fuel and damage were grabbed, map them
	if (!isNil "_fuel") then {_newObj setFuel _fuel};
	if (!isNil "_damage") then {_newObj setDamage _damage;};
	if (!isNil "_orientation") then 
	{
		if ((count _orientation) > 0) then 
		{
			([_newObj] + _orientation) call BIS_fnc_setPitchBank;
		};
	};
	_newObjs = _newObjs + [_newObj];
} forEach _objs;

_newObjs