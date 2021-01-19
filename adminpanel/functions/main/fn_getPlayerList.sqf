/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Updates admin panels player list.

	Parameters:
		NONE
		
	Returns:
		ARRAY - List of player alive player units
*/

private _playerArray = [];

{
	if (isPlayer _x && alive _x) then {
		_playerArray pushBackUnique _x;
	};
} forEach playableUnits;

_playerArray