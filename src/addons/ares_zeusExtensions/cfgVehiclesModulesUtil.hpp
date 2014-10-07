class Ares_Module_Start_Group_Cleanup : Ares_Util_Module_Base
{
	scopeCurator = 2;
	displayName = "Start Group Auto-Cleanup Script";
	function = "Ares_fnc_UtilStartGroupCleanup";
};

class Ares_Module_Stop_Group_Cleanup : Ares_Util_Module_Base
{
	scopeCurator = 2;
	displayName = "Stop Group Auto-Cleanup Script";
	function = "Ares_fnc_UtilStopGroupCleanup";
};

class Ares_Module_Add_All_Objects_To_Curator : Ares_Util_Module_Base
{
	scopeCurator = 2;
	displayName = "Add Objects To Zeus";
	function = "Ares_fnc_AddAllObjectsToCuratorModule";
};

class Ares_Module_Remove_Objects_From_Curator : Ares_Util_Module_Base
{
	scopeCurator = 2;
	displayName = "Remove Objects From Zeus";
	function = "Ares_fnc_RemoveObjectsFromCuratorModule";
};
