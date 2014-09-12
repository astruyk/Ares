// Imported from http://forums.bistudio.com/showthread.php?112775-JTD-Building-Search-script
// Modified by Anton Struyk
/* JTD Building Search Script
by Trexian

Purpose: have an AI squad search a building.

Implementation: executed from trigger or script (can be as a function)
ooooooooooooooooooooooooooooooooooooooooooooooooooo
Usage:
Requires 1 parameter, with an option for 4 more: group(, searchRadius , "NEAREST" or "RANDOM", initial position, include leader, occupy building)
group = group that will be searching the building (required)
searchRadius = number that is radius around the leader to use to generate the array of buildings (default is 50) (optional)
NEAREST/RANDOM = string that tells the script which building, either the nearest to the position or a random one (default is random) (optional)
initial position = position array or object  around which to search (default is leader's position at script execution) (optional)
include leader = boolean, where 'true' includes the leader in the search (default is false, but if group has 2 or less, default is true) (optional)
occupy building = boolean, where 'true' means that the group will stay in the building positions (default is false)

ooooooooooooooooooooooooooooooooooooooooooooooooooo
Credits:
OFPEC
Rommel for CBA function searchNearby
Tophe for random house patrol

Testers/Feedback:
MadRussian
GvsE
Kremator
Manzilla
ooooooooooooooooooooooooooooooooooooooooooooooooooo
Version:
01a
POC (addWaypointHousePosition doesn't work)

01b
used CBA searchNearby by Rommel for commandMove instead of waypoints

01c
Improved methodology

01d - release version
Improved the rejoining of the searchers
Added ability to specify initial position of building search

01e
Added optional parameter to include leader in search, also an option to occupy the building
More robust error-checking
Can pass object instead of intialposition
Shuffles searcher array

01f - release version
Added server check
Added global JTD_lockedSearchGroups
Added time check to make sure script ends at some point

01g - release version
Added JTD_bldgsrchPath as variable for Manzilla
Array functionality wrapper

ooooooooooooooooooooooooooooooooooooooooooooooooooo
TTD:

ooooooooooooooooooooooooooooooooooooooooooooooooooo
*/

if !(isServer) exitWith {diag_log text "Not server, exiting building search.";};

//diag_log text "JTD bldg search activated";

private ["_grpFM", "_FunctionsManager", "_group", "_leader", "_ldrPos", "_behaviour", "_srchRad", "_whichOne", "_initialPos", "_andOne", "_occupy", "_bldgArray", "_tempArray", "_bldgLoc", "_bldgSelect", "_searchersT", "_searchers", "_searcherCount", "_s", "_checkTime", "_wpArray", "_currWP", "_wpCnt", "_d", "_t", "_b", "_bldg", "_bldgPos", "_bldgCnt", "_nameMarker", "_marker", "_bldgBB", "_wpRad", "_wp", "_p", "_totTime", "_activeBP", "_loop", "_cycle", "_unitSelect", "_units"];

if (isNil "JTD_bldgsrchPath") then {JTD_bldgsrchPath = "";};

// check for functions
if (isNil "bis_fnc_init") then
{
    createCenter sideLogic;
    _grpFM = createGroup sideLogic;
    _FunctionsManager = _grpFM createUnit ["FunctionsManager", [1, 1, 1], [], 0, "NONE"];
    waitUntil {!isNil "bis_fnc_init"};
};

if (isNil "JTD_arrayShuffleFunc") then
{
    JTD_arrayShuffleFunc = compile preprocessFileLineNumbers (JTD_bldgsrchPath +"JTD_arrayShuffle.sqf");
};

if (isNil "JTD_lockedSearchGroups") then {JTD_lockedSearchGroups = [];};

_group = _this select 0;
JTD_lockedSearchGroups = JTD_lockedSearchGroups + [_group];
if ((typeName _group) == "OBJECT") then {_group = group (_this select 0)};

//diag_log text format ["group searching: %1", _group];
_leader = leader _group;
//diag_log text format ["group leader: %1", _leader];
_ldrPos = getPos _leader;
_behaviour = behaviour _leader;
if ((count _this) >= 2) then {
    _srchRad = _this select 1;}
    else {
    _srchRad = 50;};
if ((count _this) >= 3) then {
    _whichOne = _this select 2;
    } else {
    _whichOne = "RANDOM";};
if ((count _this) >=4) then {
    _initialPos = _this select 3;
    } else {
    _initialPos = _ldrPos;};
if ((count _this) >=5) then {
    _andOne = _this select 4;
    } else {
    _andOne = false;};
if ((count _this) >=6) then {
    _occupy = _this select 5;
    } else {
    _occupy = false;};

_bldgArray = [];
_tempArray = [];
_bldgLoc = [];
_bldgSelect = [];
_searchersT = [];
_searchers = [];
_searcherCount = 0;
_s = 0;

// error catching
if (isNil "_leader") exitWith
{
    diag_log text "No valid leader selected!";
    false
};
if (isNil "_srchRad") then {_srchRad = 50};
if (_srchRad < 1) then {_srchRad = 1};
if (isNil "_whichOne") then {_whichOne = "RANDOM"};
if ((_whichOne != "NEAREST") || (_whichOne != "RANDOM")) then {_whichOne = "RANDOM"};
if (isNil "_initialPos") then {_initialPos = _ldrPos};
if ((typeName _initialPos) == "OBJECT") then {_initialPos = getPos (this select 3)};
if ((typeName _initialPos) != "ARRAY") then {_initialPos = _ldrPos};
if (isNil "_andOne") then
{
    if ((count (units _group)) < 3) then
    {
        _andOne = true;
    }
    else
    {
        _andOne = false;
    };
};
if ((typeName _andOne) != "BOOL") then {_andOne = false};
if (isNil "_occupy") then {_occupy = false};
if ((typeName _occupy) != "BOOL") then {_occupy = false};

