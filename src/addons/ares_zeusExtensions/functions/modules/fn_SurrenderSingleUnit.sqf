_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	_unitToCapture = [_logic] call Ares_fnc_GetUnitUnderCursor;

	// These are all local actions, so we need to broadcast them to the world otherwise
	// they will not show up on other machines
	
	Ares_MakeCaptiveFunction = {
		["Making Captive"] call Ares_fnc_DisplayMessage;

		_unitToCapture = _this select 0;
		
		_unitToCapture setCaptive true;
		[_unitToCapture] join grpNull;

		// Have the unit drop their current weapons on the ground.
		/*_primaryWeapon = primaryWeapon _unitToCapture;
		if (_primaryWeapon != "") then
		{
			_unitToCapture action ["drop Weapon",_unitToCapture, _primaryWeapon];
		};
		_secondaryWeapon = secondaryWeapon _unitToCapture;
		if (_secondaryWeapon != "") then
		{
			_unitToCapture action ["drop Weapon",_unitToCapture, _secondaryWeapon];
		};*/
		
		removeAllWeapons _unitToCapture;
		
		// Prevent the unit from reacting to new targets. Otherwise they sometimes drop out of the captured animation.
		_unitToCapture disableAI "TARGET";
		_unitToCapture disableAI "AUTOTARGET";
		
		// Have the unit do the surrender animation. Since they don't have weapons they will stay in this mode
		// until otherwise told. You can't move them!
		_unitToCapture action ["Surrender", _unitToCapture];
		
		// Add an action that breaks the surrender anim. We have to use vanilla ARMA commands in here since other
		// computers might not be running the Ares mod.
		_unitToCapture addAction ["Secure",
			{
				_unit = _this select 0;
				_caller = _this select 1;
				_id = _this select 2;
				_arguments = _this select 3;

				[[_unit, _id], "Ares_SecureCaptiveFunction", true, false] spawn BIS_fnc_MP;
			}, [], 10, false, false]; 
	};
	
	Ares_SecureCaptiveFunction = 
	{
		_unit = _this select 0;
		_id = _this select 1;
		
		removeAllWeapons _unit;
		_unit switchMove "";
		_unit action ["sitDown", _unit];
		_unit removeAction _id;
		
		hint "Enemy unit secured.";
	};
	
	// Make the code that executes the capture public so we can call it on other machines.
	publicVariable "Ares_MakeCaptiveFunction";
	publicVariable "Ares_SecureCaptiveFunction";
	
	// Execute the capture on all machines and JIP players.
	[[_unitToCapture], "Ares_MakeCaptiveFunction", true, false] spawn BIS_fnc_MP;
	
	[objnull, format["Unit %1 has surrendered.", _unitToCapture]] call bis_fnc_showCuratorFeedbackMessage;
};

deleteVehicle _logic;
true