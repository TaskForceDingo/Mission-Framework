class TFD
{
	class core
	{
		file = "functions\core";
		class missionStartHint {postInit = 1;};
		class WerthlesHeadless {postInit = 1;};
		class assignGroup {};
		class assignTeam {postInit = 1;};
		class unitRoster {};
		class setPatch {};
		class briefing {postInit = 1;};
		class intro {postInit = 1;};
		class debug {postInit = 1;}
	};
	class radio
	{
		file = "functions\core\radio";
		class setRadio {postInit = 1;};
		class assignChannels {};
		class giveRadios {};
		class clearRadios {};
		class handleRadioSetup {};
	};
	class misc
	{
		file = "functions\misc";
		class dynamicMarkers {};
		class grenadeStop {postInit = 1;};
		class tm4_fuelUptake {postInit = 1;};
		class serviceAircraft {};
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
		class civPunish {postInit = 1;};
		class customCiv {};
	};
	class dac
	{
		file = "functions\misc\dac";
		class initDAC {postInit = 1;};
	};
	class equipment
	{
		file = "functions\misc\equipment";
		class forceUniform {};
		class unitVariation {};
		class boobyTrap {postInit = 1;};
		class weaponRestriction {postInit = 1;};
		class handleWeaponOverheating {};
		class addAllowedWeapons {};
	};
	class ai
	{
		file = "functions\misc\ai";
		class FireSupport {};
		class Stalk {};
		class customDifficulty {postInit = 1;};
	};
};
#include "misc\zade_boc\functions.hpp"