_logic = _this select 0;

_unit = objnull;
_mouseOver = missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver",[""]];
if ((_mouseOver select 0) == typename objnull) then {
	_unit = _mouseOver select 1;
};
if(isnull _unit) then {
	[objnull, "Error - Module was not placed on any unit"] call bis_fnc_showCuratorFeedbackMessage;
	deletevehicle _logic;
};

_unit