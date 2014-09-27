/*
	Sets up an object as an Arsenal config with a specific set of objects in it.

	All non-virtual items in the box will be removed along with any pre existing virtual items.

	Params:
		0 - Object - The object to configure as the arsenal object
		1 - Array - The set of backpacks to be added.
		2 - Array - The set of items to be added.
		3 - Array - The set of magazines to be added.
		4 - Array - The set of weapons to be added.
*/

_ammoBox = _this select 0;
_backpacks = _this select 1;
_items = _this select 2;
_magazines = _this select 3;
_weapons = _this select 4;

// Remove all the non-virtual things from the box
// TODO make this optional?
clearWeaponCargoGlobal _ammoBox;
clearMagazineCargoGlobal _ammoBox;
clearItemCargoGlobal _ammoBox;

// Remove all the virtual things from the box
[_ammoBox, ([_ammoBox] call BIS_fnc_getVirtualBackpackCargo), true] call BIS_fnc_removeVirtualBackpackCargo;
[_ammoBox, ([_ammoBox] call BIS_fnc_getVirtualItemCargo), true] call BIS_fnc_removeVirtualItemCargo;
[_ammoBox, ([_ammoBox] call BIS_fnc_getVirtualMagazineCargo), true] call BIS_fnc_removeVirtualMagazineCargo;
[_ammoBox, ([_ammoBox] call BIS_fnc_getVirtualWeaponCargo), true] call BIS_fnc_removeVirtualWeaponCargo;

// Add the user supplied items
[_ammoBox, _backpacks, true] call BIS_fnc_addVirtualBackpackCargo;
[_ammoBox, _items, true] call BIS_fnc_addVirtualItemCargo;
[_ammoBox, _magazines, true] call BIS_fnc_addVirtualMagazineCargo;
[_ammoBox, _weapons, true] call BIS_fnc_addVirtualWeaponCargo;

// Mark the object as an arsenal object
["AmmoboxInit", [_ammoBox, false, {true}]] call BIS_fnc_arsenal;

true
