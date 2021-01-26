#include "defines.hpp"
#include "elements.hpp"

class TFD_AdminPanel
{
	idd = 6969;
	movingEnable = false;
	enableSimulation = 1;

	onLoad = "uiNamespace setVariable ['admp_displayVar', _this#0]; [] spawn admp_fnc_displayOpened;";
	onUnload = "[] call admp_fnc_displayClosed;";
	
	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by TheTimidShade, v1.063, #Qicika)
		////////////////////////////////////////////////////////

		class BACKGROUND: RscADMPText
		{
			idc = IDC_ADMINPANEL_BACKGROUND;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.567187 * safezoneW;
			h = 0.66 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class MAIN_TITLE: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_MAIN_TITLE;
			text = "<t font='PuristaBold', align='center'>TFD ADMIN PANEL</t>"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = COL_TFDORANGE_SEMITRANSP;
		};
		class MAP: RscADMPMapControl
		{
			idc = IDC_ADMINPANEL_MAP;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.506 * safezoneH;
			onMouseButtonDown = "params ['_control', '_button', '_xPos', '_yPos', '_shift', '_ctrl', '_alt']; [[_xPos, _yPos], _shift, _ctrl, _alt, _button] call admp_fnc_handleMapClick;";
		};
		class MAP_DESCRIPTION: RscADMPText
		{
			idc = IDC_ADMINPANEL_MAP_DESCRIPTION;
			text = "Hover to reveal TP key combos"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			sizeEx = 0.8 * GUI_GRID_H;
			tooltip = "SHIFT+LMB: TP unit to click pos\nCTRL+SHIFT+LMB: TP units group to click pos\nALT+LMB: TP you to selected unit/closest unit to click pos\nALT+SHIFT+LMB: TP unit to you";
		};
		class PLAYER_INFO_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_INFO_BACK;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class PLAYER_INFO_TITLE: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_PLAYER_INFO_TITLE;
			text = "<t font='PuristaBold', align='center'>PLAYER INFO</t>"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class PLAYER_INFO_NAME: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_INFO_NAME;
			text = "Name: Playername"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_INFO_GRID: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_INFO_GRID;
			text = "Grid: 000000"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_INFO_VEHICLE_INFO: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_INFO_VEHICLE_INFO;
			text = "In Vehicle: state"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.551296 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_INFO_SIDE: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_INFO_SIDE;
			text = "Side: side"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_INFO_FPS: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_PLAYER_INFO_FPS;
			text = "FPS: 60"; //--- ToDo: Localize;
			x = 0.602604 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_MEDICAL_TITLE: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_PLAYER_MEDICAL_TITLE;
			text = "<t font='PuristaBold', align='center'>MEDICAL</t>"; //--- ToDo: Localize;
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class PLAYER_MEDICAL_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_MEDICAL_BACK;
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class PLAYER_MEDICAL_HEART: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_MEDICAL_HEART;
			text = "Heart Rate: 0"; //--- ToDo: Localize;
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_MEDICAL_BLDPRES: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_MEDICAL_BLDPRES;
			text = "Blood Pressure: 99/99"; //--- ToDo: Localize;
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_MEDICAL_BLDVOL: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_MEDICAL_BLDVOL;
			text = "Blood Volume: 6L"; //--- ToDo: Localize;
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_MEDICAL_PAIN: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_MEDICAL_PAIN;
			text = "Pain Level: 1"; //--- ToDo: Localize;
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_MEDICAL_WAKEUP: RscADMPButton
		{
			idc = IDC_ADMINPANEL_PLAYER_MEDICAL_WAKEUP;
			text = "WAKE UP"; //--- ToDo: Localize;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Wake up selected player (if stable)"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] spawn admp_fnc_wakeUp;";
		};
		class PLAYER_MEDICAL_FULLHEAL: RscADMPButton
		{
			idc = IDC_ADMINPANEL_PLAYER_MEDICAL_FULLHEAL;
			text = "HEAL"; //--- ToDo: Localize;
			x = 0.742344 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Fully heal selected player"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_fullHeal;";
		};
		class PLAYER_MEDICAL_STATUS: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_PLAYER_MEDICAL_STATUS;
			text = "Status: Conscious"; //--- ToDo: Localize;
			x = 0.69026 * safezoneW + safezoneX;
			y = 0.613704 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_VEHICLE_TITLE: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_PLAYER_VEHICLE_TITLE;
			text = "<t font='PuristaBold', align='center'>VEHICLE</t>"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class PLAYER_VEHICLE_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_VEHICLE_BACK;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class PLAYER_VEHICLE_DISMOUNT: RscADMPButton
		{
			idc = IDC_ADMINPANEL_PLAYER_VEHICLE_DISMOUNT;
			text = "DISMOUNT"; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Forces the selected player to dismount their vehicle"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_forceDismount;"
		};
		class PLAYER_VEHICLE_UNSTUCK: RscADMPButton
		{
			idc = IDC_ADMINPANEL_PLAYER_VEHICLE_UNSTUCK;
			text = "UNSTUCK"; //--- ToDo: Localize;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Rights and teleports the selected players vehicle clear of obstruction\nIf you have selected yourself and are not in a vehicle, the vehicle under your crosshair will be used instead"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_vehicleUnstuck;"
		};
		class PLAYER_VEHICLE_REPAIR: RscADMPButton
		{
			idc = IDC_ADMINPANEL_PLAYER_VEHICLE_REPAIR;
			text = "\a3\ui_f\data\igui\cfg\simpletasks\types\repair_ca.paa"; //--- ToDo: Localize;
			style = ST_PICTURE;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.0384444 * safezoneH;
			tooltip = "Repairs the selected players vehicle"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;	

