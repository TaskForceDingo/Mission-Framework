class zade_boc
{
	tag = "zade_boc";
	class init
	{
		file = "functions\core\zade_boc";
		class initBOC {postInit = 1;};
	};
	class commands
	{
		file = "functions\core\zade_boc\functions\commands";
		class addChestpack {};
		class addItemToChestpack {};
		class addMagToChestpack {};
		class canAddItemToChestpack {};
		class Chestpack {};
		class ChestpackContainer {};
		class ChestpackItems {};
		class ChestpackMagazines {};
		class clearAllItemsFromChestpack {};
		class loadChestpack {};
		class removeChestpack {};
		class removeItemFromChestpack {};
		class removeMagFromChestpack {};
	};
	class utility
	{
		file = "functions\core\zade_boc\functions\utility";
		class actionOnBack {};
		class actionOnChest {};
		class actionSwap {};
		class backpackMagazines {};
		class copyRadioSettings {};
		class EHAnimDone {};
		class EHGetIn {};
		class EHGetOut {};
		class EHHandleDisconnect {};
		class EHKilled {};
		class moduleAdd {};
		class moduleOnChest {};
		class moduleDisable {};
		class pasteRadioSettings {};
	};
	class arsenal
	{
		file = "functions\core\zade_boc\functions\arsenal";
		class arsenalOpened {};
		class arsenal_onButtonClick {};
		class arsenal_updateUI {};
		class arsenal_postInit {};
	};
};