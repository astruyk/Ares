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

		class DisplayMessage {};
		class GetGroupUnderCursor {};
		class GetUnitUnderCursor {};
		class GlobalExecute {};
		class IsZeus {};
		class MonitorCuratorDisplay {};
		class WaitForZeus {};
		class TeleportPlayers {};
		class MakePlayerInvisible {};
		class MakePlayerVisible {};
	};

	// Functions to perform module actions
	class modules
	{
		file = "\ares_zeusExtensions\functions\modules"; // All of the scripts defined in this class are in the '\ares_zeusExtensions\scripts' folder.

		class Empty {};
		class RemoveNvgSingleUnit {};
		class RemoveNvgGroup {};
		//class SurrenderSingleUnit {};
		class TeleportAllPlayers {};
		class TeleportSinglePlayer {};
		class TeleportZeus {};
		class CreateTeleporter {};
	};
};
