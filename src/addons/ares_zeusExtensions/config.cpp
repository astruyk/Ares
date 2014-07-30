class CfgPatches
{
	class aresModules
	{
		units[] = {
				"ares_ModuleEmpty",
				"ares_moduleInfantryRemoveNvg"
		};
		requiredVersion = 1.0;
		requiredAddons[] = {
				"A3_UI_F",
				"A3_UI_F_Curator",
				"A3_Functions_F",
				"A3_Functions_F_Curator",
				"A3_Modules_F",
				"A3_Modules_F_Curator"
		};
		author[] = { "Anton Struyk" };
		authorUrl = "https://github.com/astruyk/";
		version = 0.0.1;
		versionStr = "0.0.1";
		versionAr[] = {0,0,1};
	};
};

class CfgFactionClasses
{
	class AresModules
	{
		displayname = "Ares";
		priority = 8;	// ???
		side = 7;		// ???

		addon = "ares_zeusExtensions";	// ??? Does this have to match the folder? Or can it be anything?

		class subCategories
		{
			class InfantryActions
			{
				displayname = "Infantry Actions";
				moduleClass = "ares_InfantryActions";
			};
		};
	};
};

class CfgVehicles
{
	#include "cfgVehicles.hpp"
};

class CfgFunctions
{
	#include "cfgFunctions.hpp"
};

#include "dialogs.hpp"
