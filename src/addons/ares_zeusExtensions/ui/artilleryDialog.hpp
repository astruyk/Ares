
class Ares_Artillery_Dialog
{
	idd = 1354;
	movingEnable = false;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Anton SSGT., v1.063, #Syfaxo)
		////////////////////////////////////////////////////////
		class Ares_ArtilleryDialog_Frame: RscFrame
		{
			idc = 1800;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 38.5 * GUI_GRID_W;
			h = 9.5 * GUI_GRID_H;
		};
		class Ares_ArtilleryDialog_Text_AmmoType: RscText
		{
			idc = 1000;
			text = "Ammunition Type"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ArtilleryDialog_Combo_AmmoType: RscCombo
		{
			idc = 2100;
			x = 17.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ArtilleryDialog_Text_ChooseTarget: RscText
		{
			idc = 1001;
			text = "Target Based On"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ArtilleryDialog_Text_Rounds: RscText
		{
			idc = 1002;
			text = "Number of Rounds"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ArtilleryDialog_Combo_Rounds: RscCombo
		{
			idc = 2101;
			x = 17.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ArtilleryDialog_Combo_ChooseTarget: RscCombo
		{
			idc = 2102;
			x = 17.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 21 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ArtilleryDialog_Button_Ok: RscButtonMenuOK
		{
			x = 29.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ArtilleryDialog_Button_Cancel: RscButtonMenuCancel
		{
			x = 34 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
