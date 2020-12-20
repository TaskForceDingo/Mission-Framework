/* unitTypes.hpp
	Add unit classnames to this file to use in fn_garrison
	To get classnames from editor placed units, right click on one with a group of
	them selected and select 'Log > Log Classes as String to Clipboard'

	Use 0 indexing to reference group of classes in fn_garrison, i.e. first group has
	ID 0, second group has ID 1, etc.
*/
_unitClasses = [
	[
		east, // these unit are opfor, ID = 0
		[
			"O_Soldier_SL_F",
			"O_Soldier_F",
			"O_Soldier_LAT_F",
			"O_soldier_M_F",
			"O_Soldier_TL_F",
			"O_Soldier_AR_F",
			"O_Soldier_A_F",
			"O_medic_F"
		]
	],
	[
		independent, // these units are independent, ID = 1
		[
			"I_Soldier_SL_F",
			"I_soldier_F",
			"I_Soldier_LAT_F",
			"I_Soldier_M_F",
			"I_Soldier_TL_F",
			"I_Soldier_AR_F",
			"I_Soldier_A_F",
			"I_medic_F"
		]
	]
];