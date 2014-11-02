_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated && local _logic) then
{
	// These smoke templates based on code from the wiki: https://community.bistudio.com/wiki/ParticleTemplates
	
	_options = [
		"Vehicle Fire Look-Alike",
		"Small Oil Smoke",
		"Medium Oil Smoke",
		"Large Oil Smoke",
		"Small Wood Smoke",
		"Medium Wood Smoke",
		"Large Wood Smoke",
		"Small Mixed Smoke",
		"Large Mixed Smoke"
		];
	_dialogResult = ["Create Smoke Effect", ["Smoke Type", _options]] call Ares_fnc_ShowChooseDialog;
	if (count _dialogResult > 0) then
	{
		if (isNil "Ares_SmokeGroup") then
		{
			Ares_SmokeGroup = createGroup (side player);
			publicVariable "Ares_SmokeGroup";
		};
		
		_sourceObject = Ares_SmokeGroup createUnit ["LOGIC", (position _logic), [], 0, ""];
		_sourceObject setName format["Smoke Source (%1)", _options select (_dialogResult select 0)];
		[[_sourceObject]] call Ares_fnc_AddUnitsToCurator;
		switch(_dialogResult select 0) do
		{
			case 0:
			{
				if (isNil "Ares_SmokeConfigFunc_0") then
				{
					Ares_SmokeConfigFunc_0 =
					{
						_sourceObject = _this select 0;
						_ps1 = "#particlesource" createVehicle (getPos _sourceObject);
						_ps2 = "#particlesource" createVehicle (getPos _sourceObject);
						_ps3 = "#particlesource" createVehicle (getPos _sourceObject);
						
						// Fire
						_ps1 setParticleCircle [0, [0, 0, 0]];
						_ps1 setParticleRandom [0.2, [1, 1, 0], [0.5, 0.5, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
						_ps1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 2, 6], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 0.5], 1, 1, 0.9, 0.3, [1.5], [[1, 0.7, 0.7, 0.5]], [1], 0, 0, "", "", _sourceObject];
						_ps1 setDropInterval 0.03;
						
						// Smoke part 1
						_ps2 setParticleCircle [0, [0, 0, 0]];
						_ps2 setParticleRandom [0, [0, 0, 0], [0.33, 0.33, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.05], 0, 0];
						_ps2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 0, 1], "", "Billboard", 1, 10, [0, 0, 0.5], [0, 0, 2.9], 1, 1.275, 1, 0.066, [4, 5, 10, 10], [[0.3, 0.3, 0.3, 0.33], [0.4, 0.4, 0.4, 0.33], [0.2, 0.2, 0, 0]], [0, 1], 1, 0, "", "", _sourceObject];
						_ps2 setDropInterval 0.5;
						
						// Smoke part 2
						_ps3 setParticleCircle [0, [0, 0, 0]];
						_ps3 setParticleRandom [0, [0, 0, 0], [0.5, 0.5, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.05], 0, 0];
						_ps3 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 15, [0, 0, 0.5], [0, 0, 2.9], 1, 1.275, 1, 0.066, [4, 5, 10, 10], [[0.1, 0.1, 0.1, 0.75], [0.4, 0.4, 0.4, 0.5], [1, 1, 1, 0.2]], [0], 1, 0, "", "", _sourceObject];
						_ps3 setDropInterval 0.25;
					};
					publicVariable "Ares_SmokeConfigFunc_0";
				};
				[[_sourceObject], "Ares_SmokeConfigFunc_0", true, true] call BIS_fnc_MP;
			};
			
			case 1:
			{
				// Small Oily Smoke
				if (isNil "Ares_SmokeConfigFunc_1") then
				{
					Ares_SmokeConfigFunc_1 =
					{
						_sourceObject = _this select 0;
						_ps = "#particlesource" createVehicle (getPos _sourceObject);
						
						_ps setParticleCircle [0, [0, 0, 0]];
						_ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
						_ps setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 8], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _sourceObject];
						_ps setDropInterval 0.05;
					};
				};
				
				[[_sourceObject], "Ares_SmokeConfigFunc_1", true, true] call BIS_fnc_MP;
			};
			case 2:
			{
				// Medium Oily Smoke
				if (isNil "Ares_SmokeConfigFunc_2") then
				{
					Ares_SmokeConfigFunc_2 =
					{
						_sourceObject = _this select 0;
						_ps = "#particlesource" createVehicle (getPos _sourceObject);
						
						_ps setParticleCircle [0, [0, 0, 0]];
						_ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
						_ps setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 8], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 2.5], 0, 10, 7.9, 0.066, [2, 6, 12], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _sourceObject];
						_ps setDropInterval 0.1;
					};
				};
				
				[[_sourceObject], "Ares_SmokeConfigFunc_2", true, true] call BIS_fnc_MP;
			};
			case 3:
			{
				// Large Oily Smoke
				if (isNil "Ares_SmokeConfigFunc_3") then
				{
					Ares_SmokeConfigFunc_3 =
					{
						_sourceObject = _this select 0;
						_ps = "#particlesource" createVehicle (getPos _sourceObject);
						
						_ps setParticleCircle [0, [0, 0, 0]];
						_ps setParticleRandom [0, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
						_ps setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 6], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [4, 12, 20], [[0.1, 0.1, 0.1, 0.8], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _sourceObject];
						_ps setDropInterval 0.1;
					};
				};
				
				[[_sourceObject], "Ares_SmokeConfigFunc_3", true, true] call BIS_fnc_MP;
			};
			
			case 4:
			{
				// Large Wood Smoke
				if (isNil "Ares_SmokeConfigFunc_4") then
				{
					Ares_SmokeConfigFunc_4 =
					{
						_sourceObject = _this select 0;
						_ps = "#particlesource" createVehicle (getPos _sourceObject);
						
						_ps setParticleCircle [0, [0, 0, 0]];
						_ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
						_ps setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.5, 0.5, 0.5, 0.15], [0.75, 0.75, 0.75, 0.075], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _sourceObject];
						_ps setDropInterval 0.05;
					};
				};
				
				[[_sourceObject], "Ares_SmokeConfigFunc_4", true, true] call BIS_fnc_MP;
			};
			case 5:
			{
				// Large Wood Smoke
				if (isNil "Ares_SmokeConfigFunc_5") then
				{
					Ares_SmokeConfigFunc_5 =
					{
						_sourceObject = _this select 0;
						_ps = "#particlesource" createVehicle (getPos _sourceObject);
						
						_ps setParticleCircle [0, [0, 0, 0]];
						_ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
						_ps setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 2.5], 0, 10, 7.9, 0.066, [2, 6, 12], [[0.5, 0.5, 0.5, 0.3], [0.75, 0.75, 0.75, 0.15], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _sourceObject];
						_ps setDropInterval 0.1;
					};
				};
				
				[[_sourceObject], "Ares_SmokeConfigFunc_5", true, true] call BIS_fnc_MP;
			};
			case 6:
			{
				// Large Wood Smoke
				if (isNil "Ares_SmokeConfigFunc_6") then
				{
					Ares_SmokeConfigFunc_6 =
					{
						_sourceObject = _this select 0;
						_ps = "#particlesource" createVehicle (getPos _sourceObject);
						
						_ps setParticleCircle [0, [0, 0, 0]];
						_ps setParticleRandom [0, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
						_ps setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [4, 12, 20], [[0.5, 0.5, 0.5, 0.5], [0.75, 0.75, 0.75, 0.25], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _sourceObject];
						_ps setDropInterval 0.1;
					};
				};
				
				[[_sourceObject], "Ares_SmokeConfigFunc_6", true, true] call BIS_fnc_MP;
			};
			
			case 7:
			{
				// Small Mixed Smoke
				if (isNil "Ares_SmokeConfigFunc_7") then
				{
					Ares_SmokeConfigFunc_7 =
					{
						_sourceObject = _this select 0;
						_ps1 = "#particlesource" createVehicle (getPos _sourceObject);
						_ps2 = "#particlesource" createVehicle (getPos _sourceObject);
						
						_ps1 setParticleCircle [0, [0, 0, 0]];
						_ps1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
						_ps1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 8], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.2, 0.2, 0.2, 0.45], [0.35, 0.35, 0.35, 0.225], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _sourceObject];
						_ps1 setDropInterval 0.1;
						
						_ps2 setParticleCircle [0, [0, 0, 0]];
						_ps2 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
						_ps2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.33, 0.33, 0.33, 0.8], [0.66, 0.66, 0.66, 0.4], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _sourceObject];
						_ps2 setDropInterval 0.1;
					};
				};
				
				[[_sourceObject], "Ares_SmokeConfigFunc_7", true, true] call BIS_fnc_MP;
			};
			case 8:
			{
				// Large Mixed Smoke
				if (isNil "Ares_SmokeConfigFunc_8") then
				{
					Ares_SmokeConfigFunc_8 =
					{
						_sourceObject = _this select 0;
						_ps1 = "#particlesource" createVehicle (getPos _sourceObject);
						_ps2 = "#particlesource" createVehicle (getPos _sourceObject);
						
						_ps1 setParticleCircle [0, [0, 0, 0]];
						_ps1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
						_ps1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 1, 8], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 2.5], 0, 10, 7.9, 0.066, [2, 6, 12], [[0.2, 0.2, 0.2, 0.3], [0.35, 0.35, 0.35, 0.2], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _sourceObject];
						_ps1 setDropInterval 0.2;
						
						_ps2 setParticleCircle [0, [0, 0, 0]];
						_ps2 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
						_ps2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 2.5], 0, 10, 7.9, 0.066, [2, 6, 12], [[0.33, 0.33, 0.33, 0.8], [0.66, 0.66, 0.66, 0.4], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _sourceObject];
						_ps2 setDropInterval 0.2;
					};
				};
				
				[[_sourceObject], "Ares_SmokeConfigFunc_8", true, true] call BIS_fnc_MP;
			};

			default {};
		};
	};
};

deleteVehicle _logic;
true