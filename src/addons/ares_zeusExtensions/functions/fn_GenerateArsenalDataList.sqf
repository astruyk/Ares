/*
	Reads through the loaded mod configs and generates a list of all the objects that are valid to be added to an arsenal box.
	
	Parameters:
		0 - Array of strings - List of class names to blacklist (not include) in all generated lists.
	
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
			// diag_log format["Blacklisted: %1", _weaponClassName];
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
							// diag_log format ["Adding Weapon: %1", _x];
							_weapons pushBack _weaponClassName;
							_namesOfAddedWeapons pushBack _weaponDisplayName;
						}
						else
						{
							// diag_log format ["Item '%1' had linked items. Skipped", _weaponClassName];
						};
					};
					case CFG_TYPE_BINOC;
					case CFG_TYPE_ITEM:
					{
						// diag_log format ["Adding Item: %1", _x];
						_items pushBack _weaponClassName;
						_namesOfAddedWeapons pushBack _weaponDisplayName;
					};
					default
					{
						// diag_log format ["Unsupported weapon type %1 (%2)", _weaponClassName, _weaponType];
					};
				};
			}
			else
			{
				// diag_log format ["Duplicate display name for %1 (%2)", _weaponClassName, _weaponDisplayName];
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
		_config = configFile >> "CfgVehicles" >> _className;
		_displayName = getText(_config >> "displayName");
		_picture = getText(_config >> "picture");
		_scope = getNumber(_config >> "scope");
		
		if (_scope >= 2 && _displayName != "" && _picture != "") then
		{
			// diag_log format ["Adding magazine: %1", _className];
			_magazines pushBack _className;
		}
		else
		{
			// diag_log format ["Skipped magazine: %1", _className];
		};
	}
	else
	{
		// diag_log format["Blacklisted: %1", _className];
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
			// diag_log format ["Adding backpack: %1", _className];
			_backpacks pushBack _className;
		}
		else
		{
			// diag_log format ["Skipped backpack: %1", _className];
		};
	}
	else
	{
		// diag_log format["Blacklisted: %1", _className];
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
			// diag_log format ["Adding glasses: %1", _className];
			_glasses pushBack _className;
		}
		else
		{
			// diag_log format ["Skipped glasses: %1", _className];
		};
	}
	else
	{
		// diag_log format["Blacklisted: %1", _className];
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
			// diag_log format ["Adding insignia: %1", _className];
			_insignia pushBack _className;
		}
		else
		{
			// diag_log format ["Skipped insignia: %1", _className];
		};
	}
	else
	{
		// diag_log format["Blacklisted: %1", _className];
	};
} forEach _allInsigniaClasses;

[_backpacks, _items + _glasses + _insignia, _magazines, _weapons];