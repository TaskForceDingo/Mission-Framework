params [
	["_classnames", [], [[]]],
	["_NATO", false, [true]],
	["_EAST", false, [true]]
];

waitUntil {missionNamespace getVariable ["diwako_unknownwp_init",false]};

diwako_unknownwp_local_weapons = [];
{diwako_unknownwp_local_weapons pushBackUnique (toUpper _x)} forEach _classnames;

if (_NATO) then {
	#include "wep_NATO.hpp"
	{diwako_unknownwp_local_weapons pushBackUnique (toUpper _x)} forEach _wps;
};
if (_EAST) then {
	#include "wep_EAST.hpp"
	{diwako_unknownwp_local_weapons pushBackUnique (toUpper _x)} forEach _wps;
};