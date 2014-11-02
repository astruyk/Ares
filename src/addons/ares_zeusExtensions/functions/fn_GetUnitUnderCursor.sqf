/*
	Gets the unit under the mouse cursor.
	
	Params:
		0 - [Object] The module's logic unit that is trying to get the unit under the cursor. Will automatically be deleted if no unit is under the cursor.
		
	Returns:
		The unit under the cursor (if any). Otherwise the logic unit parameter is deleted.
*/
_logic = _this select 0;

_unitUnderCursor = objNull;
_mouseOverVariableValue = missionnamespace getvariable ["bis_fnc_curatorObjectPlaced_mouseOver",[""]];
if ((_mouseOverVariableValue select 0) == typename objNull) then
{
	_unitUnderCursor = _mouseOverVariableValue select 1;
};
if(isnull _unitUnderCursor) then {
	[objNull, "Error - Module needs to be placed on a unit."] call bis_fnc_showCuratorFeedbackMessage;
	deletevehicle _logic;
};

_unitUnderCursor