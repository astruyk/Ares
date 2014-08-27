/*
	Does magic to add custom items to a category in Zeus.
	
	Parameters:
		0 - [String] The name of the module to add. Must match the name defined in CfgFactionClasses.
		
	This code taken (pretty much verbatim) from CuratorPresetsModule (CPM).
*/

#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

private ["_categoryClass","_display","_ctrl","_category","_categoryName","_categoryMod","_subCategories","_tvMainBranch","_subCategoryBranches","_moduleClassList","_index"];

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

//Check to see if our category already exists and if so delete it
for [{_i=0},{_i<(_ctrl tvCount [])},{_i=_i+1}] do 
{
	_tvText = _ctrl tvText [_i];
	if(_tvText == _categoryName) then {
		_ctrl tvDelete [_i];
	};
};

//Create the new module category
_tvMainBranch = _ctrl tvAdd [[], _categoryName];

//Create the sub-categories
_subCategoryBranches = [];
{
	_tvText = gettext (_x >> "displayName");
	_tvData = gettext (_x >> "moduleClass");
	_tvBranch = _ctrl tvAdd [[_tvMainBranch], _tvText];
	_ctrl tvSetData [[_tvMainBranch, _tvBranch], _tvData];

	_subCategoryBranches set [count _subCategoryBranches, _tvBranch];
} forEach _subCategories;

_moduleClassList = getArray (configFile >> "cfgPatches" >> _categoryMod >> "units");

//Add all of the modules to the category
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
				_tvModuleBranch = _subCategoryBranches select _idx;
			};
			_idx = _idx + 1;
		} forEach _subCategories;

		//Create the new tree entry
		_leaf = _ctrl tvAdd [[_tvMainBranch, _tvModuleBranch], _moduleDisplayName];
		_newPath = [_tvMainBranch, _tvModuleBranch, _leaf];

		//Copy all of the data into it
		_ctrl tvSetData [_newPath, _x];
		_ctrl tvSetPicture [_newPath, _moduleIcon];
		_ctrl tvSetValue [_newPath, _index];

		_index = _index + 1;
	};
} forEach _moduleClassList;

//Sort the new lists
{
	_ctrl tvSort [[_tvMainBranch, _x], false];
} forEach _subCategoryBranches;
_ctrl tvSort [[_tvMainBranch], false];

//Sort the base module list
_ctrl tvSort [[], false];