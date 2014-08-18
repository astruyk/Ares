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
		};
	};
};

				