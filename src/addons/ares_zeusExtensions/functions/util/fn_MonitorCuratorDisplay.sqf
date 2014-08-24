#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_category = _this select 0;

disableSerialization;

while {[player] call ccl_fnc_IsZeusCurator} do {
	//Wait for the curator screen to be displayed
	while {isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do {
		sleep 1;
	};

	_display = findDisplay IDD_RSCDISPLAYCURATOR;
	_ctrl = _display displayCtrl IDC_RSCDISPLAYCURATOR_MODEMODULES;
	_ctrl ctrlAddEventHandler ["buttonclick", format ["['%1'] spawn ccl_fnc_OnModuleTreeLoad;", _category]];

	[_category] call ccl_fnc_OnModuleTreeLoad;

	//Wait for the curator screen to be removed
	while {!isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do {
		sleep 1;
	};
};