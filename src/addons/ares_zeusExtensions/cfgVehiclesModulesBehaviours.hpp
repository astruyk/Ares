class Ares_Module_SurrenderSingleUnit : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Surrender Unit";
	function = "Ares_fnc_SurrenderSingleUnit";
};

class Ares_Module_Garrison_Nearest : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Garrison Building";
	function = "Ares_fnc_GarrisonNearest";
};

class Ares_Module_UnGarrison : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Un-Garrison";
	function = "Ares_fnc_UnGarrison";
};

class Ares_Module_Search_Nearby_Building : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Search Building";
	function = "Ares_fnc_SearchNearbyBuilding";
};
