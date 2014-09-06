_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_centerPosition = position _logic;

	_nameOfCompositionFirstGroup = "by X39";
	_nameOfCompositionSecondGroup = "FOBs";
	_nameOfComposition = "ION FOB ALPHA";
	_range = 500;
	_filterAmmoboxes = true;
	_classNameOfCompositionFirstGroup = [];
	_classNameOfCompositionSecondGroup = [];
	_classNameOfComposition = [];
	{
	    if(_x == 32) then
	    {
	        _classNameOfCompositionFirstGroup set[count _classNameOfCompositionFirstGroup, 95];
	    }
	    else
	    {
	        _classNameOfCompositionFirstGroup set[count _classNameOfCompositionFirstGroup, _x];
	    };
	    false
	}count toArray _nameOfCompositionFirstGroup;

	_classNameOfCompositionFirstGroup = toString _classNameOfCompositionFirstGroup;
	{
	    if(_x == 32) then
	    {
	        _classNameOfCompositionSecondGroup set[count _classNameOfCompositionSecondGroup, 95];
	    }
	    else
	    {
	        _classNameOfCompositionSecondGroup set[count _classNameOfCompositionSecondGroup, _x];
	    };
	    false
	}count toArray _nameOfCompositionSecondGroup;

	_classNameOfCompositionSecondGroup = toString _classNameOfCompositionSecondGroup;
	{
	    if(_x == 32) then
	    {
	        _classNameOfComposition set[count _classNameOfComposition, 95];
	    }
	    else
	    {
	        _classNameOfComposition set[count _classNameOfComposition, _x];
	    };
	    false
	}count toArray _nameOfComposition;

	_classNameOfComposition = toString _classNameOfComposition;
	_strArr = toArray format["class CfgGroups%7{%7%8class Empty%7%8{%7%8%8side = 8;%7%8%8name = ""Compositions"";%7%8%8class %4%7%8%8{%7%8%8%8name = ""%1"";%7%8%8%8class %5%7%8%8%8{%7%8%8%8%8name = ""%2"";%7%8%8%8%8class %6%7%8%8%8%8{%7%8%8%8%8%8name = ""%3"";%7", _nameOfCompositionFirstGroup, _nameOfCompositionSecondGroup, _nameOfComposition, _classNameOfCompositionFirstGroup, _classNameOfCompositionSecondGroup, _classNameOfComposition, toString [13,10], toString [9]];
	{
	    _flag = false;
	    _typeX = typeOf _x;
	    if(_typeX == "Rabbit_F") then {_flag = true;};
	    if(_typeX == "Snake_random_F") then {_flag = true;};
	    if(_typeX == "GroundWeaponHolder") then {_flag = true;};
	    if(_typeX == "Ares_Module_Save_Objects") then {_flag = true;};
	    if(_x == player) then {_flag = true;};
	    if(_filterAmmoboxes && {_x isKindOf "ReammoBox_F"}) then {_flag = true};
	    if(!_flag) then
	    {
	        _nulledPosition = [(position _x select 0) - (position player select 0), (position _x select 1) - (position player select 1), (position _x select 2) - (position player select 2)];
	        _strArr = _strArr + toArray(format["%8%8%8%8%8class Object%1 {side=8;vehicle=""%2"";rank="""";position[]={%3,%4,%5};dir=%6;};%7", _forEachIndex, _typeX, _nulledPosition select 0, _nulledPosition select 1, _nulledPosition select 2, direction _x, toString [13,10], toString [9]]);
	    };
	}forEach  nearestObjects [_centerPosition, ["all"], _range];

	_strArr = _strArr + toArray format["%2%2%2%2};%1%2%2%2};%1%2%2};%1%2};%1};", toString [13,10], toString [9]];
	copyToClipBoard toString _strArr;

	[objNull, format["Copied objects to clipboard."]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true
