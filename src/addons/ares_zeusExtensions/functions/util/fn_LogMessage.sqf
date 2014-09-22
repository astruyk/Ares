private["_message"];
_message = _this select 0;

player vehicleChat format["[ARES] %1", _message];
diag_log format["[ARES] %1", _message];