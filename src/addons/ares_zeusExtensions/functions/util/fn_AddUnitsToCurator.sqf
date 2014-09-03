_unitsToAdd = _this select 0;

if (isNil "Ares_addUnitsToCuratorFunction") then
{
	Ares_addUnitsToCuratorFunction =
	{
		{ _x addCuratorEditableObjects [(_this select 0), true]; } foreach allCurators;
	};
	publicVariable "Ares_addUnitsToCuratorFunction";
};

[[_unitsToAdd], "Ares_addUnitsToCuratorFunction", false] call BIS_fnc_MP;
true