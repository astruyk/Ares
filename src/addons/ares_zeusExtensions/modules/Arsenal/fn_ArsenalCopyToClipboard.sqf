#include "\ares_zeusExtensions\module_header.hpp"

_ammoBox = [_logic] call Ares_fnc_GetUnitUnderCursor;
if (not isnull _ammoBox) then
{
	_backpacks = [_ammoBox] call BIS_fnc_getVirtualBackpackCargo;
	_items = [_ammoBox] call BIS_fnc_getVirtualItemCargo;
	_magazines = [_ammoBox] call BIS_fnc_getVirtualMagazineCargo;
	_weapons = [_ammoBox] call BIS_fnc_getVirtualWeaponCargo;

	_stringData = format [
"[%1,
%2,
%3,
%4]",
	str(_backpacks), str(_items), str(_magazines), str(_weapons)];
	
	// Don't do this anytime since it doesn't work on dedicated servers.
	//copyToClipboard _stringData;
	
	missionNamespace setVariable ['Ares_CopyPaste_Dialog_Text', _stringData];
	_dialog = createDialog "Ares_CopyPaste_Dialog";

	[objNull, "Copied items from arsenal to clipboard."] call bis_fnc_showCuratorFeedbackMessage;
};

#include "\ares_zeusExtensions\module_footer.hpp"
