_interval = if(count _this > 0) then {_this select 0} else {10};

disableSerialization;

while {isNull (findDisplay 46)} do {
	sleep _interval;
};