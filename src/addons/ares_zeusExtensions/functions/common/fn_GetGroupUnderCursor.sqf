_logic = _this select 0;

_group = objnull;
_mouseOver = missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver", [""]];
if ((_mouseOver select 0) == typename objnull) then {
	_unit = _mouseOver select 1;
	_group = group _unit;
} else {
	_group = _mouseOver select 0;
};
if(isnull _group) then {
	[objnull, "Error - Module was not placed on any group or unit"] call bis_fnc_showCuratorFeedbackMessage;
	deletevehicle _logic;
};

_group