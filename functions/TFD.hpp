class TFD
{
	class core
	{
		file = "functions\core";
		class missionStartHint {postInit = 1;};
		class WerthlesHeadless {postInit = 1;};
		class assignGroup {};
		class assignTeam {postInit = 1;};
		class setPatch {};
		class briefing {postInit = 1;};
		class intro {postInit = 1;};
		class debug {};
		class addPlayerEHs {postInit = 1;};
		class logToServer {};
		class autoORBAT {postInit = 1;};
		class grenadeStop {postInit = 1;};
		class tm4_fuelUptake {postInit = 1;};
	};
	class radio
	{
		file = "functions\core\radio";
		class setRadio {postInit = 1;};
		class assignChannels {};
		class giveRadios {};
		class clearRadios {};
		class handleRadioSetup {};
		class fitsInventory {};
		class forceAddItem {};
	};
	class misc
	{
		file = "functions\misc";
		class dynamicMarkers {};
		class serviceAircraft {};
	};
	class utility
	{
		file = "functions\utility";
		class generateOrbat {};
		class getEquipmentClasses {};
		class formatList {};
		class generateSupplies {};
	}
	class garrison
	{
		file = "functions\misc\garrison";
		class garrison {};
		class gar_customLoadout {};
		class gar_cacheGroup {};
	};
	class civpunish
	{
		file = "functions\core\civilian";
		class civPunish {postInit = 1;};
		
	};
	class civilian
	{
		file = "functions\misc\civilian";
		class customCiv {};
	};
	class equipment
	{
		file = "functions\core\equipment";
		class forceUniform {postInit = 1;};
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
	class suicide_bomber
	{
		file = "functions\misc\ai\suicide_bomber";
		class suicideBomber {};
		class detonateNearBomberTarget {};
		class searchForBomberTarget {};
		class moveToBomberTarget {};
	}
	class events
	{
		file = "functions\core\events";
		class killedEH {};
		class respawnedEH {postInit = 1;};
		class handleDamageEH {};
	};
	class zeus
	{
		file = "functions\misc\zeus"
		class registerZeusModules {postInit = 1;};
		class airdropPlayerModule {};
		class fireworkModule {};
		class generateSuppliesModule {};
	};
	class effects
	{
		file = "functions\misc\effects"
		class explosion {};
	};
};
#include "core\zade_boc\functions.hpp"