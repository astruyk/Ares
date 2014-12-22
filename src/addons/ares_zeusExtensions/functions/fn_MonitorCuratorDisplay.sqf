#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

_category = _this select 0;

disableSerialization;

while {true} do {
	//["Monitor curator display..."] call Ares_fnc_LogMessage;
	
	// Wait for the player to become zeus again (if they're not - eg. if on dedicated server and logged out)
	while { !([player] call Ares_fnc_IsZeus) } do
	{
		//["Unit not zeus..."] call Ares_fnc_LogMessage;
		sleep 1;
	};
	//["Zeus has arrived!"] call Ares_fnc_LogMessage;

	//Wait for the curator screen to be displayed
	while {isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do
	{
		//["Display not open."] call Ares_fnc_LogMessage;
		sleep 1;
	};
	//["Display opened!"] call Ares_fnc_LogMessage;
	
	_display = findDisplay IDD_RSCDISPLAYCURATOR;
	_ctrl = _display displayCtrl IDC_RSCDISPLAYCURATOR_MODEMODULES;
	_ctrl ctrlAddEventHandler ["buttonclick", format ["['%1'] spawn Ares_fnc_OnModuleTreeLoad;", _category]];
	_display displayAddEventHandler ["KeyDown", { _this call Ares_fnc_HandleCuratorKeyPressed; }];
	_display displayAddEventHandler ["KeyUp", { _this call Ares_fnc_HandleCuratorKeyReleased; }];

	[_category] call Ares_fnc_OnModuleTreeLoad;

	//Wait for the curator screen to be removed
	while {!isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do
	{
		//["Display not closed."] call Ares_fnc_LogMessage;
		sleep 1;
	};
	//["Display closed!"] call Ares_fnc_LogMessage;
};