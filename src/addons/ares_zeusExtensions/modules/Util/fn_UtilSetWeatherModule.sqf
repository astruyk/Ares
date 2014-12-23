#include "\ares_zeusExtensions\module_header.hpp"
#define SHARP_DECAY_VALUE 0.2
#define SMOOTH_DECAY_VALUE 0.002


_isFirstTimeSettingWeather = false;
if (isNil "Ares_Change_Weather_Function") then
{
	_isFirstTimeSettingWeather = true;
	Ares_Change_Weather_Function =
		{
			diag_log "Weather changed!";
			hint "Weather changer!";
			_settings = missionNamespace getVariable ["Ares_Weather_Settings", [0, 0, [0,0,0]]];
			0 setOvercast (_settings select 0);
			0 setRain (_settings select 1);
			0 setFog (_settings select 2);
			forceWeatherChange;
		};
	publicVariable "Ares_Change_Weather_Function";
	
	Ares_Setup_Weather_Change_Event_Handler =
		{
			diag_log "Setup handlers!";
			// Update the weather settings if they change without needing a re-broadcast.
			"Ares_Weather_Settings" addPublicVariableEventHandler { [] call Ares_Change_Weather_Function; };
		};
	publicVariable "Ares_Setup_Weather_Change_Event_Handler";
};

_altitudes = [0, 5, 10, 15, 20, 25, 30, 40, 50, 60, 70, 80, 100, 125, 150, 200, 300];
_altitudeDisplayValues = [];
{
	_altitudeDisplayValues pushBack (format ["%1 m", _x]);
} forEach _altitudes;

_dialogResult = [
		"Change Weather",
		[
			["Overcast", ["Off", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "Full"]],
			["Rain (Overcast > 70%)", ["Off", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "Full"]],
			["Fog Setting", ["None", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "Full"]],
			["Fog Decay", ["Smooth Transition / Low Falloff", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "Sharp Transition / High Falloff"]],
			["Fog Altitude (ASL)", _altitudeDisplayValues]
		]
	] call Ares_fnc_ShowChooseDialog;

if (count _dialogResult > 0) then
{
	_dialogCloudSetting = _dialogResult select 0;
	_dialogRainSetting = _dialogResult select 1;
	_dialogFogSetting = _dialogResult select 2;
	_dialogFogDecaySetting = _dialogResult select 3;
	_dialogFogBaseSetting = _dialogResult select 4;
	
	_cloudSetting = _dialogCloudSetting / 10;
	_rainSetting = _dialogRainSetting / 10;
	_fogSetting = _dialogFogSetting / 10;
	_fogDecaySetting = SMOOTH_DECAY_VALUE + ((SHARP_DECAY_VALUE - SMOOTH_DECAY_VALUE) * (_dialogFogDecaySetting / 10));
	_fogBaseSetting = _altitudes select _dialogFogBaseSetting;

	// Do this first so we setup the event handler on all machines
	if (_isFirstTimeSettingWeather) then
	{
		diag_log "Broadcasting weather change event handler...";
		[[], "Ares_Setup_Weather_Change_Event_Handler", true, true] call BIS_fnc_MP;
	};
	
	diag_log "Changing weather...";
	missionNamespace setVariable ["Ares_Weather_Settings", [_cloudSetting, _rainSetting, [_fogSetting, _fogDecaySetting, _fogBaseSetting]]];
	publicVariable "Ares_Weather_Settings";
	
	// Trigger the function locally since the eventHandler only works on OTHER machines.
	[] call Ares_Change_Weather_Function;
	
	[objNull, "Weather changing."] call bis_fnc_showCuratorFeedbackMessage;
};

#include "\ares_zeusExtensions\module_footer.hpp"
