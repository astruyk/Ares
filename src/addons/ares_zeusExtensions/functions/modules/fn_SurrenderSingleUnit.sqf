_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_unitUnderCursor = [_logic] call Ares_fnc_GetUnitUnderCursor;

	_unitUnderCursor setCaptive true;
	[_unitUnderCursor] join grpNull;

	// Have the unit drop their current weapons on the ground.
	_primaryWeapon = primaryWeapon _unitUnderCursor;
	if (_primaryWeapon != "") then
	{
		_unitUnderCursor action ["dropWeapon",_unitUnderCursor, _primaryWeapon];
	};
	_secondaryWeapon = secondaryWeapon _unitUnderCursor;
	if (_secondaryWeapon != "") then
	{
		_unitUnderCursor action ["drop Weapon",_unitUnderCursor, _secondaryWeapon];
	};
	
	// Have the unit do the surrender animation. Since they don't have weapons they will stay in this mode
	// until otherwise told. You can't move them!
	_unitUnderCursor action ["Surrender", _unitUnderCursor];
	
	// Add an action that breaks the surrender anim. We have to use vanilla ARMA commands in here since other
	// computers might not be running the Ares mod.
	_unitUnderCursor addAction ["Secure",
		{
			_unit = _this select 0;
			_caller = _this select 1;
			_id = _this select 2;
			_arguments = _this select 3;

			removeAllWeapons _unit;
			_unit switchMove "";
			_unit action ["sitDown", _unit];
			_unit removeAction _id;
			
			hint "Enemy unit secured.";
		}, [], 10, false, false]; 
	
	[objnull, format["Unit %1 has surrendered.", _unitUnderCursor]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true