// Store some local variables. These will be available in any module
// script that #includes this.
_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

// Stop running the module script if the module wasn't created by this instance.
// Fixes issues where the server would delete modules before the position of the 
// module could be determined - causing things to happen at [0,0,0]
if (!local _logic) exitWith {};
if (!_activated) exitWith {};
