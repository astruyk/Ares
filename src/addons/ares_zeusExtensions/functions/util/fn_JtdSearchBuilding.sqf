/* 
Purpose: have an AI squad search a building.

Parameters:
	0 - Group or Object - The group (or a member of the group) that will be searching the building.
	1 - (Optional) Number - The radius around the group leader to use when generating the set of possible buildings to search. Default 50.
	2 - (Optional) String - The strategy to use when choosing which of the candidate houses to search. One of "NEAREST" or "RANDOM". Default "RANDOM".
	3 - (Optional) Position Array - The center point to use as the search. Default is group leader position.
	4 - (Optional) Boolean - True to include the group leader in the search, False to have him wait outside. Default is 'False'.
	5 - (Optional) Boolean - True to have units stay in their building positions, false to return outside after completing the search. Default false.

JTD Building Search Script
	by Trexian
Credits:
	OFPEC
	Rommel for CBA function searchNearby
	Tophe for random house patrol

Testers/Feedback:
	MadRussian
	GvsE
	Kremator
	Manzilla
	
	Imported from http://forums.bistudio.com/showthread.php?112775-JTD-Building-Search-script
	Modified by Anton Struyk
*/

// Must be run on the server.
if !(isServer) exitWith {diag_log text "Not server, exiting building search.";};

private ["_grpFM", "_FunctionsManager", "_group", "_leader", "_ldrPos", "_previousBehaviour", "_srchRad", "_whichOne", "_initialPos", "_includeLeaderInSearch", "_occupy", "_bldgArray", "_tempArray", "_bldgLoc", "_bldgSelect", "_searchersT", "_searchers", "_searcherCount", "_s", "_checkTime", "_wpArray", "_currWP", "_wpCnt", "_d", "_t", "_b", "_bldg", "_bldgPos", "_bldgCnt", "_nameMarker", "_marker", "_bldgBB", "_wpRad", "_wp", "_positionsInBuilding", "_totTime", "_activeBP", "_loop", "_cycle", "_unitSelect", "_units"];

// Extract necessary values from parameters
_group = [_this, 0] call BIS_fnc_param;
if ((typeName _group) == "OBJECT") then {_group = group (_this select 0)};
_leader = leader _group;
_ldrPos = getPos _leader;
_previousBehaviour = behaviour _leader;
_srchRad = [_this, 1, 50, [1]] call BIS_fnc_param;
_whichOne = [_this, 2, "RANDOM", ["RANDOM"]] call BIS_fnc_param;
_initialPos = [_this, 3, _ldrPos, [[]], 3] call BIS_fnc_param;
_includeLeaderInSearch = [_this, 4, false, [false]] call BIS_fnc_param;
_occupy = [_this, 5, false, [false]] call BIS_fnc_param;

// This file needs to be Self-Contained and use only standard BIS functions
// since it will be run on the server and Ares functions may not be available.
_arrayShuffle = {
	private ["_array", "_count", "_arrayT", "_arrayN", "_c", "_r"];
	_array = _this select 0;
	_count = count _array;
	_arrayN = [];
	_arrayT = [];
	_c = 0;
	_r = 0;

	while {_c < (count _array)} do
	{
		while {_r in _arrayT} do
		{_r = floor (random (count _array));
		};
		_arrayT = _arrayT + [_r];
		_arrayN set [_c, _array select _r];
		_c = _c + 1;
	};

	_arrayN
};

// Check parameters
if (_srchRad < 1) then {_srchRad = 1};
if ((_whichOne != "NEAREST") && (_whichOne != "RANDOM")) then {_whichOne = "RANDOM"};

// remove group's waypoints
_wpArray = waypoints _group;
_wpCnt = count _wpArray;
if (_wpCnt > 1) then
{
	for [{_d = 0}, {_d <= _wpCnt}, {_d = _d + 1}] do
	{
		deleteWaypoint [_group, _d];
	};
};

// Go through all the nearby buildings and make sure they at least have one searchable space. If they
// do then add them to our list of candidates.
_bldgArray = [];
_tempArray = nearestObjects [_initialPos, ["HOUSE"], _srchRad];
_t = count _tempArray;  // count number of buildings in array
_t = _t - 1;
for [{_b = 0},{_b <= _t},{_b = _b+1}] do
{
	_bldg = _tempArray select _b;
	_bldgPos = _bldg buildingPos 0;
	if (((_bldgPos select 0) != 0) && ((_bldgPos select 1) != 0)) then
	{
		_bldgArray = _bldgArray + [_bldg];
	};
};

