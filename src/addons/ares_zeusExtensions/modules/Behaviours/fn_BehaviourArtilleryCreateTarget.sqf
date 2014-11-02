_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_logic setName "Artillery Target";
	[objNull, "Created Artillery Target"] call bis_fnc_showCuratorFeedbackMessage;
};

true
