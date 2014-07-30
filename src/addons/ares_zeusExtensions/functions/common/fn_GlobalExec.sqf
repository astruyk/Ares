_params = _this select 0;
_fnc = _this select 1;
_isPersistent = if(count _this > 2) then {_this select 2} else {true};

[_params, _fnc, true, _isPersistent] spawn BIS_fnc_MP;