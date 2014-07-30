class Logic;
class Module_F: Logic
{
	class ModuleDescription
	{
		class AnyPlayer;
		class AnyBrain;
		class EmptyDetector;
	};
};
class ares_ModuleBase: Module_F
{
	mapSize = 1;
	author = "Anton Struyk";
	vehicleClass = "Modules";
	category = "Ares";
	subCategory = "Common";
	side = 7;

	scope = 1;
	scopeCurator = 1;

	displayName = "Ares Base Module";	 // Name displayed in the menu
	icon = "\ares_zeusExtensions\data\icon_ca.paa";	// Map icon. Delete this entry to use the default icon
	picture = "\ares_zeusExtensions\data\icon_ca.paa";
	portrait = "\ares_zeusExtensions\data\icon_ca.paa";

	function = "";	// Name of function triggered once conditions are met
	functionPriority = 1;	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	isGlobal = 2;	// 0 for server only execution, 1 for remote execution on all clients upon mission start, 2 for persistent execution
	isTriggerActivated = 0;	// 1 for module waiting until all synced triggers are activated
	isDisposable = 0;	// 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)

	class Arguments{};
	
	// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
	class ModuleDescription: ModuleDescription
	{
		description = "Ares Module Base";	// Short description, will be formatted as structured text
	};
};

class ares_ModuleEmpty: ares_ModuleBase
{
	mapSize = 0;
	category = "Curator";
	subCategory = "";
	icon = "";

	displayName = "";
	function = "ares_fnc_ModuleEmpty";
	scopeCurator = 1;
};

class ares_moduleInfantryRemoveNvg : ares_ModuleEmpty
{
	category = "Ares";
	subCategory = "Infantry Actions"; 
	displayName = "Remove Night Vision Goggles";
}