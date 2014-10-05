// A generic dialog to make a choice from a drop-down menu.

class Ares_Choose_Dialog
{
	idd = 1234;
	movingEnable = false;

	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Anton SSGT., v1.063, #Riryje)
		////////////////////////////////////////////////////////
		class Ares_ChooseDialog_Background: IGUIBack
		{
			idc = 0001;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 8 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
		};
		class Ares_ChooseDialog_Frame: RscFrame
		{
			idc = 1800;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 8 * GUI_GRID_H;
		};
		class Ares_ChooseDialog_Label: RscText
		{
			idc = 1000;
			text = "Label"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 36 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class Ares_ChooseDialog_Combo: RscCombo
		{
			idc = 2100;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 36 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class Ares_ChooseDialog_Ok_Button: RscButtonMenuOK
		{
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "missionNamespace setVariable ['Ares_Dialog_Result', 1]; missionNamespace setVariable ['Ares_ChooseDialog_SelectedValue', lbCurSel 2100];";
		};
		class Ares_ChooseDialog_Cancel: RscButtonMenuCancel
		{
			x = 34 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "missionNamespace setVariable ['Ares_Dialog_Result', 0];";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

