#include "\ares_zeusExtensions\module_header.hpp"

// Clear out any previous text from the dialog. We do this so it behaves consistently
// in dedicated and local servers.
Ares_CopyPaste_Dialog_Text = '';

_parsedValue = [] call Ares_fnc_GetArrayDataFromUser;
if (typeName _parsedValue == typeName []) then
{
	_createdUnits = [objNull, _parsedValue] call Ares_fnc_ObjectsMapper;
	[_createdUnits] call Ares_fnc_AddUnitsToCurator;
	[objNull, format["%1 Objects Created at %2.", count _createdUnits, (position _logic)]] call bis_fnc_showCuratorFeedbackMessage;
}
else
{
	if (_parsedValue == "CANCELLED") then
	{
		// Do nothing. The paste was cancelled by the user.
	}
	else
	{
		[objNull, format ["%1. Was the data in the right format?", _parsedValue]] call bis_fnc_showCuratorFeedbackMessage;
	};
};

deleteVehicle _logic;
true
