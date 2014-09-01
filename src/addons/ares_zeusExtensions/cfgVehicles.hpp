/*class Ares_Module_Test : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Ares Test";
	function = "Ares_fnc_test";
};*/

class Ares_Module_RemoveNvgSingle : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Remove Nvg (Single Unit)";
	function = "Ares_fnc_RemoveNvgSingleUnit";
};

class Ares_Module_RemoveNvgGroup : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Remove Nvg (Group)";
	function = "Ares_fnc_RemoveNvgGroup";
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

class Ares_Module_Teleport_Selected : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport Selected Unit";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportSelectedUnit";
};

class Ares_Module_Teleport_Zeus : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport Zeus";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportZeus";
};

class Ares_Module_Teleport_CreateTeleporter : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Create Teleport Marker";
	subCategory = "Teleport";
	function = "Ares_fnc_CreateTeleporter";
};
