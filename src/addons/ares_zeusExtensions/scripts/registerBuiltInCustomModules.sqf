{
	call compile preprocessFileLineNumbers ('\ares_zeusExtensions\scripts\' + _x + '.sqf');
} forEach
	[
		'Arsenal_AddFullArsenal',
		'Arsenal_RemoveArsenal',
		'Util_EnableDebugLog',
		'Util_DisableDebugLog',
		'Util_ChangePlayerSides'
	];

