class TFD
{
	class core
	{
		file = "functions\core";
		class missionStartHint {};
		class WerthlesHeadless {};
		class assignGroup {};
		class unitRoster {};
	};
	class radio
	{
		file = "functions\core\radio";
		class setRadio {postInit = 1;};
		class assignChannels {};
		class giveRadios {};
		class clearRadios {};
	};
	class misc
	{
		file = "functions\misc";
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
	class dac
	{
		file = "functions\misc\dac";
		class initDAC {};
	};
};
#include "misc\zade_boc\functions.hpp"