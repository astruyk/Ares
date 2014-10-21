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

class Ares_Module_Behaviour_Patrol : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Patrol";
	function = "Ares_fnc_BehaviourPatrol";
};

class Ares_Module_Behaviour_Create_Artillery_Target : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Create Artillery Target";
	function = "Ares_fnc_BehaviourArtilleryCreateTarget";
	icon = "\ares_zeusExtensions\data\icon_artillery_target.paa";
	portrait = "\ares_zeusExtensions\data\icon_artillery_target.paa";
};

class Ares_Module_Behaviour_Fire_At_Artillery_Target : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Fire Artillery";
	function = "Ares_fnc_BehaviourArtilleryFire";
};

class Ares_Module_Behaviour_Land_Helicopter : Ares_Behaviours_Module_Base
{
	scopeCurator = 2;
	displayName = "Land Helicopter";
	function = "Ares_fnc_BehaviourLandHelicopter";
};
