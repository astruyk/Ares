_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// These smoke templates based on code from the wiki: https://community.bistudio.com/wiki/ParticleTemplates
	
	_options = ["Vehicle Fire Look-Alike"];
	_dialogResult = [_options, 0, "Choose the type of smoke to spawn:"] call Ares_fnc_GetDialogChoiceFromUser;
	if (_dialogResult != -1) then
	{
		_group = createGroup (side player);
		_pos = [0, 0, 0]
		_sourceObject = _group createUnit ["LOGIC", (position _logic), [], 0, ""];
		_sourceObject setName format["Smoke Source (%1)", _options select _dialogResult];
		switch(_dialogResult) do
		{
			case 0:
			{
				// Fire
				_PS1 = "#particlesource" createVehicle (getPos _sourceObject);
				_PS1 setParticleCircle [0, [0, 0, 0]];
				_PS1 setParticleRandom [0.2, [1, 1, 0], [0.5, 0.5, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
				_PS1 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 2, 6], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.5], 1, 1, 0.9, 0.3, [1.5], [[1, 0.7, 0.7, 0.5]], [1], 0, 0, "", "", _sourceObject];
				_PS1 setDropInterval 0.03;
				_PS1 attachTo [_sourceObject,[0,0,0]];
				
				// Smoke part 1
				_PS2 = "#particlesource" createVehicle (getPos _sourceObject);
				_PS2 setParticleCircle [0, [0, 0, 0]];
				_PS2 setParticleRandom [0, [0, 0, 0], [0.33, 0.33, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.05], 0, 0];
				_PS2 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 0, 1], "", "Billboard", 1, 10, [0, 0, 0.5], [0, 0, 2.9], 1, 1.275, 1, 0.066, [4, 5, 10, 10], [[0.3, 0.3, 0.3, 0.33], [0.4, 0.4, 0.4, 0.33], [0.2, 0.2, 0, 0]], [0, 1], 1, 0, "", "", _sourceObject];
				_PS2 setDropInterval 0.5;
				_PS2 attachTo [_sourceObject,[0,0,0]];
				
				// Smoke part 2
				_PS3 = "#particlesource" createVehicle (getPos _sourceObject);
				_PS3 setParticleCircle [0, [0, 0, 0]];
				_PS3 setParticleRandom [0, [0, 0, 0], [0.5, 0.5, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.05], 0, 0];
				_PS3 setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 3, 1], "", "Billboard", 1, 15, [0, 0, 0.5], [0, 0, 2.9], 1, 1.275, 1, 0.066, [4, 5, 10, 10], [[0.1, 0.1, 0.1, 0.75], [0.4, 0.4, 0.4, 0.5], [1, 1, 1, 0.2]], [0], 1, 0, "", "", _sourceObject];
				_PS3 setDropInterval 0.25;
				_PS3 attachTo [_sourceObject,[0,0,0]];
			};
			default {};
		};
	};
};

deleteVehicle _logic;
true