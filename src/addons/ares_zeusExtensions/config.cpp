class CfgPatches
{
    class Ares
    {
        weapons[] = {};
        requiredVersion = 0.1;
		author[] = { "Anton Struyk" };
		authorUrl = "https://github.com/astruyk/";
		version = 0.0.1;
		versionStr = "0.0.1";
		versionAr[] = {0,0,1};
		
		units[] =
		{
			"Ares_Module_Base",
			"Ares_Module_Test"
		};
		
		requiredAddons[] =
		{
			"A3_Modules_F",
			"A3_Modules_F_Curator"
		};
    };
};

class CfgFactionClasses
{
	class Ares // The section the module will show up under in the editor?? Or is this just whatever you want?
	{
		displayname = "Ares";	// Name of the module section.
		priority = 8;
		side = 7;

		addon = "Ares";

		class subCategories
		{
			class Common
			{
				displayname = "Common";
				moduleClass = "Ares_ModuleEmpty";
			};
		};
	};
};


class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
			class Units;
		};
		class ModuleDescription
		{
			class AnyBrain;
		};
	};
	
	class Ares_Module_Base : Module_F
	{
		mapSize = 0;
		author = "Anton Struyk";
		vehicleClass = "Modules";
		category = "Ares";
		subCategory = "Common";
		side = 7;

		scope = 1;				// Editor visibility; 2 will show it in the menu, 1 will hide it.
		scopeCurator = 1;		// Curator visibility; 2 will show it in the menu, 1 will hide it.

		displayName = "Ares Module Base";	// Name displayed in the menu
		// icon = "\chessmastersCommonLibrary\data\icon_ca.paa";		// Map icon. Delete this entry to use the default icon
		// picture = "\chessmastersCommonLibrary\data\icon_ca.paa";
		// portrait = "\chessmastersCommonLibrary\data\icon_ca.paa";

		function = "";			// Name of function triggered once conditions are met
		functionPriority = 1;	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 2;			// 0 for server only execution, 1 for remote execution on all clients upon mission start, 2 for persistent execution
		isTriggerActivated = 0;	// 1 for module waiting until all synced triggers are activated
		isDisposable = 1;		// 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
		// curatorInfoType = "RscDisplayAttributeModuleNuke";	// Menu displayed when the module is placed or double-clicked on by Zeus
		
		class Arguments : ArgumentsBaseUnits
		{
			class Units: Units {};
		};
		class ModuleDescription: ModuleDescription
		{
			description = "Ares Module Base";
			sync[] = {};
		};
	};
	
	class Ares_Module_Test : Ares_Module_Base
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "Ares Test";
		function = "";
	};
};

class CfgFunctions
{
	class Ares // This bit will be prefixed when actually calling the function (e.g. "Ares_fnc_...." )
	{
		class scripts
		{
			file = "\ares_zeusExtensions\scripts"; // All of the scripts defined in this class are in the '\ares_zeusExtensions\scripts' folder.
			class test {};	// This will be found in "\ares_zeusExtensions\scripts\fn_<thisname>.sqf" and compiled into 'Ares_fnc_<thisname>'
		};
	};
};

class CfgGroups
{
	#include "compositions.hpp"
};
