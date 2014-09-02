private ["_curator","_selectedObject"];
_curator = _this select 0;
_selectedObject = _this select 1;

setVariable ["Ares_SelectedObject", [_curator, _selectedObject]];

[format ["Selected Object %1", _selectedObject]] call Ares_fnc_DisplayMessage;

hint "Object selected";