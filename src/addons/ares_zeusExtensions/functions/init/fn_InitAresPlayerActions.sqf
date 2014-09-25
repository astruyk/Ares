
// Add actions to Zeus to go invisible and to come back from being invisible
if ([player] call Ares_fnc_IsZeus) then
{
	player addAction ["<t color='#ff0000'>Go invisible</t>", {[_this select 3, true] spawn Ares_fnc_MakePlayerInvisible; }, player, 1.5, false, false, "", "player getVariable [""Ares_isUnitInvisible"", ""false""] != ""true"""];
	player addAction ["<t color='#00ff00'>Become Visible</t>", {[_this select 3, false] spawn Ares_fnc_MakePlayerInvisible; }, player, 1.5, false, false, "", "player getVariable [""Ares_isUnitInvisible"", ""false""] == ""true"""];
};