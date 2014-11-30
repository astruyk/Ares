/*
	Reads through the loaded mod configs and generates a list of all the objects that are valid to be added to an arsenal box.
	
	Parameters:
		0 - (Optional) Array of strings - List of class names to blacklist (not include) in all generated lists.
		1 - (Optional) String - Option for limiting side of the items added. One of { 'All', 'Blufor', 'Opfor', 'Greenfor', 'Civilian', 'None' }

	Returns:
		An array of arrays of all class names that can be added to arsenal in the following format:
			[
				[ "", "", ... ], // Backpacks
				[ "", "", ... ], // Items
				[ "", "", ... ], // Magazines
				[ "", "", ... ]  // Weapons
			]
*/

#define CFG_TYPE_WEAPON 1
#define CFG_TYPE_HANDGUN 2
#define CFG_TYPE_LAUNCHER 4
#define CFG_TYPE_BINOC 4096
#define CFG_TYPE_ITEM 131072
#define CFG_TYPE_SCOPED 0

_blacklist = [_this, 0, []] call BIS_fnc_Param;
_limitItemsToSide = [_this, 1, 'All'] call Bis_fnc_Param;

// Go through and gather all the items declared in 'CfgWeapons'. This includes most items, vests
// and uniforms.
_allWeaponsClasses = (configFile >> "CfgWeapons") call BIS_fnc_getCfgSubClasses;
_weapons = [];
_items = [];
_namesOfAddedWeapons = [];
{
	_weaponClassName = _x;
	_weaponConfig = configFile >> "CfgWeapons" >> _weaponClassName;
	_weaponType = getNumber (_weaponConfig >> "type");
	_weaponScope = getNumber (_weaponConfig >> "scope");
	_weaponDisplayName = getText (_weaponConfig >> "displayName");
	
	if (_weaponScope >= 2) then
	{
		if (_weaponClassName in _blacklist) then
		{
			[format["Blacklisted: %1", _weaponClassName]] call Ares_fnc_LogMessage;
		}
		else
		{
			if (not (_weaponDisplayName in _namesOfAddedWeapons)) then
			{
				switch (_weaponType) do
				{
					case CFG_TYPE_WEAPON;
					case CFG_TYPE_HANDGUN;
					case CFG_TYPE_LAUNCHER:
					{
						if (not isClass (_weaponConfig >> "LinkedItems")) then
						{
							[format ["Adding Weapon: %1", _x]] call Ares_fnc_LogMessage;
							_weapons pushBack _weaponClassName;
							_namesOfAddedWeapons pushBack _weaponDisplayName;
						}
						else
						{
							[format ["Item '%1' had linked items. Skipped", _weaponClassName]] call Ares_fnc_LogMessage;
						};
					};
					case CFG_TYPE_BINOC;
					case CFG_TYPE_ITEM:
					{
						_includeItem = true;
						if (_limitItemsToSide == 'All') then
						{
							// Include all side-specific items - no reason to check any more config data.
						}
						else
						{
							_side = -1;
							if (isNumber (_weaponConfig >> "side")) then
							{
								_side = getNumber (_weaponConfig >> "side");
							};
							if ((_side == -1) && (isClass (_weaponConfig >> "ItemInfo"))) then
							{
								_uniformVehicle = getText (_weaponConfig >> "ItemInfo" >> "uniformClass");
								if (_uniformVehicle != "") then
								{
									if (_limitItemsToSide == 'None') then
									{
										// Don't inlcude any uniforms if the user specified 'None'
										[format ["Not including %1 since it is a uniform.", _weaponClassName]] call Ares_fnc_LogMessage;
										_includeItem = false;
									}
									else
									{
										// Check the side of the uniform.
										_uniformVehicleConfig = configFile >> "CfgVehicles" >> _uniformVehicle;
										_side = getNumber (_uniformVehicleConfig >> "side");
									};
								};
							};
							
							// Special case hack since the ECH helmet is the base of EVERYTHING we can't
							// override the 'side' value for it in Ares without also making all other
							// hats default to the same side.
							if ((_side == -1) &&(_weaponDisplayName == "ECH")) then
							{
								_side = 1;
							};
							
							if (_side != -1) then
							{
								switch (_limitItemsToSide) do
								{
									case 'None' : { _includeItem = false; };
									case 'Opfor': { _includeItem = (_side == 0); };
									case 'Blufor': { _includeItem = (_side == 1); };
									case 'Greenfor': { _includeItem = (_side == 2); };
									case 'Civilian' : { _includeItem = (_side == 3); };
								};
							};
							
							[format ["Include %1 from side %2 = %3", _weaponClassName, _side, _includeItem]] call Ares_fnc_LogMessage;
						};
					
						if (_includeItem) then
						{
							[format ["Adding Item: %1", _x]] call Ares_fnc_LogMessage;
							_items pushBack _weaponClassName;
							_namesOfAddedWeapons pushBack _weaponDisplayName;
						};
					};
					default
					{
						[format ["Unsupported weapon type %1 (%2)", _weaponClassName, _weaponType]] call Ares_fnc_LogMessage;
					};
				};
			}
			else
			{
				[format ["Duplicate display name for %1 (%2)", _weaponClassName, _weaponDisplayName]] call Ares_fnc_LogMessage;
			};
		};
	};
} forEach _allWeaponsClasses;

