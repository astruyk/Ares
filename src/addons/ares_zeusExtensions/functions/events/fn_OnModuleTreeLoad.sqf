/*
	Does magic to add custom items to a category in Zeus.
	
	Parameters:
		0 - [String] The name of the module to add. Must match the name defined in CfgFactionClasses.
		
	This code taken (pretty much verbatim) from CuratorPresetsModule (CPM).
*/

#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

private ["_categoryClass","_display","_ctrl","_category","_categoryName","_categoryMod","_subCategories","_categoryBranches","_moduleClassList","_index"];

_categoryClass = _this select 0;

disableSerialization;

//Safety precaution, wait for the curator screen to be displayed
while {isNull (findDisplay IDD_RSCDISPLAYCURATOR)} do {
	sleep 1;
};

//Get the UI control
_display = findDisplay IDD_RSCDISPLAYCURATOR;
_ctrl = _display displayCtrl IDC_RSCDISPLAYCURATOR_CREATE_MODULES;

//Get the category details
_category = (configFile >> "CfgFactionClasses" >> _categoryClass);
_categoryName = gettext (_category >> "displayName");
_categoryMod = gettext (_category >> "addon");
_subCategories = ((_category >> "subCategories") call BIS_fnc_returnChildren);

//Check to see if our categories already exist, and if they do then delete them
{
	_subCategoryName = gettext (_x >> "displayName");
	for [{_i=0},{_i<(_ctrl tvCount [])},{_i=_i+1}] do 
	{
		_tvText = _ctrl tvText [_i];
		if(_tvText == _subCategoryName) then {
			_ctrl tvDelete [_i];
		};
	};
} forEach _subCategories;

//Create the categories
_categoryBranches = [];
{
	_tvText = gettext (_x >> "displayName");
	_tvData = gettext (_x >> "moduleClass");
	_tvIcon = gettext (_x >> "icon");
	_tvBranch = _ctrl tvAdd [[], _tvText];
	_ctrl tvSetData [[_tvBranch], _tvData];
	_ctrl tvSetPicture [[_tvBranch], _tvIcon];

	_categoryBranches set [count _categoryBranches, _tvBranch];
} forEach _subCategories;

_moduleClassList = getArray (configFile >> "cfgPatches" >> _categoryMod >> "units");

//Add all of the modules to each of their categories
_index = 0;
{
	_moduleCategory = gettext (configFile >> "CfgVehicles" >> _x >> "category");

	//Check if the category is a match and the module is public
	if(_moduleCategory == _categoryClass) then {
		//Get values from config
		_moduleDisplayName = gettext (configFile >> "CfgVehicles" >> _x >> "displayName");
		_moduleIcon = gettext (configFile >> "CfgVehicles" >> _x >> "icon");
		_moduleSubCategory = gettext (configFile >> "CfgVehicles" >> _x >> "subCategory");

		_tvModuleBranch = nil;
		_idx = 0;
		{
			if(_moduleSubCategory == configName _x) then {
				_tvModuleBranch = _categoryBranches select _idx;
			};
			_idx = _idx + 1;
		} forEach _subCategories;

		//Create the new tree entry
		_leaf = _ctrl tvAdd [[_tvModuleBranch], _moduleDisplayName];
		_newPath = [_tvModuleBranch, _leaf];

		//Copy all of the data into it
		_ctrl tvSetData [_newPath, _x];
		_ctrl tvSetPicture [_newPath, _moduleIcon];
		_ctrl tvSetValue [_newPath, _index];

		_index = _index + 1;
	};
} forEach _moduleClassList;

//Sort the new categories
{
	_ctrl tvSort [[_x], false];
} forEach _categoryBranches;

//Sort the base module list
_ctrl tvSort [[], false];