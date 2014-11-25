class Ares_CopyPaste_Dialog
{
	idd = 123;
	movingEnable = false;
	onLoad = "((_this select 0) displayCtrl 1400) ctrlSetText (missionNamespace getVariable ['Ares_CopyPaste_Dialog_Text', '']);";
	onUnload = "missionNamespace setVariable ['Ares_CopyPaste_Dialog_Text', ctrlText ((_this select 0) displayCtrl 1400)];";

	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Anton SSGT., v1.063, #Lyrohu)
		////////////////////////////////////////////////////////
		class Ares_CopyPaste_Background: IGUIBack
		{
			idc = 2200;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 23 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
		};
		class Ares_CopyPaste_Background_Frame : RscFrame
		{
			idc = 2200;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 23 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
		};
		class Ares_CopyPaste_Ok_Button: RscButtonMenuOK
		{
			x = 29.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "missionNamespace setVariable ['Ares_CopyPaste_Dialog_Result', 1];";
			default = 0;
		};
		class Ares_CopyPaste_CancelButton: RscButtonMenuCancel
		{
			x = 34 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			onButtonClick = "missionNamespace setVariable ['Ares_CopyPaste_Dialog_Result', 0];";
			default = 0;
		};
		class Ares_CopyPaste_EditBox: RscEdit
		{
			idc = 1400;
			x = 2.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 35.5 * GUI_GRID_W;
			h = 18.5 * GUI_GRID_H;
			style = 16;
			linespacing = 1;
			default = 1;
		};
		class Ares_CopyPaste_Instructions: RscText
		{
			idc = 1000;
			text = "Copy/Paste clipboard contents using CTRL+C and CTRL+V"; //--- ToDo: Localize;
			x = 2 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 35.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
