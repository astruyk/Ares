class CfgPatches
{
    class Ares
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
		author[] = { "Anton Struyk" };
		authorUrl = "https://github.com/astruyk/";
		version = 0.0.1;
		versionStr = "0.0.1";
		versionAr[] = {0,0,1};
		
		requiredAddons[] =
		{
			"A3_Modules_F",
			"A3_Modules_F_Curator"
		};
    };
};

// BEGIN DEFINITIONS FOR OBJECTS
class CfgGroups
{
	#include "compositions.hpp"
};