			onButtonClick = "[] call admp_fnc_repairVehicle;"
		};
		class PLAYER_VEHICLE_REFUEL: RscADMPButton
		{
			idc = IDC_ADMINPANEL_PLAYER_VEHICLE_REFUEL;
			text = "\a3\ui_f\data\igui\cfg\simpletasks\types\refuel_ca.paa"; //--- ToDo: Localize;
			style = ST_PICTURE;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.0384444 * safezoneH;
			tooltip = "Refuels the selected players vehicle"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_refuelVehicle;"
		};
		class PLAYER_VEHICLE_REARM: RscADMPButton
		{
			idc = IDC_ADMINPANEL_PLAYER_VEHICLE_REARM;
			text = "\a3\ui_f\data\igui\cfg\simpletasks\types\rearm_ca.paa"; //--- ToDo: Localize;
			style = ST_PICTURE;
			x = 0.659844 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.0384444 * safezoneH;
			tooltip = "Rearms the selected players vehicle"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_rearmVehicle;"
		};
		class PLAYER_VEHICLE_REPTEXT: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_VEHICLE_REPTEXT;
			text = "REP"; //--- ToDo: Localize;
			style = ST_CENTER;
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.749296 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class PLAYER_VEHICLE_REFTEXT: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_VEHICLE_REFTEXT;
			text = "REF"; //--- ToDo: Localize;
			style = ST_CENTER;
			x = 0.634583 * safezoneW + safezoneX;
			y = 0.749296 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class PLAYER_VEHICLE_REATEXT: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_VEHICLE_REATEXT;
			text = "REA"; //--- ToDo: Localize;
			style = ST_CENTER;
			x = 0.660417 * safezoneW + safezoneX;
			y = 0.749296 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class PLAYERLIST_LISTBOX: RscADMPListbox
		{
			idc = IDC_ADMINPANEL_PLAYERLIST_LISTBOX;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.22 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;

			onLBSelChanged = "[] call admp_fnc_LBSelectionChanged;";
			onLBDblClick = "[] call admp_fnc_centreMapOnPlayer;";
		};
		class PLAYERLIST_TITLE: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_PLAYERLIST_TITLE;
			text = "<t font='PuristaBold', align='center'>PLAYER LIST</t>"; //--- ToDo: Localize;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class UTILITIES_TITLE: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_UTILITIES_TITLE;
			text = "<t font='PuristaBold', align='center'>UTILITIES</t>"; //--- ToDo: Localize;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class UTILITIES_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_UTILITIES_BACK;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class UTILITIES_GODMODE_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_UTILITIES_GODMODE_BACK;
			text = "";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "";
			sizeEx = 1 * GUI_GRID_H;
		};
		class UTILITIES_GODMODE: RscADMPButton
		{
			idc = IDC_ADMINPANEL_UTILITIES_GODMODE;
			text = "GODMODE"; //--- ToDo: Localize;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Make selected player invulnerable"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_godmode;"
		};
		class UTILITIES_INFAMMO_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_UTILITIES_INFAMMO_BACK;
			text = "";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "";
			sizeEx = 1 * GUI_GRID_H;
		};
		class UTILITIES_INFAMMO: RscADMPButton
		{
			idc = IDC_ADMINPANEL_UTILITIES_INFAMMO;
			text = "INF AMMO"; //--- ToDo: Localize;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Gives selected player unlimited ammo"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] spawn admp_fnc_infiniteAmmo;"
		};
		class UTILITIES_GHOST_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_UTILITIES_GHOST_BACK;
			text = "";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "";
			sizeEx = 1 * GUI_GRID_H;
		};
		class UTILITIES_GHOST: RscADMPButton
		{
			idc = IDC_ADMINPANEL_UTILITIES_GHOST;
			text = "GHOST"; //--- ToDo: Localize;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Hides and disables collision on the selected player"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_ghost;"
		};
		class UTILITIES_ARSENAL: RscADMPButton
		{
			idc = IDC_ADMINPANEL_UTILITIES_ARSENAL;
			text = "ARSENAL"; //--- ToDo: Localize;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "LMB: Opens BI arsenal on selected player\nSHIFT+LMB: Opens ACE arsenal on selected player"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onMouseButtonClick = "_shift = _this#4; [_shift] call admp_fnc_arsenal;";
		};
		class PLAYER_GROUP_TITLE: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_PLAYER_GROUP_TITLE;
			text = "<t font='PuristaBold', align='center'>GROUP</t>"; //--- ToDo: Localize;
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class PLAYER_GROUP_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_GROUP_BACK;
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class PLAYER_GROUP_GROUPNAME: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_GROUP_GROUPNAME;
			text = "Group: groupname"; //--- ToDo: Localize;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_GROUP_COMBO: RscADMPCombo
		{
			idc = IDC_ADMINPANEL_PLAYER_GROUP_COMBO;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_GROUP_ASSIGNBUTTON: RscADMPButton
		{
			idc = IDC_ADMINPANEL_PLAYER_GROUP_ASSIGNBUTTON;
			text = "ASSIGN"; //--- ToDo: Localize;
			x = 0.695937 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Assigns the unit to the selected group"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_assignGroup;";
		};
		class ADMIN_TITLE: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_ADMIN_TITLE;
			text = "<t font='PuristaBold', align='center'>ADMIN</t>"; //--- ToDo: Localize;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class ADMIN_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_ADMIN_BACK;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class ADMIN_KICK: RscADMPButton
		{
			idc = IDC_ADMINPANEL_ADMIN_KICK;
			text = "KICK"; //--- ToDo: Localize;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Kicks the selected player from the server"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_kick; serverCommandExecutable '#kick 4';";
		};
		class ADMIN_BAN_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_ADMIN_BAN_BACK;
			text = ""; //--- ToDo: Localize;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = ""; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;
			colorBackground[] = {0.5,0,0,0.5};
		};
		class ADMIN_BAN: RscADMPButton
		{
			idc = IDC_ADMINPANEL_ADMIN_BAN;
			text = "BAN"; //--- ToDo: Localize;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Bans the selected player from the server"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] spawn admp_fnc_ban;"
		};
		class ADMIN_SPECTATE_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_ADMIN_SPECTATE_BACK;
			text = "";
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "";
			sizeEx = 1 * GUI_GRID_H;
		};
		class ADMIN_SPECTATE: RscADMPButton
		{
			idc = IDC_ADMINPANEL_ADMIN_SPECTATE;
			text = "SPECTATE"; //--- ToDo: Localize;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Toggles spectator menu"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] spawn admp_fnc_toggleSpectator;"
		};
		class ADMIN_SERVERFPS: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_ADMIN_SERVERFPS;
			text = "SFPS: 60"; //--- ToDo: Localize;
			x = 0.527328 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class ADMIN_ACTIVEAI: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_ADMIN_ACTIVEAI;
			text = "AI: 100"; //--- ToDo: Localize;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class ADMIN_SERVERLOCK: RscADMPButton
		{
			idc = IDC_ADMINPANEL_ADMIN_SERVERLOCK;
			text = "LOCK SERVER"; //--- ToDo: Localize;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Locks/unlocks the server"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_toggleServerLock;"
		};
		class REMOTEEXEC_EDITBOX: RscADMPEdit
		{
			idc = IDC_ADMINPANEL_REMOTEEXEC_EDITBOX;
			text = ""; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			autocomplete = "scripting";
			font = "EtelkaMonospacePro";
			sizeEx = 0.7 * GUI_GRID_H;
			style = ST_MULTI;

			onLoad = "_this#0 ctrlSetText admp_debug_latestCode;"
		};
		class REMOTEEXEC_EXECBUTTON_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_REMOTEEXEC_EXECBUTTON_BACK;
			text = "";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "";
			sizeEx = 1 * GUI_GRID_H;
			colorBackground[] = {0.25,0,0,0.5};
		};
		class REMOTEEXEC_EXECBUTTON: RscADMPButton
		{
			idc = IDC_ADMINPANEL_REMOTEEXEC_EXECBUTTON;
			text = "REMOTE EXEC"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Executes the provided code on the selected players client"; //--- ToDo: Localize;
			sizeEx = 0.8 * GUI_GRID_H;
			
			onButtonClick = "[0] call admp_fnc_executeOnMachine;"
		};
		class MISSION_TITLE: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_MISSION_TITLE;
			text = "<t font='PuristaBold', align='center'>MISSION</t>"; //--- ToDo: Localize;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class MISSION_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_MISSION_BACK;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class MISSION_ENDBUTTON: RscADMPButton
		{
			idc = IDC_ADMINPANEL_MISSION_ENDBUTTON;
			text = "END MISSION"; //--- ToDo: Localize;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Ends the mission using the provided ending"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] spawn admp_fnc_endMission;"
		};
		class ADMIN_ZEUS_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_ADMIN_ZEUS_BACK;
			text = "";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "";
			sizeEx = 1 * GUI_GRID_H;
		};
		class ADMIN_ZEUS: RscADMPButton
		{
			idc = IDC_ADMINPANEL_ADMIN_ZEUS;
			text = "ZEUS"; //--- ToDo: Localize;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Grants selected player access to Zeus"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;

			onButtonClick = "[] call admp_fnc_toggleZeus;"
		};
		class MISSION_ENDCOMBO: RscADMPCombo
		{
			idc = IDC_ADMINPANEL_MISSION_ENDCOMBO;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class MADEBY: RscADMPText
		{
			idc = IDC_ADMINPANEL_MADEBY;
			text = "By JohnnyShootos & TheTimidShade"; //--- ToDo: Localize;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class PLAYER_CAMDISPLAY_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_PLAYER_CAMDISPLAY_BACK;
			text = "";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
		};
		class PLAYER_CAMDISPLAY_TITLE: RscADMPStructuredText
		{
			idc = IDC_ADMINPANEL_PLAYER_CAMDISPLAY_TITLE;
			text = "<t font='PuristaBold', align='center'>PLAYER VIEW</t>"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class PLAYER_CAMDISPLAY: RscADMPPicture
		{
			idc = IDC_ADMINPANEL_PLAYER_CAMDISPLAY;
			text = "#(argb,512,512,1)r2t(admpcamrender,1)";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.198 * safezoneH;
			onLoad = "[] spawn {sleep 0.05; if (admp_camera_NVGmode) then {'admpcamrender' setPiPEffect [1];};};";
		};
		class PLAYER_CAMDISPLAY_VIEWMODE: RscADMPButton
		{
			idc = IDC_ADMINPANEL_PLAYER_CAMDISPLAY_VIEWMODE;
			text = "TOGGLE VIEW"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Toggles between 1PP & 3PP view modes"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;
			colorBackgroundDisabled[] = {0,0,0,0};

			onButtonClick = "if (admp_camera_firstPersonMode) then {admp_camera_firstPersonMode = false;} else {admp_camera_firstPersonMode = true;};"
		};
		class PLAYER_CAMDISPLAY_VISMODE: RscADMPButton
		{
			idc = IDC_ADMINPANEL_PLAYER_CAMDISPLAY_VISMODE;
			text = "TOGGLE NVG MODE"; //--- ToDo: Localize;
			x = 0.690781 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Toggles nightvision mode on the player camera"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;
			colorBackgroundDisabled[] = {0,0,0,0};

			onButtonClick = "if (admp_camera_NVGmode) then {admp_camera_NVGmode = false; 'admpcamrender' setPiPEffect [0];} else {admp_camera_NVGmode = true; 'admpcamrender' setPiPEffect [1];};"

		};
		class REMOTEEXEC_SERVEREXEC_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_REMOTEEXEC_SERVEREXEC_BACK;
			text = ""; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = ""; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;
			colorBackground[] = {0,0.25,0,0.5};
		};
		class REMOTEEXEC_SERVEREXEC: RscADMPButton
		{
			idc = IDC_ADMINPANEL_REMOTEEXEC_SERVEREXEC;
			text = "SERVER EXEC"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Executes the provided code on the server"; //--- ToDo: Localize;
			sizeEx = 0.8 * GUI_GRID_H;

			onButtonClick = "[1] call admp_fnc_executeOnMachine;"
		};
		class REMOTEEXEC_LOCALEXEC_BACK: RscADMPText
		{
			idc = IDC_ADMINPANEL_REMOTEEXEC_LOCALEXEC_BACK;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0.25,0.5};
		};
		class REMOTEEXEC_LOCALEXEC: RscADMPButton
		{
			idc = IDC_ADMINPANEL_REMOTEEXEC_LOCALEXEC;
			text = "LOCAL EXEC"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Executes the provided code on the local client"; //--- ToDo: Localize;
			sizeEx = 0.8 * GUI_GRID_H;

			onButtonClick = "[2] call admp_fnc_executeOnMachine;"
		};
		class REMOTEEXEC_LOCALEXEC_PREV: RscADMPButton
		{
			idc = IDC_ADMINPANEL_REMOTEEXEC_LOCALEXEC_PREV;
			text = "";
			style = ST_PICTURE;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0123958 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Cycles backwards through previously executed code"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;
			color[] = {1,1,1,0.5};
			colorActive[] = {1,1,1,1};
			
			onLoad = "_this#0 ctrlSetText getMissionPath 'adminpanel\ui\icons\arrow_left.paa';";
			onButtonClick = "if ((admp_debug_codeIndex-1) >= 0) then {admp_debug_codeIndex = admp_debug_codeIndex-1; [] call admp_fnc_loadPreviousCode;};";
		};
		class REMOTEEXEC_LOCALEXEC_NEXT: RscADMPButton
		{
			idc = IDC_ADMINPANEL_REMOTEEXEC_LOCALEXEC_NEXT;
			text = "";
			style = ST_PICTURE;
			x = 0.512375 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.0123958 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Cycles forwards through previously executed code"; //--- ToDo: Localize;
			sizeEx = 1 * GUI_GRID_H;
			color[] = {1,1,1,0.5};
			colorActive[] = {1,1,1,1};
			
			onLoad = "_this#0 ctrlSetText getMissionPath 'adminpanel\ui\icons\arrow_right.paa';";
			onButtonClick = "if ((admp_debug_codeIndex+1) < count admp_debug_previousCode) then {admp_debug_codeIndex = admp_debug_codeIndex+1; [] call admp_fnc_loadPreviousCode;};";

		};
		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};