
// Add actions to Zeus to go invisible and to come back from being invisible
if ([player] call Ares_fnc_IsZeus) then
{
	player addAction ["Go invisible", {[_this select 3] spawn Ares_fnc_MakePlayerInvisible; }, player, 1.5, false, false, "", "player getVariable [""Ares_unitVisibility"", ""visible""] == ""visible"""];
	player addAction ["Become Visible", {[_this select 3] spawn Ares_fnc_MakePlayerVisible; }, player, 1.5, false, false, "", "player getVariable [""Ares_unitVisibility"", ""visible""] != ""visible"""];
};