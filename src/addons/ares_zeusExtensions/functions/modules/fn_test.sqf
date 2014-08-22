/*
if (!isServer) exitWith {};

_transportHelo = _this select 0;
_rallyPoints = _this select 1;

// TODO [Improvement]: these can be moved to a global variable somewhere.
_squads = [
	["O_Soldier_TL_F", "O_Soldier_lite_F", "O_Soldier_lite_F", "O_Soldier_GL_F", "O_soldier_M_F"],
	["O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_A_F", "O_Soldier_GL_F", "O_Soldier_lite_F"]
];

// Choose the squad to spawn and their rally point
_chosenSquad = _squads call BIS_fnc_selectRandom;
_chosenRallyPoint = _rallyPoints call BIS_fnc_selectRandom;

// Spawn the group and add them to the helo as cargo.
_spawnedGroup = [[0, 0, 0], EAST, _chosenSquad] call BIS_fnc_spawnGroup;
{_x moveInCargo _transportHelo} forEach units _spawnedGroup;

// Move them to the rally point after landing
_wp = _spawnedGroup addWaypoint [getMarkerPos _chosenRallyPoint, 0];
*/