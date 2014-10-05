class Ares // This bit will be prefixed when actually calling the function (e.g. "Ares_fnc_...." )
{
	// Functions to call during initialization. See https://community.bistudio.com/wiki/Functions_Library_(Arma_3)
	class init
	{
		file = "\ares_zeusExtensions\functions\init";

		class InitAres { preInit = 1; }
		class InitAresEvents { preInit = 1; }
		class InitAresUi { preInit = 1; }
		class InitAresPlayerActions {};
	};

	// Functions called in response to events
	class events
	{
		file = "\ares_zeusExtensions\functions\events";

		class OnModuleTreeLoad {};
	}

	// Helper functions
	class util
	{
		file = "\ares_zeusExtensions\functions";

		class AddUnitsToCurator {};
		class ArsenalSetup {};
		class BroadcastCode {};
		class GetArrayDataFromUser {};
		class GetDialogChoiceFromUser {};
		class GetGroupUnderCursor {};
		class GetSafePos {};
		class GetUnitUnderCursor {};
		class GlobalExecute {};
		class IsZeus {};
		class LogMessage {};
		class MakePlayerInvisible {};
		class MonitorCuratorDisplay {};
		class ObjectsGrabber {};
		class ObjectsMapper {};
		class SearchBuilding {};
		class TeleportPlayers {};
		class WaitForZeus {};
		class ZenOccupyHouse {};
	};

	// Functions to perform module actions
	class modules
	{
		file = "\ares_zeusExtensions\functions\modules";
		class Empty {};
	};
	
	#include "cfgFunctionsArsenal.hpp"
	#include "cfgFunctionsBehaviour.hpp"
	#include "cfgFunctionsEquipment.hpp"
	#include "cfgFunctionsReinforcements.hpp"
	#include "cfgFunctionsSaveLoad.hpp"
	#include "cfgFunctionsTeleport.hpp"
};
