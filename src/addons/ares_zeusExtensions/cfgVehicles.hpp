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
	function = "Ares_fnc_TeleportAllPlayers";
};

class Ares_Module_Teleport_Aaf : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport AAF";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportAafPlayers";
};

class Ares_Module_Teleport_Civilian : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport Civilians";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportCivilianPlayers";
};

class Ares_Module_Teleport_Csat : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport CSAT";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportCsatPlayers";
};

class Ares_Module_Teleport_Nato : Ares_Module_Base
{
	scopeCurator = 2;
	displayName = "Teleport NATO";
	subCategory = "Teleport";
	function = "Ares_fnc_TeleportNatoPlayers";
};
