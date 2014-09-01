
// Add actions to Zeus to go invisible and to come back from being invisible
if (player call Ares_fnc_IsZeus) then
{
	_player addAction ["Go invisible", {hint "Hello!";}];
	_player addAction ["Become Visible", {hint "Become visible!";}];
};