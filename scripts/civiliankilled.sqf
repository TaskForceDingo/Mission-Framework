_killed = _this select 0;
_killer = _this select 1;

		if (_killer == vehicle _killer && isPlayer _killer &&  _killed iskindof "man" && side group _killed == civilian) then
{

	player globalChat format ["A civilian was killed by %1!", name _killer];
	TFD_civ_deaths = TFD_civ_deaths + 1;
	hint str TFD_civ_deaths; //comment this out after test
};
