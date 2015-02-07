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

		class OnModuleTreeLoad;
		class HandleCuratorObjectPlaced;
		class HandleCuratorObjectDoubleClicked;
		class HandleCuratorKeyPressed;
		class HandleCuratorKeyReleased;
	}

	// Helper functions
	class util
	{
		file = "\ares_zeusExtensions\functions";

		class AddUnitsToCurator;
		class ArsenalSetup;
		class BroadcastCode;
		class CompositionGrabber;
		class CreateLogic;
		class GenerateArsenalBlacklist;
		class GenerateArsenalDataList;
		class GetArrayDataFromUser;
		class GetFarthest;
		class GetGroupUnderCursor;
		class GetNearest;
		class GetPhoneticName;
		class GetSafePos;
		class GetUnitUnderCursor;
		class GlobalExecute;
		class IsZeus;
		class LogMessage;
		class MakePlayerInvisible;
		class MonitorCuratorDisplay;
		class ObjectsGrabber;
		class ObjectsMapper;
		class SearchBuilding;
		class ShowChooseDialog;
		class StringContains;
		class TeleportPlayers;
		class WaitForZeus;
		class ZenOccupyHouse;
	};

	// Functions to perform module actions
	class modules
	{
		file = "\ares_zeusExtensions\modules";
		class Empty;
	};
	
	#include "cfgFunctionsArsenal.hpp"
	#include "cfgFunctionsBehaviour.hpp"
	#include "cfgFunctionsEquipment.hpp"
	#include "cfgFunctionsReinforcements.hpp"
	#include "cfgFunctionsSaveLoad.hpp"
	#include "cfgFunctionsSpawn.hpp"
	#include "cfgFunctionsTeleport.hpp"
	#include "cfgFunctionsUtil.hpp"
	#include "cfgFunctionsCustomModules.hpp"
};
