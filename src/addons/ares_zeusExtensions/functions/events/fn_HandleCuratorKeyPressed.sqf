_key = _this select 1;
_handled = false;
[format ["Key Pressed %1", _key]] call Ares_fnc_LogMessage;
switch (_key) do
{
	case 29: // CTRL
	{
		["CTRL Pressed"] call Ares_fnc_LogMessage;
		Ares_Ctrl_Key_Pressed = true;
	};
};
_handled;
