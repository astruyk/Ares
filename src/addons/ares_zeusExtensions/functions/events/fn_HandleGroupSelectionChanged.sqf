private ["_curator","_selectedGroup"];
_curator = _this select 0;
_selectedGroup = _this select 1;

setVariable ["Ares_SelectedGroup", [_curator, _selectedGroup]];

[format ["Selected Group %1", _selectedGroup]] call Ares_fnc_DisplayMessage;
hint "Group selected";