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

_ammoBox = [_this, 0] call BIS_fnc_Param;
_backpacks = [_this, 1, [], [[]]] call BIS_fnc_Param;
_items = [_this, 2, [], [[]]] call BIS_fnc_Param;
_magazines = [_this, 3, [], [[]]] call BIS_fnc_Param;
_weapons = [_this, 4, [], [[]]] call BIS_fnc_Param;
_addGlasses = [_this, 5, false, [false]] call BIS_fnc_Param;

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

if (_addGlasses) then
{
	// For some reason you can't add glasses in the ammo box config. Add them manually.
	_allGlasses = [
		"G_Diving",			//Diving Goggles
		"G_Shades_Black",		//Shades (Black)
		"G_Shades_Blue",		//Shades (Blue)
		"G_Sport_Blackred",	//Sport Shades (Vulcan)
		"G_Tactical_Clear",	//Tactical Glasses
		"G_Spectacles",		//Spectacle Glasses
		"G_Spectacles_Tinted",	//Tinted Spectacles
		"G_Combat",			//Combat Goggles
		"G_Lowprofile",		//Low Profile Goggles
		"G_Shades_Green",		//Shades (Green)
		"G_Shades_Red",		//Shades (Red)
		"G_Squares",			//Square Spectacles
		"G_Squares_Tinted",	//Square Shades
		"G_Sport_BlackWhite",	//Sport Shades (Shadow)
		"G_Sport_Blackyellow",	//Sport Shades (Poison)
		"G_Sport_Greenblack",	//Sport Shades (Yetti)
		"G_Sport_Checkered",	//Sport Shades (Style)
		"G_Sport_Red",		//Sport Shades (Fire)
		"G_Tactical_Black"	//Tactical Shades
	];
	[_ammoBox, _allGlasses, true] call BIS_fnc_addVirtualItemCargo;
};

// Mark the object as an arsenal object
["AmmoboxInit", [_ammoBox, false, {true}]] call BIS_fnc_arsenal;

true
