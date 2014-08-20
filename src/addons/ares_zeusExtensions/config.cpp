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
			//"ares_ModuleTest"
		};
		
		requiredAddons[] =
		{
			"A3_Modules_F",
			"A3_Modules_F_Curator"
		};
    };
};
/*
class CfgFactionClasses
{
	class Ares // The section the module will show up under in the editor?? Or is this just whatever you want?
	{
		displayname = "Ares Library";	// Name of the module section?
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
*/
/*
class CfgVehicles
{
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
};
*/
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