// gets time that script starts
_checkTime = daytime;

// remove group's waypoints
_wpArray = waypoints _group;
//_currWP = currentWaypoint _group;
_wpCnt = count _wpArray;

if (_wpCnt > 1) then
{
    for [{_d = 0}, {_d <= _wpCnt}, {_d = _d + 1}] do
        {
            deleteWaypoint [_group, _d];
        };
};

// building check
_tempArray = nearestObjects [_initialPos, ["HOUSE"], _srchRad];
_t = count _tempArray;  // count number of buildings in array

//for each building, find building position
//this should serially select each building in the array, then remove it if position 0 (1) is 0,0,0

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

_bldgCnt = count _bldgArray;
if (_bldgCnt == 0) exitWith 
{
    diag_log text "No buildings to search!";
    false
};

// select building - either the nearest or the randomest
if (_whichOne == "NEAREST") then
{
    _bldgSelect = _bldgArray select 0;        // need to do a real distance check?
    //_bldgSelect = nearestBuilding (getPos _leader);
}
else
{
    _bldgSelect = _bldgArray call BIS_fnc_selectRandom;
};

_bldgLoc = getPos _bldgSelect;

if (JTD_searchDebug) then
{
    _nameMarker = format ["srch_%1", str _bldgSelect];
    _marker = createMarkerLocal [_nameMarker, [_bldgLoc select 0, _bldgLoc select 1]];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "dot";
    _marker setMarkerColor "ColorRed";
};

// set new waypoint for near the building for the group
_bldgBB = boundingBox _bldgSelect;        // [[minX, minY, minZ], [maxX, maxY, maxZ]] 
_wpRad = ((abs((_bldgBB select 0) select 0) + abs((_bldgBB select 1) select 0)) max (abs((_bldgBB select 0) select 1) + abs((_bldgBB select 1) select 1))) + 10;    // gets the longest side of the building + 10
_wp = _group addWaypoint [_bldgLoc, _wpRad];
_wp setWaypointPosition [_bldgLoc, 1];
_wp setWaypointType "MOVE";
_group setCurrentWaypoint _wp;

//_group lockwp true;
waituntil {unitready _leader};

_group setbehaviour "combat";

// find building position max
_p = 0;        // will end up being the total number of building positions
while {str(_bldgSelect buildingPos _p) != "[0,0,0]"} do {_p = _p + 1;};

// check if more units than positions (or equal), if so, select which ones to search
// gets the lesser of available units or positions

_totTime = _p * .009;        // roughly 30 seconds per position
scopeName "bldgSearchMainScope";
// loop through each unit to identify the searchers
if (_andOne) then
{
    _searcherCount = (count (units _group)) min _p;
    _s = 0;
}
else
{
    _searcherCount = ((count (units _group)) - 1) min _p;
    _s = 1;
};
//diag_log text format ["searchers = %1  (%2, %3)", _searcherCount, ((count (units _group)) - 1), _p];
    while {_s <= _searcherCount} do
    {
        if !(isNull ((units _group) select _s)) then
        {
            // start at #2 (which is select 1) and add searchers up to number of house positions
            _searchersT = _searchersT + [(units _group) select _s];
        };
        _s = _s + 1;
    };

// shuffle
//diag_log text format ["searcher temp array = %1", _searchersT];
_searchers = [_searchersT] call JTD_arrayShuffleFunc;
//diag_log text format ["searcher array = %1", _searchers];
// loop to string out the units

_activeBP = 0;        // building position iterator
while {_activeBP < _p} do
{
    _s = 0;            // searcher iterator
    _loop = 0;
    // searcher assignment loop
    _cycle = _activeBP;    // cycle through searchers based on house position number
    while {_loop <= _activeBP} do
    {
        _bldgPos = _bldgSelect buildingPos _cycle;
        _unitSelect = _searchers select _s;
        //diag_log text format ["unit select %1 bpos %2 %3", _unitSelect, _bldgPos, _cycle];
         if (unitready _unitSelect) then
        {
            _unitSelect commandmove _bldgPos;
            //_unitSelect domove _bldgPos;
            _unitSelect spawn 
            {
                sleep 5;
                waituntil {unitready _this};        // try without this, too?
            };
        };
        _s = _s + 1;
        if (_s >= (count _searchers)) then {_loop = _activeBP};    // break out of loop if out of searchers
        _cycle = _cycle - 1;
        _loop = _loop + 1;
        
        // time check
        if (daytime > (_checkTime + _totTime)) then
        {
            breakTo "bldgSearchMainScope";
            if (JTD_searchDebug) then
            {
                diag_log text "Building search taking too long, exiting";
            };
        };
        if (! alive (leader group (_searchers select _s))) then
        {
            breakTo "bldgSearchMainScope";
            _occupy = false;
            if (JTD_searchDebug) then
            {
                diag_log text "No leader of search group";
            };
        };
    };
    _activeBP = _activeBP + 1;
};

//diag_log text "Out of bldgSearch loop";

_group setbehaviour _behaviour;

// check if occupy is specified
if !(_occupy) then
{

    // need some sort of wait to make sure they are ready
    //waituntil {sleep 3; {unitready _x} count _units == count (units _group) - 1};
    _ldrPos = getPos _leader;
    {
        //diag_log text format ["srcher loop  %1", _x];
        _x doMove _ldrPos;
        waitUntil {moveToCompleted _x};
        _x doFollow _leader;

    } foreach _searchers;
};
// waituntil ??

//_group lockwp false;
JTD_lockedSearchGroups = JTD_lockedSearchGroups - [_group];
//diag_log text "bldg srch ended";
true  