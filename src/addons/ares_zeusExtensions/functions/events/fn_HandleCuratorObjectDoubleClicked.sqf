private ["_curator","_clickedObject"];
_curator = _this select 0;
_clickedObject = _this select 1;
_handled = false;

[format ["Double-clicked object %1", _clickedObject]] call Ares_fnc_LogMessage;
if (not isNil "Ares_Ctrl_Key_Pressed") then
{
	if (Ares_Ctrl_Key_Pressed) then
	{
		["CTRL Key was pressed for double-click!"] call Ares_fnc_LogMessage;
		_handled = true;
		
		// Hack - trick the BIS function into thinking the mouse is over the double-clicked unit
		missionnamespace setVariable ["bis_fnc_curatorObjectPlaced_mouseOver",["OBJECT", _clickedObject]];
		
		_center = createCenter sideLogic;    
		_group = createGroup _center;  
		_logic = _group createUnit ["LOGIC", (getPos _clickedObject), [], 0, "NONE"];
		[_logic, [], true] call BIS_fnc_moduleRemoteControl;
		
		closeDialog 1;
	};
};

_handled;
