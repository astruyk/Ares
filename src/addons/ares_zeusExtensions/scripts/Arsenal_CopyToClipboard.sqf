[
	"Arsenal",
	"Copy To Clipboard",
	{
		_ammoBox = _this select 1;
		if (not isnull _ammoBox) then
		{
			_virtualBackpacks = [_ammoBox] call BIS_fnc_getVirtualBackpackCargo;
			_virtualItems = [_ammoBox] call BIS_fnc_getVirtualItemCargo;
			_virtualMagazines = [_ammoBox] call BIS_fnc_getVirtualMagazineCargo;
			_virtualWeapons = [_ammoBox] call BIS_fnc_getVirtualWeaponCargo;
			_backpacks = getBackpackCargo _ammoBox;
			_items = getItemCargo _ammoBox;
			_magazines = getMagazineCargo _ammoBox;
			_weapons = getWeaponCargo _ammoBox;
			_stringData = format [
"[%1,
%2,
%3,
%4,
%5,
%6,
%7,
%8]",
			str(_virtualBackpacks), str(_virtualItems), str(_virtualMagazines), str(_virtualWeapons), str(_backpacks), str(_items), str(_magazines), str(_weapons)];
			missionNamespace setVariable ['Ares_CopyPaste_Dialog_Text', _stringData];
			_dialog = createDialog "Ares_CopyPaste_Dialog";
			[objNull, "Copied items from arsenal to clipboard."] call bis_fnc_showCuratorFeedbackMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;