// Gather up all the magazines that are declared. This includes explosives and grenades.
_allMagazineClasses = (configFile >> "CfgMagazines") call BIS_fnc_getCfgSubClasses;
_magazines = [];
{
	_className = _x;
	
	if (not (_className in _blacklist)) then
	{
		_config = configFile >> "CfgMagazines" >> _className;
		_displayName = getText(_config >> "displayName");
		_picture = getText(_config >> "picture");
		_scope = getNumber(_config >> "scope");
		
		if (_scope >= 2 && _displayName != "" && _picture != "") then
		{
			[format ["Adding magazine: %1", _className]] call Ares_fnc_LogMessage;
			_magazines pushBack _className;
		}
		else
		{
			[format ["Skipped magazine: %1", _className]] call Ares_fnc_LogMessage;
		};
	}
	else
	{
		[format["Blacklisted: %1", _className]] call Ares_fnc_LogMessage;
	};
} forEach _allMagazineClasses;

// Gather up all the backpacks that are declared. They're vehicles. Awesome.
_allVehicleClasses = (configFile >> "CfgVehicles") call BIS_fnc_getCfgSubClasses;
_backpacks = [];
{
	_className = _x;
	if (not (_className in _blacklist)) then
	{
		_config = configFile >> "CfgVehicles" >> _className;
		_displayName = getText(_config >> "displayName");
		_picture = getText(_config >> "picture");
		_scope = getNumber(_config >> "scope");
		_isBackpack = getNumber(_config >> "isbackpack");
		
		if (_scope >= 2 && _isBackpack == 1 && _displayName != "" && _picture != "") then
		{
			[format ["Adding backpack: %1", _className]] call Ares_fnc_LogMessage;
			_backpacks pushBack _className;
		}
		else
		{
			[format ["Skipped backpack: %1", _className]] call Ares_fnc_LogMessage;
		};
	}
	else
	{
		[format["Blacklisted: %1", _className]] call Ares_fnc_LogMessage;
	};
} forEach _allVehicleClasses;

// Add all the glasses
_allGlassesClasses = (configFile >> "CfgGlasses") call BIS_fnc_getCfgSubClasses;
_glasses = [];
{
	_className = _x;
	if (not (_className in _blacklist)) then
	{
		_config = configFile >> "CfgGlasses" >> _className;
		_displayName = getText(_config >> "displayName");
		_picture = getText(_config >> "picture");
		_scope = getNumber(_config >> "scope");
		
		if (_scope >= 2 && _displayName != "" && _picture != "") then
		{
			[format ["Adding glasses: %1", _className]] call Ares_fnc_LogMessage;
			_glasses pushBack _className;
		}
		else
		{
			[format ["Skipped glasses: %1", _className]] call Ares_fnc_LogMessage;
		};
	}
	else
	{
		[format["Blacklisted: %1", _className]] call Ares_fnc_LogMessage;
	};
} forEach _allGlassesClasses;

// Add all the unit insignia
_allInsigniaClasses = (configFile >> "CfgUnitInsignia") call BIS_fnc_getCfgSubClasses;
_insignia = [];
{
	_className = _x;
	if (not (_className in _blacklist)) then
	{
		_config = configFile >> "CfgUnitInsignia" >> _className;
		_displayName = getText(_config >> "displayName");
		_picture = getText(_config >> "picture");
		_scope = getNumber(_config >> "scope");
		
		if (_scope >= 2 && _displayName != "" && _picture != "") then
		{
			[format ["Adding insignia: %1", _className]] call Ares_fnc_LogMessage;
			_insignia pushBack _className;
		}
		else
		{
			[format ["Skipped insignia: %1", _className]] call Ares_fnc_LogMessage;
		};
	}
	else
	{
		[format["Blacklisted: %1", _className]] call Ares_fnc_LogMessage;
	};
} forEach _allInsigniaClasses;

[_backpacks, _items + _glasses + _insignia, _magazines, _weapons];