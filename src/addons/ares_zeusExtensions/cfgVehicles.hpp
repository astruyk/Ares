/*class Ares_Module_Test : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Ares Test";
	function = "Ares_fnc_test";
};*/

class Ares_Module_RemoveNvgGroup : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Remove Nvg's (Group)";
	function = "Ares_fnc_RemoveNvgGroup";
};

class Ares_Module_ForceLightsOn : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Force Lights On";
	function = "Ares_fnc_ForceLightsOn";
};

class Ares_Module_ForceLightsOff : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Force Lights Off";
	function = "Ares_fnc_ForceLightsOff";
};

class Ares_Module_ForceLightsAuto : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Lights Auto";
	function  = "Ares_fnc_ForceLightsAuto";
};

/*class Ares_Module_SurrenderSingleUnit : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Surrender (Unit)";
	function = "Ares_fnc_SurrenderSingleUnit";
};*/

class Ares_Module_Teleport_All : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport All";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportAllPlayers";
};

class Ares_Module_Teleport_Single : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport Single Unit";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportSinglePlayer";
};

class Ares_Module_Teleport_Zeus : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport Zeus";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportZeus";
};

class Ares_Module_Teleport_Side_Nato : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport NATO";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportSideNato";
};

class Ares_Module_Teleport_Side_Independent : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport Independent";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportSideIndependent";
};

class Ares_Module_Teleport_Side_Csat : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport CSAT";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportSideCsat";
};

class Ares_Module_Teleport_Side_Civilian : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport Civilian";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportSideCivilian";
};

class Ares_Module_Teleport_CreateTeleporter : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Create Teleporter";
	subCategory = "Teleport";
	function = "Ares_fnc_CreateTeleporter";
};

class Ares_Module_Save_Objects_For_Composition : Ares_Module_Base
{
	scopeCurator = 2;
	subCategory = "SaveLoad";
	displayName = "Save For Comp.";
	function = "Ares_fnc_SaveObjectsForComposition";
};

class Ares_Module_Save_Objects_For_Paste : Ares_Module_Base
{
	scopeCurator = 2;
	subCategory = "SaveLoad";
	displayName = "Copy To Clipboard";
	function = "Ares_fnc_SaveObjectsForPaste";
};

class Ares_Module_Paste_Objects : Ares_Module_Base
{
	scopeCurator = 2;
	subCategory = "SaveLoad";
	displayName = "Paste From Clipboard";
	function = "Ares_fnc_PasteObjects";
};

class Ares_Module_Garrison_Nearest : Ares_Module_Base
{
	scopeCurator = 2;
	subCategory = "Garrison";
	displayName = "Garrison Nearest";
	function = "Ares_fnc_GarrisonNearest";
};

class Ares_Module_UnGarrison : Ares_Module_Base
{
	scopeCurator = 2;
	subCategory = "Garrison";
	displayName = "Un-Garrison";
	function = "Ares_fnc_UnGarrison";
};

class Ares_Module_Search_Nearby_Building : Ares_Module_Base
{
	scopeCurator = 2;
	subCategory = "Garrison";
	displayName = "Search Nearest House";
	function = "Ares_fnc_SearchNearbyBuilding";
};
