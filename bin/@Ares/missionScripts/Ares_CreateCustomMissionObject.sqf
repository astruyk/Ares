/*
	Defines a custom mission object that will be placeable through an Ares menu. This must be called on the machine that
	Ares will be run on (normally init.sqf is appropriate).
	
	Parameters:
		0 - String - The name of the mission object to show to the user when choosing what to spawn.
		1 - Code Block - The block of code to run that will create the custom object. This code block should return an object or an array of objects to add to the Curator after completion (or objNull). The position to create the object at can be accessed using '_this select 0' in the code block.
	
	Example:
		Adds an entry where the user can spawn a custom pointer that is not normally available through zeus.
		["Pink Arrow", { "Sign_Arrow_Large_Pink_F" createVehicle (_this select 0); }] execVM "Ares_CreateCustomMissionObject.sqf";
		
	Alternate Version:
		Accepts an array of option-codeblock pairs to add.
		
	Parameters:
		0 - Array of Arrays - An array of two-item arrays to define options for.
		
	Example:
		Adds two entries in a single call, one for a blue arrow and one for a pink arrow:
		[
			["Blue Arrow", { "Sign_Arrow_Large_Blue_F" createVehicle (_this select 0); }],
			["Pink Arrow", { "Sign_Arrow_Large_Pink_F" createVehicle (_this select 0); }]
		] execVM "Ares_CreateCustomMissionObject.sqf";
*/

if (isNil "Ares_CustomMissionObjectData") then
{
	Ares_CustomMissionObjectData = [];
};

if (typeName (_this select 0) == typeName "") then
{
	_optionName = (_this select 0);
	_codeBlock = (_this select 1);
	Ares_CustomMissionObjectData pushBack [_optionName, _codeBlock];
}
else
{
	// Assume the alternate version (array of arrays)
	{
		_optionName = (_x select 0);
		_codeBlock = (_x select 1);
		Ares_CustomMissionObjectData pushBack [_optionName, _codeBlock];
	} forEach _this;
};


