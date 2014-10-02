/* #Rocaru
$[
	1.063,
	["Ares_ReinforcementDialog",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1800,"Ares_ReinforcementDialog_Frame",[2,"",["1.5 * GUI_GRID_W + GUI_GRID_X","1.5 * GUI_GRID_H + GUI_GRID_Y","37.5 * GUI_GRID_W","13 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2100,"Ares_ReinforcementDialog_Combo_Side",[2,"",["21.5 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"The side of the units to spawn.","-1"],[]],
	[1000,"Ares_ReinforcementDialog_Text_Side",[2,"Reinforcement Side",["2 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","16 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"Ares_ReinforcementDialog_Text_Type",[2,"Vehicle Type",["2 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2101,"Ares_ReinforcementDialog_Combo_Type",[2,"",["21.5 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"The class of vehicle to use to transport the units into the LZ.","-1"],[]],
	[1002,"Ares_ReinforcementDialog_Text_VehicleBehaviour",[2,"Vehicle Behaviour After Dropoff",["2 * GUI_GRID_W + GUI_GRID_X","6 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2102,"Ares_ReinforcementDialog_Combo_Vehicle_Behaviour",[2,"",["21.5 * GUI_GRID_W + GUI_GRID_X","6 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"What the vehicle should do after it drops off the troops.","-1"],[]],
	[1003,"Ares_ReinforcementDialog_Text_LZ",[2,"Vehicle Landing Zone",["2 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1004,"Ares_ReinforcementDialog_Text_RP",[2,"Unit Rally Point",["2 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2103,"Ares_ReinforcementDialog_Combo_LZ",[2,"",["21.5 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"How the vehicle should choose an LZ.","-1"],[]],
	[2104,"Ares_ReinforcementDialog_Combo_LZ",[2,"",["21.5 * GUI_GRID_W + GUI_GRID_X","10 * GUI_GRID_H + GUI_GRID_Y","16.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"How the units should choose a Rally Point.","-1"],[]],
	[2600,"",[2,"",["29.5 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2700,"",[2,"",["34 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Anton SSGT., v1.063, #Rocaru)
////////////////////////////////////////////////////////

class Ares_Reinforcement_Dialog
{
	idd = 123;
	movingEnable = false;
	onUnload = "missionNamespace setVariable ['Ares_CopyPaste_Dialog_Text', ctrlText ((_this select 0) displayCtrl 1400)];";
	
	class controls
	{
		class Ares_ReinforcementDialog_Frame: RscFrame
		{
			idc = 1800;
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 37.5 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
		};
		class Ares_ReinforcementDialog_Combo_Side: RscCombo
		{
			idc = 2100;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "The side of the units to spawn."; //--- ToDo: Localize;
		};
		class Ares_ReinforcementDialog_Text_Side: RscText
		{
			idc = 1000;
			text = "Reinforcement Side"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ReinforcementDialog_Text_Type: RscText
		{
			idc = 1001;
			text = "Vehicle Type"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ReinforcementDialog_Combo_Type: RscCombo
		{
			idc = 2101;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "The class of vehicle to use to transport the units into the LZ."; //--- ToDo: Localize;
		};
		class Ares_ReinforcementDialog_Text_VehicleBehaviour: RscText
		{
			idc = 1002;
			text = "Vehicle Behaviour After Dropoff"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ReinforcementDialog_Combo_Vehicle_Behaviour: RscCombo
		{
			idc = 2102;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "What the vehicle should do after it drops off the troops."; //--- ToDo: Localize;
		};
		class Ares_ReinforcementDialog_Text_LZ: RscText
		{
			idc = 1003;
			text = "Vehicle Landing Zone"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ReinforcementDialog_Text_RP: RscText
		{
			idc = 1004;
			text = "Unit Rally Point"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ReinforcementDialog_Combo_LZ: RscCombo
		{
			idc = 2103;
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "How the vehicle should choose an LZ."; //--- ToDo: Localize;
		};
		class RscButtonMenuOK_2600: RscButtonMenuOK
		{
			x = 29.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscButtonMenuCancel_2700: RscButtonMenuCancel
		{
			x = 34 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
		};
};
