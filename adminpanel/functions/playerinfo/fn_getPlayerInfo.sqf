/*
	Author: TheTimidShade

	Description:
		Gets selected player's player info stats

	Parameters:
		0: OBJECT - Unit to retrieve stats from
		
	Returns:
		ARRAY - ["name", "side", "grid", "fps", "vehicleStatus", "groupName"]
*/

params [
	["_unit", objNull, [objNull]]
];

if (isNull _unit) then {
	["N/A", "N/A", "N/A", "N/A", "N/A", "N/A"]
};

private _name = (name _unit);
private _side = (str side _unit);
private _grid = (mapGridPosition _unit);

private _fps = (_unit getVariable ["admp_clientFPS", 0]);
private _fpsColour = "";

if (_fps > 40) then {
	_fpsColour = "#47ed00"; // green
} else {
	if (_fps > 30) then {
		_fpsColour = "#ffd92e"; // yellow
	} else {
		if (_fps > 20) then {
			_fpsColour = "#ff972e"; // orange
		}
		else {
			_fpsColour = "#ff0000"; // red
		};
	};
};
private _fpsStr = format ["<t color='%1'>%2</t>", _fpsColour, _fps];


private _vehicle_stat = if (vehicle _unit == _unit) then {"No"} else {"Yes"};
private _group_name = groupId (group _unit);

private _playerInfo = [_name,_side, _grid, _fpsStr, _vehicle_stat, _group_name];

_playerInfo