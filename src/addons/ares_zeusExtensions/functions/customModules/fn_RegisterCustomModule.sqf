/*
	Registers a new module to be displayed in the Ares custom module tree.
*/

_categoryName = _this select 0;
_displayName = _this select 1;
_codeBlock = _this select 2;

if (isNil "Ares_Custom_Modules") then
{
	Ares_Custom_Modules = [];
};

_replacedExistingEntry = false;
{
	if (_categoryName == (_x select 0) and _displayName == (_x select 1)) exitWith
	{
		_replacedExistingEntry = true;
		_x set [2, _codeBlock];
	};
} forEach Ares_Custom_Modules;

if (not _replacedExistingEntry) then
{
	Ares_Custom_Modules pushBack [_categoryName, _displayName, _codeBlock];
};
