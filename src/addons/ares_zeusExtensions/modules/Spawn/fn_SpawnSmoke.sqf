#include "\ares_zeusExtensions\module_header.hpp"
if (isNil "Ares_Spawn_Smoke_Function") then
{
	Ares_Spawn_Smoke_Function = compile preprocessFileLineNumbers '\ares_zeusExtensions\scripts\spawnSmoke.sqf';
	publicVariable "Ares_Spawn_Smoke_Function";
};

_options = [
	"Vehicle Fire Look-Alike",
	"Small Oil Smoke",
	"Medium Oil Smoke",
	"Large Oil Smoke",
	"Small Wood Smoke",
	"Medium Wood Smoke",
	"Large Wood Smoke",
	"Small Mixed Smoke",
	"Large Mixed Smoke"
	];
_dialogResult = ["Create Smoke Effect", ["Smoke Type", _options]] call Ares_fnc_ShowChooseDialog;
if (count _dialogResult > 0) then
{
	if (isNil "Ares_SmokeGroup") then
	{
		Ares_SmokeGroup = createGroup (side player);
		publicVariable "Ares_SmokeGroup";
	};
	_logicName = format["Smoke Source (%1)", _options select (_dialogResult select 0)];
	_sourceObject = [(position _logic), _logicName, Ares_SmokeGroup] call Ares_fnc_CreateLogic;
	[[_sourceObject]] call Ares_fnc_AddUnitsToCurator;
	
	_dialogSmokeType = _dialogResult select 0;
	[[_dialogSmokeType, _sourceObject], "Ares_Spawn_Smoke_Function", true, true] call BIS_fnc_MP;
};

#include "\ares_zeusExtensions\module_footer.hpp"
