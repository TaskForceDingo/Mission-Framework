/*
	Author: JohnnyShootos (Edited by TheTimidShade)

	Description:
		Run on server to update editable objects for the passed player

	Parameters:
		0: OBJECT - Player to update editable objects for
		1: OBJECT - Curator logic assigned to given player
		
	Returns:
		NONE
*/

params ["_player", "_curatorLogic"];

while {alive _player && !isNull _curatorLogic} do {
	private _entities = entities [[], ["Logic"], true];
	_curatorLogic addCuratorEditableObjects [_entities, true];
	sleep 10;
};