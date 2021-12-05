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

if (isMultiplayer) then {
	{
		if (isPlayer _x && alive _x) then {
			_playerArray pushBackUnique _x;
		};
	} forEach playableUnits;
}
else {
	{
		if (alive _x) then {
			_playerArray pushBackUnique _x;
		};
	} forEach switchableUnits - entities "HeadlessClient_F";
};

_playerArray