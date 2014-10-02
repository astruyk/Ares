// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_LINEBREAK        98
#define CT_OBJECT_CONT_ANIM 83
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C
#define ST_GROUP_BOX       96
#define ST_GROUP_BOX2      112
#define ST_ROUNDED_CORNER  ST_GROUP_BOX + ST_CENTER
#define ST_ROUNDED_CORNER2 ST_GROUP_BOX2 + ST_CENTER

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar 
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

// Import from editor defines
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

///////////////////////////////////////////////////////////////////////////
/// Base Classes
///////////////////////////////////////////////////////////////////////////

class IGUIBack
{
	type = CT_STATIC;
	idc = -1;
	style = ST_BACKGROUND;
	shadow = 2;
	colorBackground[] = {0, 0, 0, 1};
	colorText[] = {1, 1, 1, 1};
	font = "PuristaMedium";
	sizeEx = 0.02;
	text = "";
};
class RscFrame
{
	type = CT_STATIC;
	idc = -1;
	style = ST_FRAME;
	shadow = 2;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "PuristaMedium";
	sizeEx = 0.02;
	text = "";
};
class RscEdit
{
	access = 0;
	type = CT_EDIT;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = { 0, 0, 0, 1};
	colorText[] = { 0.95, 0.95, 0.95, 1 };
	colorSelection[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",
		1
	};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = ST_SINGLE;
	font = "PuristaMedium";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorDisabled[] = { 1, 1, 1, 0.25 };
	canModify = 1;
};
class RscButton
{
	borderSize = 0;
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.7};
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	colorBorder[] = {0,0,0,1};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorShadow[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	h = 0.039216;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	offsetX = 0.003;
	offsetY = 0.003;
	shadow = 2;
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	style = 2;
	text = "";
	type = 1;
	w = 0.095589;
	x = 0;
	y = 0;
};
class RscButtonMenuOK : RscButton
{
	idc = 1;
	colorBackground[] = { 0, 0, 0, 1};
	colorText[] = { 0.95, 0.95, 0.95, 1 };
	colorDisabled[] = {0, 0, 0, 1};
	colorTextDisabled[] = {0.85, 0.85, 0.85, 1};
	shortcuts[] = 
	{
		"0x00050000 + 0",
		28,
		57,
		156
	};
	text = "OK";
};
class RscButtonMenuCancel : RscButton
{
	idc = 2;
	colorBackground[] = { 0, 0, 0, 1};
	colorText[] = { 0.95, 0.95, 0.95, 1 };
	colorDisabled[] = {0, 0, 0, 1};
	colorTextDisabled[] = {0.85, 0.85, 0.85, 1};
	shortcuts[] = 
	{
		"0x00050000 + 1"
	};
	text = "Cancel";
};
class RscText
{
 access = 0;
 type = CT_STATIC;
 idc = -1;
 style = ST_LEFT;
 w = 0.1; h = 0.05;
 //x and y are not part of a global class since each rsctext will be positioned 'somewhere'
 font = "PuristaMedium";
 sizeEx = 0.04;
 colorBackground[] = {0,0,0,0};
 colorText[] = {1,1,1,1};
 text = "";
 fixedWidth = 0;
 shadow = 0;
};

