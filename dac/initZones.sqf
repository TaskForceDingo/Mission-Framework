sleep 1;

// This file must be used for all DAC configuration to be handed off to the headless client
// Side numbers are: 0 = East	1 = West 	2 = Independent 	3 = civilian
// fun = [ "Trigger Name" , [ Zone ID , Activation , Events Config ] , [ Infantry ] , [ Wheeled ] , [ Armoured ] , [ Helicopter ] , [ Side , Config Case , Behaviour , Camp Config , Waypoint Config ] ] spawn DAC_Zone;

// eg fun = ["z1",[0,0,0],[8,2,20,5],[8,2,20,5],[8,2,20,5],[8,2,5],[1,0,1,0,4]] spawn DAC_Zone;
fun = ["z1",[1,0,0],[2,2,10,5],[1,1,8,5],[],[1,2,50,0,100,100],[0,11,0,0]] spawn DAC_Zone;

/* Please don't edit below this line

Specific unit types can be edited in "dac\Configs\DAC_Config_Units.sqf"

Faction Case Numbers:
	BLUFOR:
		0 - NATO (Vanilla)
		1 - FIA (Vanilla)
		2 - US Army (Woodland)(RHS)
		3 - US Army (Desert)(RHS)
		4 - US Marines (Woodland)(RHS)
		5 - US Marines (Desert)(RHS)
		6 - Afghan Army (LOP)
		7 - Afghan Police (LOP)
		8 - CDF (LOP)
		9 - Iraqi Army (LOP)
		
	OPFOR:
		10 - CSAT (Vanilla)
		11 - FIA (Vanilla)
		12 - Russian (EMR)(RHS)
		13 - Russian (Flora)(RHS)
		14 - Russian (Mountain Les)(RHS)
		15 - ChDKZ (LOP)
		16 - SLA (LOP)
		17 - Novorussians (LOP)
		
	INDFOR:
		18 - AAF (Vanilla)
		19 - FIA (Vanilla)
		20 - PMC (LOP)
		21 - Insurgent (ChDKZ)(RHS)
		22 - African Militia (LOP)
		23 - Afghan Militia (LOP)
		24 - ISTS (LOP)
		25 - RACS (LOP)
		26 - Ultranationalists (LOP)
		
	CIVILIAN:
		27 - Greek (Vanilla)
		28 - African (Vanilla)

																					:) you can't hide yo smileys
*/
