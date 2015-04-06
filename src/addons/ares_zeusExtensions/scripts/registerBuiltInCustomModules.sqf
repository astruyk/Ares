_scripts = [
		"Arsenal_AddFullArsenal",
		"Equipment_RemoveWeaponOptics",
		"SaveLoad_CreateMissionSQF",
		"Util_ChangePlayerSides",
		"Util_EnableDebugLog",
		"Util_DisableDebugLog",
		"Util_ExecuteCodeAll",
		"Util_ExecuteCodeLocal",
		"Util_ExecuteCodeServer",
		"Util_MakeZeusInvisible",
		"Util_MakeZeusVisible",
		"Util_RemoveAllActions"
	];
{
	call compile preprocessFileLineNumbers ("\ares_zeusExtensions\scripts\" + _x + ".sqf");
} forEach _scripts;

