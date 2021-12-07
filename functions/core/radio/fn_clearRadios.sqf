/*
	Author: TheTimidShade

	Description:
		Removes all 343s from the player's loadout (used to get rid of 343s that randomly appear in loadouts)

	Parameters:
		NONE
		
	Returns:
		NONE
*/

sleep 1;
_radios = ["ACRE_PRC343"] call acre_api_fnc_getAllRadiosByType;
{player removeItem _x} forEach _radios;
{player removeItemFromVest _x} forEach _radios;
{player removeItemFromBackpack _x} forEach _radios;
TFD_RADIO_CLEAR_COMPLETED = true;