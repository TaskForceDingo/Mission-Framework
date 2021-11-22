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
		class giveRadios {};
		class clearRadios {};
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
		class serviceAircraft {};
		class Stalk {};
		class customDifficulty {};
		class setPatch {};
		class forceUniform {};
		class unitVariation {};
	};
	class utility
	{
		file = "functions\utility";
		class generateOrbat {};
		class getEquipmentClasses {};
		class formatList {};
	}
	class garrison
	{
		file = "functions\misc\garrison";
		class garrison {};
		class gar_customLoadout {};
		class gar_cacheGroup {};
	};
	class civilian
	{
		file = "functions\misc\civilian";
		class civPunish {};
		class customCiv {};
	};
};
#include "misc\zade_boc\functions.hpp"