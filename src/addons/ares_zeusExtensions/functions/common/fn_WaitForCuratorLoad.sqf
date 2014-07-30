//Hold here until at least one curator is availabe
while {(count allCurators) < 1} do {
	sleep 10;
};

//Hold here until at least one curator has a valid unit attached
_validCuratorExists = false;
while {!_validCuratorExists} do {
	{
		if(!isnull getassignedcuratorunit _x) then
		{
			_validCuratorExists = true;
		};
	} foreach allCurators;

	sleep 2;
};