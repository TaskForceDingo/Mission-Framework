_UNIT_SETS = [

/*
	Keep in mind that the sets are zero-indexed, so the first
	set in the list will have ID '0', the second '1', etc.
	
	Classnames of units you wish to use can be obtained by right
	clicking on selected units in the editor and selecting
	'Log > Classnames'.
*/
	
//ISLAMIC STATE
[
	//SIDE
	east, // east - OPFOR, west - BLUFOR, guerilla - INDFOR
	
	//CLASSNAMES
	[
		"LOP_ISTS_OPF_Infantry_Engineer",
		"LOP_ISTS_OPF_Infantry_Rifleman_5",
		"LOP_ISTS_OPF_Infantry_Corpsman",
		"LOP_ISTS_OPF_Infantry_TL",
		"LOP_ISTS_OPF_Infantry_GL",
		"LOP_ISTS_OPF_Infantry_Rifleman_6",
		"LOP_ISTS_OPF_Infantry_Rifleman",
		"LOP_ISTS_OPF_Infantry_Rifleman_4",
		"LOP_ISTS_OPF_Infantry_Rifleman_2",
		"LOP_ISTS_OPF_Infantry_Rifleman_3",
		"LOP_ISTS_OPF_Infantry_Marksman",
		"LOP_ISTS_OPF_Infantry_AT",
		"LOP_ISTS_OPF_Infantry_AR",
		"LOP_ISTS_OPF_Infantry_AR_Asst",
		"LOP_ISTS_OPF_Infantry_SL" // <- remember to never add a comma to teh last element of an array
	]
] //Remove this double slash and '/*' below to use more sets. 

//SET NAME
/*
, // <- This comma needs to be there so dont delete it when un-commenting
[
	//SIDE
	east, // east - OPFOR, west - BLUFOR, guerilla - INDFOR
	
	//CLASSNAMES
	[
		"unit_class_1",
		"unit_class_2",
		"unit_class_3",
		"unit_class_4"
	]
]*/
	
];