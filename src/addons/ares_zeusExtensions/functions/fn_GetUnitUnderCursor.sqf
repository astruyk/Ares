/*
	Gets the unit under the mouse cursor.
	
	Params:
		0 - [Object] The module's logic unit that is trying to get the unit under the cursor. Will automatically be deleted if no unit is under the cursor.
		
	Returns:
		The unit under the cursor (if any). Otherwise the logic unit parameter is deleted.
*/
private ["_logic", "_unitUnderCursor"];
_logic = _this select 0;
_shouldRemoveUnitIfNoneFound = [_this, 1, true] call BIS_fnc_Param;

_unitUnderCursor = objNull;
_mouseOverUnit = curatorMouseOver;
if (count _mouseOverUnit == 0) then
{
	["GetUnitUnderCursor: Not in curator mode"] call Ares_fnc_LogMessage;
	// Not in curator mode.
}
else
{
	["GetUnitUnderCursor: In curator mode!"] call Ares_fnc_LogMessage;
	if (_mouseOverUnit select 0 == "") then
	{
		["GetUnitUnderCursor: No unit under cursor"] call Ares_fnc_LogMessage;
		// Mouse not over anything editable (value should be [""])
	}
	else
	{
		["GetUnitUnderCursor: Elements in select array!"] call Ares_fnc_LogMessage;
		if (count _mouseOverUnit == 2) then
		{
			// value should be [typeName, object]
			_unitUnderCursor = _mouseOverUnit select 1;
			[format ["GetUnitUnderCursor: Got unit under cursor: %1 (@%2)", _unitUnderCursor, position _unitUnderCursor]] call Ares_fnc_LogMessage;
		}
		else
		{
			["GetUnitUnderCursor: Unexpected number of array options"] call Ares_fnc_LogMessage;
		};
	};
};

if (_shouldRemoveUnitIfNoneFound && isNull _unitUnderCursor) then
{
	[objNull, "Error - Module needs to be placed on a unit."] call bis_fnc_showCuratorFeedbackMessage;
	deleteVehicle _logic;
};

_unitUnderCursor;
