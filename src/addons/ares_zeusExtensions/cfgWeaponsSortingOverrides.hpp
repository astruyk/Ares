// A bunch of defines to set the 'side' of equipment so that Arsenal code can
// sort it more effectivley. This is a lot faster and more reliable than trying to
// special-case sort everything based on display name.
#define SIDE_CSAT 0
#define SIDE_NATO 1
#define SIDE_AAF 2
#define SIDE_CIV 3

// Note - Can't set side for H_HelmetB directly to NATO because it is the base for
// everything and we don't want all helmets that aren't known to show up as Blufor only.
// Need special case for this helmet in the GenerateArsenalDataList code.
class H_HelmetB;

// Some forward defines for base classes we're not overriding
class H_Beret_blk;
class H_Cap_red;
class H_Bandanna_surfer;
class H_Booniehat_khk;
class H_MilCap_oucamo;

// CSAT - but has to be defined first because some other hats depend on it
class H_MilCap_ocamo : H_HelmetB { side = SIDE_CSAT; }

// NATO
class H_Bandanna_mcamo : H_Bandanna_surfer { side = SIDE_NATO; }
class H_Beret_02 : H_Beret_blk { side = SIDE_NATO; }
class H_Beret_grn_SF : H_Beret_blk { side = SIDE_NATO; }
class H_Booniehat_mcamo : H_Booniehat_khk { side = SIDE_NATO; }
class H_Cap_khaki_specops_UK : H_Cap_red { side = SIDE_NATO; }
class H_Cap_tan_specops_US : H_Cap_red { side = SIDE_NATO; }
class H_Cap_usblack : H_Cap_red { side = SIDE_NATO; }
class H_CrewHelmetHeli_B : H_HelmetB { side = SIDE_NATO; }
class H_HelmetB_black : H_HelmetB { side = SIDE_NATO; }
class H_HelmetB_camo : H_HelmetB { side = SIDE_NATO; }
class H_HelmetB_desert : H_HelmetB { side = SIDE_NATO; }
class H_HelmetB_grass : H_HelmetB { side = SIDE_NATO; }
class H_HelmetB_light : H_HelmetB { side = SIDE_NATO; }
class H_HelmetB_paint : H_HelmetB { side = SIDE_NATO; }
class H_HelmetB_plain_mcamo : H_HelmetB { side = SIDE_NATO; }
class H_HelmetB_sand : H_HelmetB { side = SIDE_NATO; }
class H_HelmetB_snakeskin : H_HelmetB { side = SIDE_NATO; }
class H_HelmetCrew_B : H_HelmetB { side = SIDE_NATO; }
class H_Helmet_Kerry : H_HelmetB { side = SIDE_NATO; }
class H_MilCap_mcamo : H_MilCap_ocamo { side = SIDE_NATO; }
class H_PilotHelmetFighter_B : H_HelmetB { side = SIDE_NATO; }
class H_PilotHelmetHeli_B : H_HelmetB { side = SIDE_NATO; }

// OPFOR
class H_Beret_ocamo : H_Beret_blk { side = SIDE_CSAT; }
class H_Cap_brn_SPECOPS : H_Cap_red { side = SIDE_CSAT; }
class H_CrewHelmetHeli_O : H_CrewHelmetHeli_B { side = SIDE_CSAT; }
class H_HelmetCrew_O : H_HelmetCrew_B { side = SIDE_CSAT; }
class H_HelmetO_ocamo : H_HelmetB { side = SIDE_CSAT; }
class H_PilotHelmetFighter_O : H_PilotHelmetFighter_B { side = SIDE_CSAT; }
class H_PilotHelmetHeli_O : H_PilotHelmetHeli_B { side = SIDE_CSAT; }

// AAF
class H_Booniehat_dgtl : H_Booniehat_khk { side = SIDE_AAF; }
class H_Cap_blk_Raven : H_Cap_red { side = SIDE_AAF; }
class H_CrewHelmetHeli_I : H_CrewHelmetHeli_B { side = SIDE_AAF; }
class H_HelmetCrew_I : H_HelmetCrew_B { side = SIDE_AAF; }
class H_HelmetIA : H_HelmetB { side = SIDE_AAF; }
class H_MilCap_dgtl : H_MilCap_oucamo { side = SIDE_AAF; }
class H_PilotHelmetFighter_I : H_PilotHelmetFighter_B { side = SIDE_AAF; }
class H_PilotHelmetHeli_I : H_PilotHelmetHeli_B { side = SIDE_AAF; }

// CIVILIAN
class H_Bandanna_surfer_blk : H_Bandanna_surfer { side = SIDE_CIV; }
class H_Bandanna_surfer_grn : H_Bandanna_surfer { side = SIDE_CIV; }
class H_Beret_blk_POLICE : H_Beret_blk { side = SIDE_CIV; }
class H_Cap_police : H_Cap_red { side = SIDE_CIV; }
class H_Cap_press : H_Cap_red { side = SIDE_CIV; }
class H_Cap_surfer : H_Cap_red { side = SIDE_CIV; }
class H_RacingHelmet_1_F : H_HelmetB_camo { side = SIDE_CIV; }
class H_StrawHat : H_HelmetB { side = SIDE_CIV; }
