_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	[objNull, format["Objects Created."]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true
