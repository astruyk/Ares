class AresCompositions
{
	side = 8;
	name = "Ares";
	class AresMilitaryStructures
	{
		name = "Military Structures";
		class AresObservationPosts
		{
			name = "Observation Posts";
			
			// Light OP with sandbags, small bunker, razor wire
			class AresLightOpAlpha
			{
				name = "Sm. OP Alpha";
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
			class AresMedOpAlpha
			{
				name = "Med. OP Alpha";
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
			class AresMedOpBravo
			{
				name = "Med. OP Bravo";
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
			
			class AresSmallFieldCommand
			{
				name = "Sm. Field Command";
				class Object1 {side=8;vehicle="Land_Cargo_HQ_V1_F";rank="";position[]={-4.21899,-6.00586,-0.00143862};dir=89.112;};
				class Object2 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={0.268311,7.86768,-0.00143862};dir=0;};
				class Object3 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={2.41235,-8.35107,-0.00143862};dir=0.48668;};
				class Object4 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={5.53516,7.84814,-0.00143862};dir=0;};
				class Object5 {side=8;vehicle="CamoNet_INDP_open_Curator_F";rank="";position[]={-8.18286,8.55127,-0.00143862};dir=178.49;};
				class Object6 {side=8;vehicle="CamoNet_INDP_open_Curator_F";rank="";position[]={12.3687,0.978027,-0.00143862};dir=271.571;};
				class Object7 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={-2.7019,13.2935,-0.00143862};dir=0.851427;};
				class Object8 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={-15.3643,3.65381,-0.00143862};dir=270.269;};
				class Object9 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={-15.3281,-4.97803,-0.00143862};dir=271.207;};
				class Object10 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={-11.1125,13.1929,-0.00143862};dir=0.851427;};
				class Object11 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={17.3374,-1.65283,-0.00143862};dir=271.209;};
				class Object12 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={-3.17773,-17.9146,-0.00143862};dir=180.796;};
				class Object13 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={17.2676,6.8457,-0.00143862};dir=271.209;};
				class Object14 {side=8;vehicle="Land_BagBunker_Small_F";rank="";position[]={-16.2139,10.1162,-0.00143862};dir=88.7408;};
				class Object15 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={8.75293,17.1211,-0.00143862};dir=270.888;};
				class Object16 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={8.59668,-19.6699,-0.00143862};dir=270.531;};
				class Object17 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={17.3542,-10.0342,-0.00143862};dir=271.209;};
				class Object18 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={-15.21,-13.0947,-0.00143862};dir=270.269;};
				class Object19 {side=8;vehicle="Land_Cargo_House_V1_F";rank="";position[]={12.6204,-16.9165,-0.00143862};dir=180.445;};
				class Object20 {side=8;vehicle="Land_Cargo_Patrol_V1_F";rank="";position[]={12.7532,17.4746,-0.00143862};dir=180.641;};
				class Object21 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={2.2627,-21.2095,-0.00143862};dir=270.094;};
				class Object22 {side=8;vehicle="Land_Tank_rust_F";rank="";position[]={-2.72827,-21.2856,-0.00143862};dir=0;};
				class Object23 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={-11.7,-18.1187,-0.00143862};dir=179.946;};
				class Object24 {side=8;vehicle="Land_CratesShabby_F";rank="";position[]={-9.00488,-19.9883,-0.00143862};dir=0;};
				class Object25 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={17.282,15.2681,-0.00143862};dir=271.209;};
				class Object26 {side=8;vehicle="Land_Sack_F";rank="";position[]={-11.1787,-20.355,-0.00143862};dir=0;};
				class Object27 {side=8;vehicle="Land_CratesWooden_F";rank="";position[]={-12.8433,-20.3091,-0.00143862};dir=0;};
				class Object28 {side=8;vehicle="Land_StallWater_F";rank="";position[]={-0.85083,-24.2417,-0.00143862};dir=0;};
				class Object29 {side=8;vehicle="Land_cargo_addon02_V1_F";rank="";position[]={-11.3164,-21.4619,-0.00143862};dir=0;};
				class Object30 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={11.8506,-21.5117,-0.00143862};dir=181.513;};
				class Object31 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={13.8552,20.439,-0.00143862};dir=0.585755;};
				class Object32 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={17.3362,-18.3843,-0.00143862};dir=271.209;};
				class Object33 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-3.86084,-26.2207,-0.00143862};dir=0;};
				class Object34 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={1.78516,-26.2207,-0.00143862};dir=0;};
				class Object35 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-15.0525,-24.25,-0.00143862};dir=269.452;};
				class Object36 {side=8;vehicle="Land_HBarrier_3_F";rank="";position[]={-7.0083,-26.2998,-0.00143862};dir=0;};
				class Object37 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={7.43237,-26.2251,-0.00143862};dir=0;};
				class Object38 {side=8;vehicle="Land_HBarrier_1_F";rank="";position[]={-15.0168,-25.5342,-0.00143862};dir=0;};
			};
		};
		
		class AresCheckpoints
		{
			name = "Road Checkpoints";
			
			class CheckpointAlpha
			{
				name = "Checkpoint Alpha";
				class Object1 {side=8;vehicle="Land_BarGate_F";rank="";position[]={3.89453,3.8125,-0.00143886};dir=0.501482;};
				class Object2 {side=8;vehicle="RoadCone_F";rank="";position[]={4.69141,1.87695,-0.00143027};dir=20.4454;};
				class Object3 {side=8;vehicle="RoadCone_F";rank="";position[]={-4.58789,2.29102,-0.00143051};dir=223.983;};
				class Object4 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={-5.43945,-1.14844,-0.00138044};dir=92.6586;};
				class Object5 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={-5.40039,2.73828,-0.00137806};dir=88.4255;};
				class Object6 {side=8;vehicle="Land_PortableLight_single_F";rank="";position[]={-5.01563,5.14648,-0.00143886};dir=213.463;};
				class Object7 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-5.99414,-6.5625,-0.00143886};dir=270.934;};
				class Object8 {side=8;vehicle="RoadCone_F";rank="";position[]={-4.11719,6.40625,-0.00142956};dir=9.29275;};
				class Object9 {side=8;vehicle="RoadCone_F";rank="";position[]={4.72852,6.21094,-0.00143051};dir=212.74;};
				class Object10 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={7.83398,-1.38086,-0.00143886};dir=274.934;};
				class Object11 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-10.2617,4.17188,-0.00143886};dir=1.93435;};
				class Object12 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={6.68164,-6.92383,-0.00243902};dir=272.934;};
				class Object13 {side=8;vehicle="Land_Loudspeakers_F";rank="";position[]={7.48047,-6.0918,-0.00143886};dir=93.9344;};
				class Object14 {side=8;vehicle="Land_Pallet_MilBoxes_F";rank="";position[]={10.3027,-1.13281,-0.00143886};dir=93.9344;};
				class Object15 {side=8;vehicle="Land_PaperBox_open_empty_F";rank="";position[]={10.3672,1.14258,-0.00143886};dir=93.9344;};
				class Object16 {side=8;vehicle="Land_CncBarrierMedium4_F";rank="";position[]={-5.13672,9.97461,-0.00143886};dir=92.9343;};
				class Object17 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-6.40039,-12.2305,-0.00143886};dir=274.934;};
				class Object18 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={11.4512,3.64844,-0.00143886};dir=180.934;};
				class Object19 {side=8;vehicle="Land_CncBarrierMedium4_F";rank="";position[]={7.54297,9.70313,-0.00143886};dir=92.9343;};
				class Object20 {side=8;vehicle="Land_PaperBox_open_full_F";rank="";position[]={12.3496,1.08008,-0.00143886};dir=93.9344;};
				class Object21 {side=8;vehicle="CamoNet_BLUFOR_open_Curator_F";rank="";position[]={-12.4824,-4.07227,-0.00143886};dir=91.4299;};
				class Object22 {side=8;vehicle="Land_WaterBarrel_F";rank="";position[]={-13.5,2.61719,-0.00143194};dir=359.932;};
				class Object23 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-15.7598,4.42969,-0.00143886};dir=1.93435;};
				class Object24 {side=8;vehicle="Land_CncBarrier_stripes_F";rank="";position[]={14.2949,0.810547,-0.00143886};dir=96.1986;};
				class Object25 {side=8;vehicle="Land_Pallet_MilBoxes_F";rank="";position[]={-14.5156,-1.18945,-0.00143886};dir=0;};
				class Object26 {side=8;vehicle="Land_PaperBox_open_empty_F";rank="";position[]={-14.5156,-2.99805,-0.00143886};dir=0;};
				class Object28 {side=8;vehicle="Land_CncBarrier_F";rank="";position[]={15.1719,0.572266,-0.00143886};dir=112.121;};
				class Object29 {side=8;vehicle="Land_WaterBarrel_F";rank="";position[]={-15.0605,2.83203,-0.0014317};dir=359.972;};
				class Object30 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-12.2227,-11.6387,-0.00143886};dir=1.93435;};
				class Object31 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={6.17188,-14.1211,-0.00243902};dir=272.934;};
				class Object32 {side=8;vehicle="Land_CncBarrier_stripes_F";rank="";position[]={-14.7871,-4.48633,-0.00143886};dir=175.294;};
				class Object33 {side=8;vehicle="Land_CncBarrier_F";rank="";position[]={-14.8555,-5.39258,-0.00143886};dir=191.217;};
				class Object34 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={11.8164,-10.5508,-0.00243902};dir=275.934;};
				class Object35 {side=8;vehicle="Land_CncBarrier_F";rank="";position[]={-14.6797,-6.14844,-0.00143886};dir=180.372;};
				class Object36 {side=8;vehicle="Land_CncBarrier_F";rank="";position[]={15.9453,0.603516,-0.00143886};dir=101.276;};
				class Object37 {side=8;vehicle="Land_Cargo_Patrol_V1_F";rank="";position[]={-10.2129,14.1152,-0.00143886};dir=186.245;};
				class Object38 {side=8;vehicle="Land_WaterTank_F";rank="";position[]={13.0762,-10.6465,-0.00144386};dir=273.936;};
				class Object39 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={12.3594,-8.38281,-0.00143886};dir=2.93437;};
				class Object40 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-17.1406,4.33594,-0.00143886};dir=91.9343;};
				class Object41 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-6.23047,16.209,-0.00243902};dir=181.934;};
				class Object42 {side=8;vehicle="CamoNet_BLUFOR_open_Curator_F";rank="";position[]={17.5156,-3,-0.00143886};dir=1.18737;};
				class Object43 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-17.3262,-1.16211,-0.00143886};dir=91.9343;};
				class Object44 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={11.541,-13.4746,-0.00243902};dir=272.934;};
				class Object45 {side=8;vehicle="CamoNet_BLUFOR_Curator_F";rank="";position[]={14.9023,10.7559,-0.00143886};dir=183.332;};
				class Object46 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={10.0215,15.5254,-0.00243902};dir=182.934;};
				class Object47 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-14.6191,11.4941,-0.00243902};dir=272.934;};
				class Object48 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-9.30664,16.3262,-0.00243902};dir=181.934;};
				class Object49 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={-17.7168,-6.61133,-0.00137758};dir=90.8459;};
				class Object50 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-17.5918,-11.3613,-0.00143886};dir=1.93435;};
				class Object51 {side=8;vehicle="Land_Cargo20_military_green_F";rank="";position[]={-9.46875,-17.0801,-0.00143552};dir=181.934;};
				class Object52 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={19.7168,3.18945,-0.00143886};dir=3.27689;};
				class Object53 {side=8;vehicle="Land_CncBarrierMedium4_F";rank="";position[]={-4.33008,19.6348,-0.00143886};dir=92.9343;};
				class Object54 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={12.9766,15.373,-0.00243902};dir=182.934;};
				class Object55 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-14.4277,14.373,-0.00243902};dir=272.934;};
				class Object56 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-12.2676,16.4492,-0.00243902};dir=181.934;};
				class Object57 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={-17.8789,-10.2754,-0.00138044};dir=92.6573;};
				class Object58 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={17.9707,10.166,-0.00243902};dir=273.934;};
				class Object59 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={6.62305,-19.6992,-0.00143886};dir=92.9343;};
				class Object60 {side=8;vehicle="Land_CncBarrierMedium4_F";rank="";position[]={8.21289,19.1914,-0.00143886};dir=92.9343;};
				class Object61 {side=8;vehicle="Land_BagFence_Corner_F";rank="";position[]={-14.2988,16.5723,-0.00243878};dir=269.934;};
				class Object62 {side=8;vehicle="Land_PowerGenerator_F";rank="";position[]={20.9766,-5.88867,-0.00143886};dir=4.41046;};
				class Object63 {side=8;vehicle="Land_CargoBox_V1_F";rank="";position[]={21.877,0.527344,0.0291049};dir=184.773;};
				class Object64 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={15.9238,15.2422,-0.00243902};dir=182.934;};
				class Object65 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={18.2246,13.0391,-0.00243902};dir=273.934;};
				class Object66 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={18.3613,-8.73828,-0.00143886};dir=2.93437;};
				class Object67 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-21.3008,-7.10352,-0.00243902};dir=272.56;};
				class Object68 {side=8;vehicle="Land_Cargo_House_V1_F";rank="";position[]={18.6484,-13.9004,-0.00143886};dir=93.9344;};
				class Object69 {side=8;vehicle="Land_BagFence_Corner_F";rank="";position[]={18.3457,15.1016,-0.00243878};dir=3.93436;};
				class Object70 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-21.4375,-10.0684,-0.00243902};dir=272.56;};
				class Object71 {side=8;vehicle="Land_Cargo20_military_green_F";rank="";position[]={-9.59961,-21.7695,-0.00143886};dir=181.934;};
				class Object72 {side=8;vehicle="Land_CncBarrier_stripes_F";rank="";position[]={-4.91602,23.9316,-0.00143886};dir=359.934;};
				class Object73 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={24.6582,-0.171875,-0.00143886};dir=93.9344;};
				class Object74 {side=8;vehicle="Land_CncBarrier_stripes_F";rank="";position[]={9.13281,23.6836,-0.00143886};dir=359.934;};
				class Object75 {side=8;vehicle="Land_Cargo20_sand_F";rank="";position[]={-16.7988,-19.0605,-0.00143552};dir=93.9344;};
				class Object76 {side=8;vehicle="Land_HBarrierBig_F";rank="";position[]={24.502,-8.65039,-0.00143886};dir=272.934;};
				class Object77 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={-12.3066,24.4648,-0.00144124};dir=1.93435;};
				class Object78 {side=8;vehicle="Land_FieldToilet_F";rank="";position[]={20.9355,-18.1699,-0.00139594};dir=95.8264;};
				class Object79 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={13.0605,23.6309,-0.00144124};dir=2.93437;};
				class Object80 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={6.04688,-27.3457,-0.00143886};dir=92.9343;};
				class Object81 {side=8;vehicle="Land_FieldToilet_F";rank="";position[]={20.8203,-19.7598,-0.00142169};dir=95.5832;};
				class Object83 {side=8;vehicle="Land_Cargo_House_V1_F";rank="";position[]={17.8301,-23.9746,-0.00143886};dir=93.9344;};
				class Object84 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={24.0156,-16.8496,-0.00143886};dir=96.9344;};
				class Object86 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={11.5566,-27.9727,-0.00143886};dir=2.93437;};
				class Object87 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={9.44141,-32.7188,-0.00143886};dir=184.934;};
				class Object88 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={23.4375,-25.2227,-0.00143886};dir=273.934;};
				class Object89 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={17.2031,-28.2598,-0.00143886};dir=2.93437;};
				class Object90 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={21.5156,-29.5898,-0.00137782};dir=88.4237;};
				class Object91 {side=8;vehicle="Land_HBarrier_Big_F";rank="";position[]={17.0625,-33.5234,-0.00143886};dir=184.934;};
				class Object92 {side=8;vehicle="Land_BarrelSand_grey_F";rank="";position[]={21.1445,-32.4707,-0.00137353};dir=88.4804;};
			};
		};
	
		class AresRoadblocks
		{
			name = "Urban Roadblocks";
			
			class AresRoadblockJunkVerySmall
			{
				name = "Sm. Junk Pile";
				class Object1 {side=8;vehicle="Land_IronPipes_F";rank="";position[]={0.361084,1.26563,-0.00143862};dir=0;};
				class Object2 {side=8;vehicle="Land_Cages_F";rank="";position[]={-3.0564,1.57959,0.0143638};dir=267.511;};
				class Object3 {side=8;vehicle="Land_Tyres_F";rank="";position[]={-3.33789,1.59619,0.0051589};dir=0;};
				class Object4 {side=8;vehicle="Land_Sacks_heap_F";rank="";position[]={3.82861,1.61719,-0.00143862};dir=0;};
				class Object5 {side=8;vehicle="Land_Pallets_stack_F";rank="";position[]={3.81396,1.73438,-0.00143862};dir=92.0786;};
				class Object6 {side=8;vehicle="Land_CratesPlastic_F";rank="";position[]={5.03931,1.44678,-0.00143862};dir=0;};
				class Object7 {side=8;vehicle="Land_Bricks_V4_F";rank="";position[]={5.15869,1.55225,-0.00143862};dir=0.00103247;};
			};
			
			class RoadblockMilSmall
			{
				name = "Sm. Re-enforced Fence";
				class Object1 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={0.243652,1.05127,-0.00243855};dir=179.528;};
				class Object2 {side=8;vehicle="Land_Mil_WiredFence_F";rank="";position[]={0.253906,1.63867,-0.00144815};dir=179.97;};
				class Object3 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-2.24487,0.74707,-0.00243855};dir=0;};
				class Object4 {side=8;vehicle="Land_CncBarrier_F";rank="";position[]={-2.31445,0.737305,0.780849};dir=0;};
				class Object5 {side=8;vehicle="Land_CncBarrier_F";rank="";position[]={2.65015,0.799805,0.782759};dir=0;};
				class Object6 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={2.76172,0.794434,-0.00243855};dir=0;};
			};
			
			class AresRoadblockCivilianWrecks
			{
				name = "Sm. Civ Vehicles";
				class Object1 {side=8;vehicle="Land_Sacks_heap_F";rank="";position[]={0.873047,1.98242,-0.00143886};dir=0;};
				class Object2 {side=8;vehicle="Land_Wreck_Car_F";rank="";position[]={-0.101563,1.93945,-0.00143886};dir=90.2452;};
				class Object3 {side=8;vehicle="Land_Sacks_heap_F";rank="";position[]={0.923828,2.14453,1.44768};dir=0;};
				class Object4 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={3.40039,0.875,-0.00243902};dir=182.848;};
				class Object5 {side=8;vehicle="Land_BagFence_Short_F";rank="";position[]={-2.53711,2.99414,-0.00243902};dir=195.925;};
				class Object6 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={1.31445,3.44922,1.00124};dir=195.217;};
				class Object7 {side=8;vehicle="Land_Wreck_Truck_dropside_F";rank="";position[]={-1.7207,3.96484,-0.00143886};dir=286.44;};
				class Object8 {side=8;vehicle="Land_BagFence_Short_F";rank="";position[]={-4.16992,3.45898,-0.00243902};dir=195.925;};
				class Object9 {side=8;vehicle="Land_Wreck_Ural_F";rank="";position[]={5.48633,1.66406,7.12872e-005};dir=273.27;};
				class Object10 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={6.49609,2.85938,-0.00144124};dir=195.217;};
				class Object11 {side=8;vehicle="Land_BagFence_Short_F";rank="";position[]={-5.3457,2.77539,-0.00243902};dir=138.052;};
				class Object12 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={6.18359,0.472656,-0.00243902};dir=182.848;};
			};
			
			class AresRoadblockCivilianWrecks2
			{
				name = "Sm. Civ Vehicles 2";
				class Object1 {side=8;vehicle="Land_Wreck_Truck_dropside_F";rank="";position[]={-0.291016,3.2417,-0.00143862};dir=201.1;};
				class Object2 {side=8;vehicle="Land_Wreck_Car2_F";rank="";position[]={2.88428,0.916016,0.601496};dir=107.267;};
				class Object3 {side=8;vehicle="Land_JunkPile_F";rank="";position[]={-3.45459,2.1582,-0.24174};dir=0;};
				class Object4 {side=8;vehicle="Land_Tyres_F";rank="";position[]={-3.74097,2.26416,0.0051589};dir=0;};
				class Object5 {side=8;vehicle="Land_BagFence_Short_F";rank="";position[]={-3.69189,2.42041,0.0281777};dir=0;};
				class Object6 {side=8;vehicle="Land_Wreck_HMMWV_F";rank="";position[]={-3.8313,2.53662,-0.761311};dir=270.966;};
				class Object7 {side=8;vehicle="Land_Timbers_F";rank="";position[]={5.72705,0.469727,0.0217681};dir=89.2823;};
				class Object8 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={-6.46411,3.479,-0.681004};dir=352.751;};
				class Object9 {side=8;vehicle="Land_Mound01_8m_F";rank="";position[]={5.48584,2.70898,-0.00144339};dir=0;};
				class Object10 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={3.72852,3.24658,0.146024};dir=0;};
				class Object11 {side=8;vehicle="Land_Wreck_Truck_F";rank="";position[]={6.74683,0.542969,-0.0655932};dir=87.9434;};
				class Object12 {side=8;vehicle="Land_Wreck_Skodovka_F";rank="";position[]={-7.62842,2.40186,0.00144911};dir=270.057;};
				class Object13 {side=8;vehicle="Land_Bricks_V2_F";rank="";position[]={10.3438,1.6499,-0.00143862};dir=358.114;};
			};
			
			class AresRoadblockArmyWrecks
			{
				name = "Sm. Army Vehicles";
				class Object1 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-1.69141,1.44922,-0.00243902};dir=200.036;};
				class Object2 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={2.95117,0.0664063,-0.00243902};dir=189.779;};
				class Object3 {side=8;vehicle="Land_Wreck_Hunter_F";rank="";position[]={-0.744141,2.89453,-0.00143886};dir=117.829;};
				class Object4 {side=8;vehicle="Land_Wreck_Slammer_turret_F";rank="";position[]={5.14844,1.96875,-0.00143886};dir=142.09;};
				class Object5 {side=8;vehicle="Land_Slums02_4m";rank="";position[]={4.74609,1.36914,0.794677};dir=197.453;};
				class Object6 {side=8;vehicle="Land_CncBarrier_F";rank="";position[]={2.26953,3.87695,-0.00143886};dir=19.03;};
				class Object7 {side=8;vehicle="Land_CncBarrier_F";rank="";position[]={-0.191406,5.01367,-0.00143886};dir=27.5651;};
				class Object8 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={4.19336,4.23242,-0.00144124};dir=17.9729;};
				class Object9 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={-5.67578,6.37109,-0.00144124};dir=8.03473;};
				class Object10 {side=8;vehicle="Land_Wreck_Slammer_hull_F";rank="";position[]={-7.42383,3.26367,-0.00143886};dir=257.511;};
				class Object11 {side=8;vehicle="Land_Wreck_Truck_F";rank="";position[]={7.64453,0.353516,-0.00143886};dir=105.085;};
			};
			
			class AresRoadblockLargeWrecks
			{
				name = "Lg. Mixed Vehicles";
				class Object1 {side=8;vehicle="Dirthump_2_F";rank="";position[]={-0.207031,4.63379,-0.00143862};dir=0;};
				class Object2 {side=8;vehicle="Land_Wreck_Offroad_F";rank="";position[]={-6.64722,4.77832,-0.756494};dir=80.4907;};
				class Object3 {side=8;vehicle="Land_Sacks_heap_F";rank="";position[]={-7.78662,4.3374,0.00906038};dir=0;};
				class Object4 {side=8;vehicle="Land_Wreck_UAZ_F";rank="";position[]={7.3877,4.87988,0.517596};dir=261.738;};
				class Object5 {side=8;vehicle="Land_Sacks_heap_F";rank="";position[]={8.04639,5.12354,-0.35144};dir=0;};
				class Object6 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={-8.5354,7.00977,-0.490126};dir=340.864;};
				class Object7 {side=8;vehicle="Land_BagFence_Short_F";rank="";position[]={10.4751,4.28857,0.365863};dir=0;};
				class Object8 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={6.74731,8.05225,0.286464};dir=14.2485;};
				class Object9 {side=8;vehicle="Land_Wreck_Car2_F";rank="";position[]={-10.7385,3.98877,-0.71892};dir=266.449;};
				class Object10 {side=8;vehicle="Land_Wreck_CarDismantled_F";rank="";position[]={10.4683,4.96875,0.103909};dir=283.022;};
				class Object11 {side=8;vehicle="Land_Wreck_Car3_F";rank="";position[]={-14.3706,3.57861,1.69269};dir=36.686;};
				class Object12 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={14.4746,4.38867,-0.00243855};dir=0;};
				class Object13 {side=8;vehicle="Land_Wreck_Truck_dropside_F";rank="";position[]={13.9521,5.77148,-0.00143862};dir=104.871;};
				class Object14 {side=8;vehicle="Land_BagFence_End_F";rank="";position[]={16.8474,4.36377,-0.00243855};dir=0;};
				class Object15 {side=8;vehicle="Land_Mound01_8m_F";rank="";position[]={-17.5127,3.99658,-0.00144339};dir=0;};
				class Object16 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={-19.0044,5.79395,-0.001441};dir=354.017;};
				class Object17 {side=8;vehicle="Land_Razorwire_F";rank="";position[]={15.905,6.85986,-0.001441};dir=0;};
				class Object18 {side=8;vehicle="Land_Wreck_Ural_F";rank="";position[]={-19.0212,4.69775,1.13863};dir=80.8483;};
				class Object19 {side=8;vehicle="Land_Wreck_Car_F";rank="";position[]={19.562,5.39258,-0.00143862};dir=265.952;};
				class Object20 {side=8;vehicle="Land_BagFence_Round_F";rank="";position[]={22.4204,4.29053,-0.00273943};dir=203.478;};
				class Object21 {side=8;vehicle="Land_ScrapHeap_2_F";rank="";position[]={24.4016,4.91699,-0.00143862};dir=283.542;};
			};
		}
	
		class AresMisc
		{
			name = "Miscellaneous";
		
			class AresAmmoCache
			{
				name = "Sm. Open Ammo Dump";
				class Object1 {side=8;vehicle="Land_BagFence_Short_F";rank="";position[]={-0.976563,1.0957,-0.00143886};dir=0;};
				class Object2 {side=8;vehicle="Land_BagFence_Short_F";rank="";position[]={1.99219,1.17773,-0.00243902};dir=0;};
				class Object3 {side=8;vehicle="Land_Pallet_MilBoxes_F";rank="";position[]={-1.26758,2.33789,-0.00143886};dir=88.4461;};
				class Object4 {side=8;vehicle="Land_MetalBarrel_F";rank="";position[]={1.95117,2.89453,-0.00139475};dir=359.618;};
				class Object5 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={0.601563,1.48633,-0.00143886};dir=269.358;};
				class Object6 {side=8;vehicle="CamoNet_OPFOR_open_Curator_F";rank="";position[]={0.798828,3.53711,-0.0421278};dir=0;};
				class Object7 {side=8;vehicle="Land_MetalBarrel_F";rank="";position[]={1.95313,3.81445,-0.00139451};dir=0.604036;};
				class Object8 {side=8;vehicle="Land_MetalBarrel_F";rank="";position[]={2.65625,4.39453,-0.00139475};dir=357.823;};
				class Object9 {side=8;vehicle="Land_MetalBarrel_F";rank="";position[]={1.97656,4.79297,-0.00139475};dir=359.994;};
				class Object10 {side=8;vehicle="Land_Pallet_MilBoxes_F";rank="";position[]={-1.24219,5.42188,-0.00143886};dir=0;};
				class Object11 {side=8;vehicle="Land_BagFence_Short_F";rank="";position[]={-5.53516,1.11914,-0.00243902};dir=0;};
				class Object12 {side=8;vehicle="Land_PaperBox_open_empty_F";rank="";position[]={-5.41016,2.23242,-0.00143886};dir=0;};
				class Object13 {side=8;vehicle="Land_MetalBarrel_F";rank="";position[]={2.58398,5.40039,-0.00139475};dir=359.222;};
				class Object14 {side=8;vehicle="Land_MetalBarrel_F";rank="";position[]={1.95313,5.94141,-0.00139475};dir=359.501;};
				class Object15 {side=8;vehicle="Land_BagFence_Short_F";rank="";position[]={6.37695,1.14453,-0.00243902};dir=0;};
				class Object16 {side=8;vehicle="Land_PaperBox_closed_F";rank="";position[]={-5.45703,3.80273,-0.00143886};dir=0;};
				class Object17 {side=8;vehicle="Land_WaterBarrel_F";rank="";position[]={6.625,2.15039,-0.00141311};dir=3.49215;};
				class Object18 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-1.88281,7.30859,-0.00143886};dir=0;};
				class Object19 {side=8;vehicle="Land_WaterTank_F";rank="";position[]={6.09375,4.63477,-0.0014441};dir=268.037;};
				class Object20 {side=8;vehicle="Land_CargoBox_V1_F";rank="";position[]={-5.4707,5.40234,0.0291049};dir=359.274;};
				class Object21 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-7.11914,1.46875,-0.00143886};dir=269.358;};
				class Object22 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={8.00391,1.55469,-0.00143886};dir=269.358;};
				class Object23 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-7.40625,7.26953,-0.00143886};dir=0;};
				class Object24 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={3.56836,7.30859,-0.00143886};dir=0;};
			};
			
			class AresAmmoCache2
			{
				name = "Sm. Camo Ammo Dump";
				class Object1 {side=8;vehicle="CamoNet_OPFOR_Curator_F";rank="";position[]={-0.665039,-1.42432,-0.00144148};dir=179.956;};
				class Object2 {side=8;vehicle="Land_HBarrier_3_F";rank="";position[]={0.390381,-2.39258,-0.00144148};dir=176.049;};
				class Object3 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={2.33179,-3.00049,-0.00244141};dir=0;};
				class Object4 {side=8;vehicle="Land_MetalBarrel_empty_F";rank="";position[]={3.53955,-2.36377,-0.00144148};dir=0;};
				class Object5 {side=8;vehicle="Land_WoodenTable_small_F";rank="";position[]={1.82153,3.98779,-0.000361919};dir=198.63;};
				class Object6 {side=8;vehicle="Land_PaperBox_open_empty_F";rank="";position[]={-2.93433,3.36914,-0.00144148};dir=59.845;};
				class Object7 {side=8;vehicle="Land_ClutterCutter_large_F";rank="";position[]={-1.09009,4.62158,-0.00144148};dir=0;};
				class Object8 {side=8;vehicle="Land_BagFence_Long_F";rank="";position[]={-3.8396,-2.96191,-0.00244141};dir=0;};
				class Object9 {side=8;vehicle="Land_HBarrier_1_F";rank="";position[]={4.46143,-2.46387,-0.00144148};dir=0;};
				class Object10 {side=8;vehicle="Land_BarrelTrash_F";rank="";position[]={-4.89624,-2.42578,-0.00138092};dir=0.00581255;};
				class Object11 {side=8;vehicle="Land_ChairWood_F";rank="";position[]={2.14795,5.0249,-0.00142241};dir=28.8192;};
				class Object12 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={2.81226,2.57617,-0.00144148};dir=288.738;};
				class Object13 {side=8;vehicle="Land_HBarrier_1_F";rank="";position[]={-5.89502,-2.48779,-0.00144148};dir=0;};
				class Object14 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-6.28076,5.87939,-0.00144148};dir=61.5163;};
				class Object15 {side=8;vehicle="Land_WaterBarrel_F";rank="";position[]={2.6084,6.84033,-0.00143433};dir=359.95;};
				class Object16 {side=8;vehicle="Land_MetalBarrel_F";rank="";position[]={1.87524,7.44531,-0.00141001};dir=0.541605;};
				class Object17 {side=8;vehicle="CamoNet_OPFOR_big_Curator_F";rank="";position[]={-1.30737,7.33643,-0.00144148};dir=0;};
				class Object18 {side=8;vehicle="Land_MetalBarrel_F";rank="";position[]={2.62646,8.04736,-0.00139809};dir=1.21988;};
				class Object19 {side=8;vehicle="Land_Sack_F";rank="";position[]={-4.62549,7.17139,-0.00144148};dir=0;};
				class Object20 {side=8;vehicle="Land_Pallet_MilBoxes_F";rank="";position[]={-3.8269,8.00098,-0.00144148};dir=110.717;};
				class Object21 {side=8;vehicle="Land_PowerGenerator_F";rank="";position[]={0.781738,9.70801,-0.00144148};dir=141.364;};
				class Object22 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={4.0874,8.10303,-0.00144148};dir=231.307;};
				class Object23 {side=8;vehicle="Land_PaperBox_closed_F";rank="";position[]={-3.2251,9.72266,-0.00144148};dir=205.704;};
				class Object24 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-4.82886,11.2163,-0.00144148};dir=107.007;};
				class Object25 {side=8;vehicle="Land_HBarrier_5_F";rank="";position[]={-4.20605,11.9351,-0.00144148};dir=0;};
			};
		}
	};
};
