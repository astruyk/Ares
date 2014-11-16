/*
	Gets the unit under the mouse cursor.
	
	Params:
		0 - [Object] The module's logic unit that is trying to get the unit under the cursor. Will automatically be deleted if no unit is under the cursor.
		
	Returns:
		The unit under the cursor (if any). Otherwise the logic unit parameter is deleted.
*/
private ["_logic", "_unitUnderCursor", "_mouseOverVariableValue"];
_logic = _this select 0;
_shouldRemoveUnitIfNoneFound = [_this, 1, true] call BIS_fnc_Param;

_unitUnderCursor = objNull;
if (not isNil "Ares_CuratorObjectPlaced_UnitUnderCursor") then
{
	_mouseOverVariableValue = Ares_CuratorObjectPlaced_UnitUnderCursor;
	if (count _mouseOverVariableValue == 0) then
	{
		// Not in curator mode.
	}
	else
	{
		if (_mouseOverVariableValue select 0 == "") then
		{
			// Mouse not over anything editable (value should be [""])
		}
		else
		{
			if (count _mouseOverVariableValue == 2) then
			{
				// value should be [typeName, object]
				_unitUnderCursor = _mouseOverVariableValue select 1;
			};
		};
	};
};

if (_shouldRemoveUnitIfNoneFound && isNull _unitUnderCursor) then
{
	[objNull, "Error - Module needs to be placed on a unit."] call bis_fnc_showCuratorFeedbackMessage;
	deleteVehicle _logic;
};

_unitUnderCursor;
