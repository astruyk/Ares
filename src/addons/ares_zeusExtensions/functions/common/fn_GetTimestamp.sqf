_mode = if(count _this > 0) then {_this select 0} else {0};


if(_mode == 0) exitWith
{
	_year = date select 0;
	_month = date select 1;
	_day = date select 2;
	_hour = date select 3;
	_minute = date select 4;
	_second = floor (time % 60);
	
	_hourText = if(_hour >= 10) then {format ["%1", _hour]} else {format ["0%1", _hour]};
	_minuteText = if(_minute >= 10) then {format ["%1", _minute]} else {format ["0%1", _minute]};
	_secondText = if(_second >= 10) then {format ["%1", _second]} else {format ["0%1", _second]};

	format ["%1-%2-%3 %4:%5:%6", _year, _month, _day, _hourText, _minuteText, _secondText]
};

if(_mode == 1) exitWith
{
	_hour = floor ((time / 3600) % 24);
	_minute = floor ((time / 60) % 60);
	_second = floor (time % 60);
	_millisecond = (floor (diag_tickTime * 1000)) % 1000;

	_hourText = if(_hour >= 10) then {format ["%1", _hour]} else {format ["0%1", _hour]};
	_minuteText = if(_minute >= 10) then {format ["%1", _minute]} else {format ["0%1", _minute]};
	_secondText = if(_second >= 10) then {format ["%1", _second]} else {format ["0%1", _second]};
	_millisecondText = if(_millisecond >= 100) then {format ["%1", _millisecond]} else {if(_millisecond > 10) then {format ["0%1", _millisecond]} else {format ["00%1", _millisecond]}};
	
	format ["%1:%2:%3.%4", _hourText, _minuteText, _secondText, _millisecondText]
};