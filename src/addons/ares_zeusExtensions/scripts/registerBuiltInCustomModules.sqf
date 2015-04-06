{
	call compile preprocessFileLineNumbers ("\ares_zeusExtensions\scripts\" + _x + ".sqf");
} forEach
	[
		"Arsenal_AddFullArsenal",
		"Equipment_RemoveWeaponOptics",
		"SaveLoad_CreateMissionSQF",
		"Util_ChangePlayerSides",
		"Util_EnableDebugLog",
		"Util_DisableDebugLog",
		"Util_ExecuteCodeLocal",
		"Util_MakeZeusInvisible",
		"Util_MakeZeusVisible",
		"Util_RemoveAllActions"
	];

