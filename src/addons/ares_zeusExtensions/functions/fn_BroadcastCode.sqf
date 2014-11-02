/*
	Runs a block of code on remote machines in a one-off function. Not suitable for calls that must happen for
	JIP players, but good to execute things on the server or as a one-time operation for everyone connected.

	If this function will be called frequently, consider making a custom function for it so we can only sync the
	code block one time. (e.g. Ares_fnc_AddUnitsToCurator).

	Params:
		0 - Code - The block of code to execute remotely.
		1 - Anything - (Optional) The parameters to pass to the code. Default: [].
		2 - Bool - (Optional) False if this should run only on the server, true if it should be run everywhere (including this machine). Default: true.
*/

_codeBlock = [_this, 0] call BIS_fnc_Param;
_params = [_this, 1, []] call BIS_fnc_Param;
_runOnAllMachines = [_this, 2, true, [true]] call BIS_fnc_Param;

Ares_oneshotCodeBlock = _codeBlock;
publicVariable "Ares_oneshotCodeBlock";

[_params, "Ares_oneshotCodeBlock", _runOnAllMachines] call BIS_fnc_MP;

true;