// Check that we could actually find a building to search.
_bldgCnt = count _bldgArray;
if (_bldgCnt == 0) exitWith 
{
	diag_log text "No buildings to search!";
	false
};

// Choose the building to be searched - either the nearest or a random one.
_bldgSelect = [];
if (_whichOne == "NEAREST") then
{
	// nearestObjects is sorted from nearest -> furthest objects. Since we didn't change the order when
	// we filtered candidate houses we can just choose the first element here.
	_bldgSelect = _bldgArray select 0;
}
else
{
    _bldgSelect = _bldgArray call BIS_fnc_selectRandom;
};

_bldgLoc = getPos _bldgSelect;

// Make the group move near the building before starting the search
_bldgBB = boundingBox _bldgSelect;        // [[minX, minY, minZ], [maxX, maxY, maxZ]] 
_wpRad = ((abs((_bldgBB select 0) select 0) + abs((_bldgBB select 1) select 0)) max (abs((_bldgBB select 0) select 1) + abs((_bldgBB select 1) select 1))) + 10;    // gets the longest side of the building + 10
_wp = _group addWaypoint [_bldgLoc, _wpRad];
_wp setWaypointPosition [_bldgLoc, 1];
_wp setWaypointType "MOVE";
_group setCurrentWaypoint _wp;
waituntil {unitready _leader};

// Make the group ready for shootin'
_group setbehaviour "combat";

// Generate an array of all the positions in the building to search.
_positionsInBuilding = [];
while { str(_bldgSelect buildingPos (count _positionsInBuilding)) != "[0,0,0]" }
do { _positionsInBuilding = _positionsInBuilding + [(_bldgSelect buildingPos (count _positionsInBuilding))]; };

// Determine the list of potential searchers. Only allocate the same number of searchers
// as there are positions in the building.
_searchers = [];
{
	if (_includeLeaderInSearch || (leader _group != _x)) then
	{
		if (!isNull _x && alive _x) then
		{
			_x setVariable ["Ares_isSearching", false];
			_searchers = _searchers + [_x];
		};
	};
	
	if (count _searchers >= count _positionsInBuilding) exitWith {};
} forEach (units _group);

// Shuffle the order of the searcher array so that we have somewhat varied search behaviour.
// This way the same guys don't search the same places if you do things twice.
_searchers = [_searchers] call _arrayShuffle;

// Record the time that the search started at so we can bail if it takes too long.
_checkTime = daytime;
_totTime = (count _positionsInBuilding) * .009;        // roughly 30 seconds per position

// loop to string out the units
scopeName "bldgSearchMainScope";
{
	// Get the first searcher that is available for tasking. If none
	// is available for tasking wait until one becomes available.
	_currentSearcherIndex = -1;
	while {true} do
	{
		if (!alive _leader) then
		{
			// Dump out of the entire search loop if the leader dies.
			_occupy = false;
			breakTo "bldgSearchMainScope";
		};
		
		if (daytime > _checkTime + _totTime) then
		{
			// Search is taking too long. Abort
			breakTo "bldgSearchMainScope";
		};

		// Look for a ready searcher
		_aliveSearcherCount = 0;
		{
			if (alive _x) then
			{
				_aliveSearcherCount = _aliveSearcherCount + 1;
				if (not (_x getVariable ["Ares_isSearching", false])) exitWith { _currentSearcherIndex = _foreachIndex; };
				//if (unitready _x) exitWith { _currentSearcherIndex = _foreachIndex; };
			};
		} foreach _searchers;

		if (_currentSearcherIndex != -1 || _aliveSearcherCount == 0) exitWith {};

		// Wait a bit and try again.
		sleep 1;
	};

	if (_currentSearcherIndex != -1) then
	{
		// Send the searcher to the current building position.
		_positionToSearch = _x;
		_searcher = _searchers select _currentSearcherIndex;
		_searcher doMove _positionToSearch;
		_searcher setVariable ["Ares_isSearching", true];
		_searcher spawn
		{
			waitUntil { moveToCompleted _this || moveToFailed _this; };
			_this setVariable ["Ares_isSearching", false];
		};
	};
} foreach _positionsInBuilding;

_group setbehaviour _previousBehaviour;

// check if occupy is specified
if !(_occupy) then
{
	// need some sort of wait to make sure they are ready
	//_ldrPos = getPos _leader;
	{
		_x doMove _ldrPos;
		waitUntil { moveToCompleted _x };
		_x doFollow _leader;

	} foreach _searchers;
};

true  