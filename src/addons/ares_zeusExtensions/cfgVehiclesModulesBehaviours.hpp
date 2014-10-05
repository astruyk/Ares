class Ares_Module_SurrenderSingleUnit : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Surrender Unit";
	function = "Ares_fnc_SurrenderSingleUnit";
};

class Ares_Module_Garrison_Nearest : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Garrison Building (instant)";
	function = "Ares_fnc_GarrisonNearest";
};

class Ares_Module_UnGarrison : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Un-Garrison";
	function = "Ares_fnc_UnGarrison";
};

class Ares_Module_Behaviour_Search_Nearby_Building : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Search Building";
	function = "Ares_fnc_BehaviourSearchNearbyBuilding";
};

class Ares_Module_Behaviour_Search_Nearby_And_Garrison : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Search And Garrison Building";
	function = "Ares_fnc_BehaviourSearchNearbyAndGarrison";
};

class Ares_Module_Behaviour_Flee : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Make Units Flee";
	function = "Ares_fnc_BehaviourFlee";
};
