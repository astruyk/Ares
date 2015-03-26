{
	call compile preprocessFileLineNumbers ('\ares_zeusExtensions\scripts\' + _x + '.sqf');
} forEach
	[
		'Arsenal_AddFullArsenal',
		'Util_EnableDebugLog',
		'Util_DisableDebugLog',
		'Util_ChangePlayerSides',
		'Util_MakeZeusInvisible',
		'Util_MakeZeusVisible',
		'Util_RemoveAllActions'
	];

