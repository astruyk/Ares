class CfgPatches
{
    class Ares
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        requiredAddons[] = {"A3_Modules_F", "A3_Modules_F_Curator"};
		author[] = { "Anton Struyk" };
		authorUrl = "https://github.com/astruyk/";
		version = 0.0.1;
		versionStr = "0.0.1";
		versionAr[] = {0,0,1};
    };
};

// BEGIN DEFINITIONS FOR OBJECTS
class CfgGroups
{
	class AresCompositions
	{
		side = 8;
		name = "Ares";
		class MilitaryStructures
		{
			name = "Military Structures";
			class ObservationPosts
			{
				name = "Observation Posts";
				
				// Light OP with sandbags, small bunker, razor wire
				class LightOpAlpha
				{
					name = "Light OP Alpha";
					class Object1 {side=8;vehicle="Land_BagBunker_Small_F";rank="";position[]={0.189453,1.06055,-0.00143886};dir=179.087;};
					class Object2 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-1.26758,-3.54688,-0.00243902};dir=0;};
					class Object3 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={1.73242,-3.54102,-0.00243902};dir=0;};
					class Object4 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-1.12109,6.92383,-0.00243902};dir=0;};
					class Object5 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={1.83398,6.94336,-0.00243902};dir=0;};
					class Object6 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-3.94531,6.08008,-0.00243902};dir=151.663;};
					class Object7 {side=8;vehicle="Land_BagFence_Round_F";rank="";position[]={-6.31055,4.46289,-0.00274014};dir=109.179;};
					class Object8 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={4.61914,6.20703,-0.00243902};dir=204.108;};
					class Object9 {side=8;vehicle="Land_BagFence_Round_F";rank="";position[]={6.96484,4.70117,-0.00274014};dir=250.372;};
					class Object10 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={-0.986328,12.4375,-0.00143886};dir=0;};
					class Object11 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={-5.47852,11.2734,-0.00144124};dir=143.987;};
					class Object12 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={9.48438,9.10742,-0.00144124};dir=212.471;};
				};
				
				// Medium OP with H-barriers, observation tower, Cargo house & ammo crates
				class MedOpAlpha
				{
					name = "Med OP Alpha";
					class Object1 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={3.49805,-0.929688,-0.00143886};dir=269.333;};
					class Object3 {side=8;vehicle="Land_Pallet_MilBoxes_F";rank="";position[]={-3.71484,-3.33789,-0.00143886};dir=0;};
					class Object4 {side=8;vehicle="Land_Cargo_Patrol_V1_F";rank="";position[]={-2.90039,6.10742,-0.00143886};dir=177;};
					class Object5 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={5.69727,-1.32227,-0.00243902};dir=182.413;};
					class Object6 {side=8;vehicle="Land_PaperBox_open_full_F";rank="";position[]={-5.94141,-1.58594,-0.00143886};dir=0;};
					class Object7 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={2.48242,-6.05078,-0.00243902};dir=181.819;};
					class Object8 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-3.17969,-5.92383,-0.00143886};dir=181;};
					class Object9 {side=8;vehicle="CamoNet_BLUFOR_open_Curator_F";rank="";position[]={6.58008,-2.80078,-0.00143886};dir=0;};
					class Object10 {side=8;vehicle="Land_PaperBox_open_empty_F";rank="";position[]={-5.87109,-3.57031,-0.00143886};dir=0;};
					class Object11 {side=8;vehicle="Land_BagFence_End_F";rank="";position[]={4.87695,-6.125,-0.00243878};dir=0;};
					class Object12 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={3.43945,5.08594,-0.00143886};dir=269.333;};
					class Object13 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={8.63867,-1.46094,-0.00243902};dir=182.413;};
					class Object14 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-8.44336,-2.6582,-0.00143886};dir=87;};
					class Object15 {side=8;vehicle="Land_Cargo_House_V1_F";rank="";position[]={8.57227,5.72461,-0.00143886};dir=0;};
					class Object16 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-8.71875,5.6875,-0.00143886};dir=89;};
					class Object17 {side=8;vehicle="Land_BagFence_End_F";rank="";position[]={8.95117,-5.93555,-0.00243878};dir=179.891;};
					class Object18 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={2.93164,11.2031,-0.00143886};dir=179;};
					class Object19 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-5.53906,10.7793,-0.00143886};dir=0;};
					class Object20 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={11.3516,-5.90625,-0.00243902};dir=177.975;};
					class Object21 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={13.8184,-2.02148,-0.00143886};dir=91.9795;};
					class Object22 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={13.9297,6.42773,-0.00143886};dir=91.9795;};
					class Object23 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={11.1426,11.2813,-0.00143886};dir=3.17937;};
				};
				
				// Medium OP with H-barriers, speaker tower, Cargo house & ammo crates
				class MedOpBravo
				{
					name = "Med OP Bravo";
					class Object1 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={5.32813,-2.0918,-0.00143886};dir=218.506;};
					class Object2 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={3.4707,4.98633,-0.00143886};dir=127.37;};
					class Object3 {side=8;vehicle="Land_Pallet_MilBoxes_F";rank="";position[]={-3.60938,1.22266,-0.00143886};dir=37.6699;};
					class Object4 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-0.361328,-4.71094,-0.00387788};dir=218.67;};
					class Object5 {side=8;vehicle="Land_BagFence_End_F";rank="";position[]={-1.47656,4.08203,-0.00243878};dir=32.6901;};
					class Object6 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-4.76758,-1.15039,-0.00143886};dir=218.67;};
					class Object7 {side=8;vehicle="Land_PaperBox_open_full_F";rank="";position[]={-4.30078,3.9707,-0.00143886};dir=37.6699;};
					class Object8 {side=8;vehicle="Land_PaperBox_open_empty_F";rank="";position[]={-5.45898,2.35547,-0.00143886};dir=37.6699;};
					class Object9 {side=8;vehicle="Land_BagFence_End_F";rank="";position[]={1.48633,-6.23438,-0.00243878};dir=37.6699;};
					class Object10 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-3.58789,5.38477,-0.00243902};dir=213.69;};
					class Object11 {side=8;vehicle="CamoNet_BLUFOR_open_Curator_F";rank="";position[]={4.86719,-4.64258,-0.00143886};dir=37.6699;};
					class Object12 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-6.93555,4.65039,-0.00143886};dir=124.67;};
					class Object13 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={1.24414,8.61328,-0.00243902};dir=32.0698;};
					class Object14 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={4.24414,5.86133,-0.00143886};dir=306.67;};
					class Object15 {side=8;vehicle="Land_BagFence_End_F";rank="";position[]={4.83008,-8.57422,-0.00243878};dir=216.67;};
					class Object16 {side=8;vehicle="Land_Cargo_House_V1_F";rank="";position[]={11.6543,0.888672,-0.00143886};dir=37.6699;};
					class Object17 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-2.05469,11.4258,-0.00143886};dir=126.67;};
					class Object18 {side=8;vehicle="Land_Loudspeakers_F";rank="";position[]={8.58594,7.80859,-0.00143886};dir=307.287;};
					class Object19 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={6.74805,-10.0176,-0.00243902};dir=214.67;};
					class Object20 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={5.70117,10.9727,-0.00243902};dir=35.3246;};
					class Object21 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={10.5488,8.8125,-0.00143886};dir=216.67;};
					class Object22 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={1.49805,13.7988,-0.00243902};dir=32.2847;};
					class Object23 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={11.0723,-8.45117,-0.00143886};dir=128.67;};
					class Object24 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={16.3242,-1.83203,-0.00143886};dir=128.67;};
					class Object25 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={17.084,3.71484,-0.00143886};dir=40.6699;};
				};
			};
			
			class Roadblocks
			{
				name = "Roadblocks";
				
				class RoadblockAlpha
				{
					name = "Large Roadblock Alpha";
					class Object1 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={-0.933594,-6.00977,-0.00137758};dir=359.882;};
					class Object2 {side=8;vehicle="Land_BarGate_F";rank="";position[]={-6.55859,2.96094,-0.00143886};dir=266.507;};
					class Object3 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={4.50586,-6.19141,-0.00143886};dir=177.832;};
					class Object4 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={-2.92383,-6.08008,-0.00137806};dir=357.292;};
					class Object5 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-1.61523,7.24805,-0.00143886};dir=181;};
					class Object6 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={3.99219,6.47656,-0.00243902};dir=179.809;};
					class Object7 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={-4.81445,-6.23633,-0.00138021};dir=355.517;};
					class Object8 {side=8;vehicle="Land_Pallet_MilBoxes_F";rank="";position[]={-2.03125,9.69531,-0.00143886};dir=0;};
					class Object9 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={10.1875,-6.20703,-0.00143886};dir=181.033;};
					class Object10 {side=8;vehicle="Land_PaperBox_open_empty_F";rank="";position[]={-4.30664,9.60156,-0.00143886};dir=0;};
					class Object12 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-5.91211,-11.1855,-0.00143886};dir=268.845;};
					class Object14 {side=8;vehicle="Land_PaperBox_open_full_F";rank="";position[]={-4.37695,11.5859,-0.00143886};dir=0;};
					class Object15 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-6.87891,10.5137,-0.00143886};dir=87;};
					class Object16 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={11.2109,6.46484,-0.00243902};dir=179.809;};
					class Object17 {side=8;vehicle="Land_CncBarrierMedium4_F";rank="";position[]={-12.0508,-6.4707,-0.00143886};dir=359.872;};
					class Object18 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={7.26172,11.8496,-0.00243902};dir=182;};
					class Object19 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={9.99609,-12.0586,-0.00143886};dir=268.513;};
					class Object20 {side=8;vehicle="Land_CncBarrierMedium4_F";rank="";position[]={-12.6504,6.19531,-0.00143886};dir=359.413;};
					class Object21 {side=8;vehicle="Land_WaterTank_F";rank="";position[]={7.26953,13.1133,-0.0014441};dir=180.203;};
					class Object22 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={5.0625,12.2422,-0.00143886};dir=269;};
					class Object23 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-5.79102,-16.6875,-0.00143886};dir=268.845;};
					class Object24 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={10.1953,11.7754,-0.00243902};dir=179.809;};
					class Object25 {side=8;vehicle="Land_Loudspeakers_F";rank="";position[]={-3.8457,-16.2813,-0.00143886};dir=0;};
					class Object26 {side=8;vehicle="Land_Cargo20_military_green_F";rank="";position[]={15.2363,-8.93555,-0.001436};dir=88.6403;};
					class Object27 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-0.105469,-17.8652,-0.00143886};dir=358.557;};
					class Object28 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={10.0879,-17.4297,-0.00143886};dir=268.513;};
					class Object29 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-5.60547,-18.0586,-0.00143886};dir=358.225;};
					class Object30 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={16.7461,7.29688,-0.00143886};dir=359.241;};
					class Object31 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={5.35938,-17.8809,-0.00137758};dir=357.243;};
					class Object32 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={7.07031,-17.9121,-0.00137973};dir=206.632;};
					class Object33 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-18.1973,-7.99219,-0.00243902};dir=88.5431;};
					class Object34 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={9.02539,-17.793,-0.0013864};dir=359.965;};
					class Object35 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-7.1543,18.8594,-0.00143886};dir=89;};
					class Object36 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-18.6309,8.26953,-0.00243902};dir=89.7367;};
					class Object37 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-12.9199,-16.0352,-0.00243902};dir=179.437;};
					class Object38 {side=8;vehicle="Land_Cargo_House_V1_F";rank="";position[]={10.1367,18.8965,-0.00143886};dir=0;};
					class Object39 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={5.00391,18.2578,-0.00143886};dir=269;};
					class Object40 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-18.1016,-11.0664,-0.00243902};dir=88.5431;};
					class Object41 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-13.8281,16.5684,-0.00243902};dir=180.63;};
					class Object42 {side=8;vehicle="Land_Cargo20_military_green_F";rank="";position[]={19.9238,-8.74414,-0.001436};dir=88.6403;};
					class Object43 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-18.6816,11.2305,-0.00243902};dir=89.7367;};
					class Object44 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-15.8047,-16.0391,-0.00243902};dir=179.437;};
					class Object45 {side=8;vehicle="Land_CncBarrierMedium4_F";rank="";position[]={-21.7441,-6.33008,-0.00143886};dir=359.872;};
					class Object46 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-18.0234,-14.0293,-0.00243902};dir=88.5431;};
					class Object47 {side=8;vehicle="Land_CncBarrierMedium4_F";rank="";position[]={-22.1621,6.21289,-0.00143886};dir=359.413;};
					class Object48 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-18.752,14.1797,-0.00243902};dir=89.7367;};
					class Object49 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-16.7129,16.625,-0.00243902};dir=180.63;};
					class Object50 {side=8;vehicle="Land_BagFence_Corner_F";rank="";position[]={-18.0059,-16.0625,-0.00243878};dir=176.485;};
					class Object51 {side=8;vehicle="Land_Cargo20_sand_F";rank="";position[]={17.7148,-16.1133,-0.00143552};dir=0.000311313;};
					class Object52 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={-3.97461,23.9512,-0.00143886};dir=0;};
					class Object53 {side=8;vehicle="Land_BagFence_Corner_F";rank="";position[]={-18.7773,16.6035,-0.00243878};dir=270.467;};
					class Object54 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={4.49609,24.375,-0.00143886};dir=179;};
					class Object55 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={24.4121,7.24805,-0.00143886};dir=359.241;};
					class Object56 {side=8;vehicle="Land_CncBarrier_stripes_F";rank="";position[]={-25.9922,-7.20898,-0.00143886};dir=266.786;};
					class Object57 {side=8;vehicle="Land_CncBarrier_stripes_F";rank="";position[]={-26.709,6.82422,-0.00143886};dir=266.779;};
					class Object58 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={12.707,24.4531,-0.00143886};dir=3;};
					class Object59 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={24.6582,12.7852,-0.00143886};dir=269;};
					class Object60 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={-26.0195,-14.6191,-0.00144124};dir=268;};
					class Object61 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={-26.9219,10.7441,-0.00144124};dir=269.194;};
					class Object62 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={29.5371,11,-0.00143886};dir=91;};
					class Object63 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={24.5586,18.4395,-0.00143886};dir=269;};
					class Object64 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={21.1035,24.4512,-0.00143886};dir=180.711;};
					class Object65 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={29.8203,18.6602,-0.00143886};dir=91;};
				};
			};
		};
	};
};
