// Imported from http://forums.bistudio.com/showthread.php?112775-JTD-Building-Search-script
// JTD_arrayShuffle

private ["_array", "_count", "_arrayT", "_arrayN", "_c", "_r"];

_array = _this select 0;
_count = count _array;
_arrayN = [];
_arrayT = [];
_c = 0;
_r = 0;

while {_c < (count _array)} do
{
    while {_r in _arrayT} do
    {_r = floor (random (count _array));
    };
    _arrayT = _arrayT + [_r];
    _arrayN set [_c, _array select _r];
    _c = _c + 1;
};

_arrayN  