class TFD
{
	class core
	{
		file = "functions\core";
		class missionStartHint {};
		class setRadio {postInit = 1;};
		class WerthlesHeadless {};
		class assignGroup {};
		class unitRoster {};
		class assignChannels {};
	};
	class misc
	{
		file = "functions\misc";
		class casualtiesCapCheck {};
		class dynamicMarkers {};
		class grenadeStop {};
		class tm4_fuelUptake {};
		class boobyTrap {};
		class FireSupport {};
		class ServiceJet {};
		class Stalk {};
		class customDifficulty {};
		class setPatch {};
		class forceUniform {};
	};
	class garrison
	{
		file = "functions\misc\garrison";
		class garrison {};
		class gar_customLoadout {};
		class gar_cacheGroup {};
	};
	class civpunish
	{
		file = "functions\misc\civpunish";
		class civPunish {};
	};
	class diwako
	{
		file = "functions\misc\punishweapon";
		class setupDPWlist {};
	};
};
#include "misc\zade_boc\functions.hpp"
#include "misc\punishweapon\functions.hpp"