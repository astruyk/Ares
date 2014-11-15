#include "\ares_zeusExtensions\module_header.hpp"
_groupUnderCursor = [_logic] call Ares_fnc_GetGroupUnderCursor;

if (isNil "Ares_RemoveNvgGroupCode") then
{
	Ares_RemoveNvgGroupCode =
	{
		_group = _this select 0;
		if (local _group) then
		{
			{
				_unit = _x;
				{
					_unit unassignItem _x;
					_unit removeItem _x;
				} forEach ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
				_unit removePrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "acc_flashlight";
			} forEach units _group;
		};
	};
	publicVariable "Ares_RemoveNvgGroupCode";
};

[[_groupUnderCursor], "Ares_RemoveNvgGroupCode", true, true] call BIS_fnc_MP;

[objnull, "Removed NVGoogles from Group."] call bis_fnc_showCuratorFeedbackMessage;

deleteVehicle _logic;
true