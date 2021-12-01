/*
	Author: TheTimidShade

	Description:
		Returns true if the player is an admin (Steam64 ID is in admp_authorisedIDs)

	Parameters:
		0: OBJECT - Player to check for admin permissions
		
	Returns:
		BOOL - True if player is an admin, false if not
*/

params [
	["_player", objNull, [objNull]]
];

if (isNull player) then {false}
else
{
	if ((getPlayerUID player) in admp_authorisedIDs) then {true}
	else {false};
};