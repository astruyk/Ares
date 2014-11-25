#include "\ares_zeusExtensions\module_header.hpp"

_ammoBox = [_logic] call Ares_fnc_GetUnitUnderCursor;
if (not isnull _ammoBox) then
{
	_dialogResult =
		[
			"Add All Objects",
			[
				["Combine or Replace?", ["Combine with existing items", "Replace existing items"], 1],
				["Add GPS?", ["Yes", "No"]],
				["Add thermals?", ["Yes", "No"], 1],
				["Add NVG's?", ["Yes", "No"]],
				["Static weapon backpacks", ["All", "Blufor Only", "Opfor Only", "Greenfor Only", "None"], 4],
				["UAV items & backpacks", ["All", "Blufor Only", "Opfor Only", "Greenfor Only", "None"], 4],
				["Automated weapon backpacks", ["All", "Blufor Only", "Opfor Only", "Greenfor Only", "None"], 4]
				// Don't ask about tents. No one cares about tents.
			]
		] call Ares_fnc_ShowChooseDialog;
	
	if (count _dialogResult > 0) then
	{
		_dialogCombineOrReplace = _dialogResult select 0;
		_dialogAddGps = _dialogResult select 1;
		_dialogAddThermals = _dialogResult select 2;
		_dialogAddNvg = _dialogResult select 3;
		_dialogAddStaticWeapons = _dialogResult select 4;
		_dialogAddUav = _dialogResult select 5;
		_dialogAddAutomated = _dialogResult select 6;
		
		_filterChoices = ["All", "Blufor", "Opfor", "Greenfor", "None"];
		
		_blacklist =
			[
				(_dialogAddGps == 0), 
				(_dialogAddThermals == 0),
				(_dialogAddNvg == 0),
				(_filterChoices select _dialogAddStaticWeapons),
				(_filterChoices select _dialogAddUav),
				(_filterChoices select _dialogAddAutomated),
				False
			] call Ares_fnc_GenerateArsenalBlacklist;

		_arsenalData = [_blacklist] call Ares_fnc_GenerateArsenalDataList;
		
		[_ammoBox, _arsenalData, (_dialogCombineOrReplace == 1)] call Ares_fnc_ArsenalSetup;
		[objNull, "Arsenal objects added."] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;
true