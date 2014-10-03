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
		file = "\ares_zeusExtensions\functions\util";

		class ArsenalSetup {};
		class LogMessage {};
		class GetGroupUnderCursor {};
		class GetUnitUnderCursor {};
		class GlobalExecute {};
		class IsZeus {};
		class MonitorCuratorDisplay {};
		class WaitForZeus {};
		class TeleportPlayers {};
		class MakePlayerInvisible {};
		class AddUnitsToCurator {};
		class BroadcastCode {};
		class ObjectsGrabber {};
		class ObjectsMapper {};
		class ZenOccupyHouse {};
		class GetSafePos {};
		class JtdSearchBuilding {};
		class JtdArrayShuffle {};
		class GetArrayDataFromUser {};
	};

	// Functions to perform module actions
	class modules
	{
		file = "\ares_zeusExtensions\functions\modules"; // All of the scripts defined in this class are in the '\ares_zeusExtensions\scripts' folder.

		class Empty {};
		class RemoveNvgGroup {};
		class ForceLightsOn {};
		class ForceLightsOff {};
		class ForceLightsAuto {};
		class SurrenderSingleUnit {};
		class TeleportAllPlayers {};
		class TeleportSinglePlayer {};
		class TeleportZeus {};
		class TeleportSideNato {};
		class TeleportSideIndependent {};
		class TeleportSideCsat {};
		class TeleportSideCivilian {};
		class CreateTeleporter {};
		class SaveObjectsForComposition {};
		class SaveObjectsForPaste {};
		class PasteObjectsRelative {};
		class PasteObjectsAbsolute {};
		class GarrisonNearest {};
		class UnGarrison {};
		class SearchNearbyBuilding {};
		class DisableThermals {};
		class EnableThermals {};
		class ArsenalCopyToClipboard {};
		class ArsenalPasteFromClipboard {};
		class ArsenalPasteAdditive {};
		class ArsenalCreateNato {};
		class ArsenalCreateCsat {};
		class ArsenalCreateAaf {};
		class ArsenalCreateGuerilla {};
		class ReinforcementsCreateLz {};
		class ReinforcementsCreateRp {};
		class ReinforcementsCreateUnits {};
		class ReinforcementsDeleteMarker {};
		class AddAllObjectsToCuratorModule {};
	};
};
