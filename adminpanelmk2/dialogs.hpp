#include "defines.hpp"

//--- ADMINPANELMK2
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BG		6520
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_TITLEBAR		6521
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_SERVERFPS_COUNTER	6522
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_ACTIVEAI_COUNTER	6523
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_EDIT_0		6920
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX		7020
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_0		7120
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_1		7121
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_2		7122
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_3		7123
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_4		7124
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_5		7125
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_6		7126
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_7		7127
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_8		7128
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_9		7129
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_10		7130
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_11		7131
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_12		7132
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_13		7133
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX_FRAME	7320
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BACK_FRAME	7321
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_SERVERFPS_FRAME	7322
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_ACTIVEAI_FRAME	7323
#define IDC_ADMINPANELMK2_JSH_GUI_ADMIN_MAPBACK			2300





class TFD_AdminPanel
{
	idd = 6969;
	movingEnable = false;
	enableSimulation = 1;

	onLoad = "[] remoteExecCall ['JSH_ADMIN_GETPLAYERLIST',2]; [] spawn {sleep 0.1;[] call JSH_ADMIN_REFRESH}";
	
	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by JohnnyShootos, v1.063, #Pytopa)
		////////////////////////////////////////////////////////

		class JSH_GUI_ADMIN_TITLEBAR: RscText
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_TITLEBAR;
			text = "ADMIN PANEL - by JohnnyShootos"; //--- ToDo: Localize;
			x = (0.323716 - 0.073363) * safezoneW + safezoneX;
			y = 0.208478 * safezoneH + safezoneY;
			w = 0.180691 * safezoneW;
			h = 0.0188079 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0.5,0.75};
		};
		class JSH_GUI_ADMIN_BACK_FRAME: RscFrame
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BACK_FRAME;
			x = (0.323716 - 0.073363) * safezoneW + safezoneX;
			y = 0.227287 * safezoneH + safezoneY;
			w = 0.180691 * safezoneW;
			h = 0.573639 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
		};
		class JSH_GUI_ADMIN_BG: RscText
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BG;
			x = (0.323716 - 0.073363) * safezoneW + safezoneX;
			y = 0.227287 * safezoneH + safezoneY;
			w = 0.180691 * safezoneW;
			h = 0.573639 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class JSH_GUI_ADMIN_LISTBOX_FRAME: RscFrame
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX_FRAME;
			x = (0.39423  - 0.073363)* safezoneW + safezoneX;
			y = 0.246095 * safezoneH + safezoneY;
			w = 0.101363 * safezoneW;
			h = 0.319733 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
		};
		class JSH_GUI_ADMIN_LISTBOX: RscListbox
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_LISTBOX;
			x = (0.39423  - 0.073363)* safezoneW + safezoneX;
			y = 0.246095 * safezoneH + safezoneY;
			w = 0.101363 * safezoneW;
			h = 0.319733 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.75};
		};
		class JSH_GUI_ADMIN_EDIT_0: RscEdit
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_EDIT_0;
			x = (0.33253  - 0.073363)* safezoneW + safezoneX;
			y = 0.669271 * safezoneH + safezoneY;
			w = 0.163062 * safezoneW;
			h = 0.0940392 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			style = 16;
			autocomplete = "scripting";
			lineSpacing = 1;
			tooltip = "Type/Paste code to be remotely executed"; //--- ToDo: Localize;
		};
		class JSH_GUI_ADMIN_BUTTON_0: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_0;
			text = "GOD MODE"; //--- ToDo: Localize;
			x = (0.33253  - 0.073363)* safezoneW + safezoneX;
			y = 0.246094 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			action = "[] call JSH_ADMIN_GODMODE; [] call JSH_ADMIN_UPDATEBUTTONS";
		};
		class JSH_GUI_ADMIN_BUTTON_1: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_1;
			text = "TELEPORT"; //--- ToDo: Localize;
			x = (0.33253  - 0.073363)* safezoneW + safezoneX;
			y = 0.293114 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			onMouseButtonClick = "_this call JSH_ADMIN_TELEPORT; [] call JSH_ADMIN_UPDATEBUTTONS";
			onMouseEnter = "_this call JSH_ADMIN_TOOLTIP_TELEPORT";
			tooltip = "";
		};
		class JSH_GUI_ADMIN_BUTTON_2: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_2;
			text = "INF. AMMO"; //--- ToDo: Localize;
			x = (0.33253  - 0.073363)* safezoneW + safezoneX;
			y = 0.340133 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			action = "[] call JSH_ADMIN_INFINITEAMMO; [] call JSH_ADMIN_UPDATEBUTTONS";
		};
		class JSH_GUI_ADMIN_BUTTON_3: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_3;
			text = "GHOSTING"; //--- ToDo: Localize;
			x = (0.33253  - 0.073363)* safezoneW + safezoneX;
			y = 0.387153 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			action = "[] call JSH_ADMIN_GHOSTING; [] call JSH_ADMIN_UPDATEBUTTONS";
		};
		class JSH_GUI_ADMIN_BUTTON_4: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_4;
			text = "SPECTATOR"; //--- ToDo: Localize;
			x = (0.33253  - 0.073363)* safezoneW + safezoneX;
			y = 0.434173 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			action = "[] spawn JSH_ADMIN_SPECTATOR;";
		};
		class JSH_GUI_ADMIN_BUTTON_5: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_5;
			text = "ARSENAL"; //--- ToDo: Localize;
			x = (0.33253  - 0.073363)* safezoneW + safezoneX;
			y = 0.481192 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			onMouseButtonClick = "_this spawn JSH_ADMIN_ARSENAL";
			onMouseEnter = "_this call JSH_ADMIN_TOOLTIP_ARSENAL";

		};
		class JSH_GUI_ADMIN_BUTTON_6: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_6;
			text = "ZEUS"; //--- ToDo: Localize;
			x = (0.33253  - 0.073363)* safezoneW + safezoneX;
			y = 0.528212 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			action = "[] call JSH_ADMIN_ZEUS; [] call JSH_ADMIN_UPDATEBUTTONS";
		};
		class JSH_GUI_ADMIN_BUTTON_7: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_7;
			text = "END MISSION"; //--- ToDo: Localize;
			x = (0.33253  - 0.073363)* safezoneW + safezoneX;
			y = 0.575231 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			action = "[] call JSH_ADMIN_ENDMISSION;";
		};
		class JSH_GUI_ADMIN_BUTTON_8: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_8;
			text = "LOCK SERVER"; //--- ToDo: Localize;
			x = (0.33253  - 0.073363)* safezoneW + safezoneX;
			y = 0.622251 * safezoneH + safezoneY;
			w = 0.0572922 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			action = "[] call JSH_ADMIN_LOCK;";

		};
		class JSH_GUI_ADMIN_BUTTON_9: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_9;
			text = "DISABLE"; //--- ToDo: Localize;
			x = (0.39423  - 0.073363)* safezoneW + safezoneX;
			y = 0.575231 * safezoneH + safezoneY;
			w = 0.0308496 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			action = "[] call JSH_ADMIN_DISABLE;";
		};
		class JSH_GUI_ADMIN_BUTTON_10: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_10;
			text = "KICK"; //--- ToDo: Localize;
			x = (0.429487 - 0.073363) * safezoneW + safezoneX;
			y = 0.575231 * safezoneH + safezoneY;
			w = 0.0308496 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			action = "[] call JSH_ADMIN_KICK;";
		};
		class JSH_GUI_ADMIN_BUTTON_11: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_11;
			text = "BAN"; //--- ToDo: Localize;
			x = (0.464743 - 0.073363) * safezoneW + safezoneX;
			y = 0.575231 * safezoneH + safezoneY;
			w = 0.0308496 * safezoneW;
			h = 0.0376157 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			action = "[] call JSH_ADMIN_BAN;";
		};
		class JSH_GUI_ADMIN_BUTTON_12: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_12;
			text = "REMOTE EXECUTE"; //--- ToDo: Localize;
			x = (0.358973 - 0.073363) * safezoneW + safezoneX;
			y = 0.76331 * safezoneH + safezoneY;
			w = 0.114584 * safezoneW;
			h = 0.0188079 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			tooltip = "Execute code locally on the machine of the selected player"; //--- ToDo: Localize;
			action = "[] call JSH_ADMIN_REMOTEEXECUTE;";
			onMouseEnter = "_this call JSH_ADMIN_TOOLTIP_REMOTEEXEC";
		};
		class JSH_GUI_ADMIN_BUTTON_13: RscButton
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_BUTTON_13;
			text = "REFRESH"; //--- ToDo: Localize;
			x = (0.460336 - 0.073363) * safezoneW + safezoneX;
			y = 0.227286 * safezoneH + safezoneY;
			w = 0.0352567 * safezoneW;
			h = 0.0188079 * safezoneH;
			tooltip = "Refresh the player list."; //--- ToDo: Localize;
			action = "[] call JSH_ADMIN_REFRESH;";
			sizeEx = 1 * GUI_GRID_H;
		};
		class JSH_GUI_ADMIN_SERVERFPS_FRAME: RscFrame
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_SERVERFPS_FRAME;
			text = "SERVER FPS"; //--- ToDo: Localize;
			x = (0.403921 - 0.073363) * safezoneW + safezoneX;
			y = 0.622251 * safezoneH + safezoneY;
			w = 0.0352567 * safezoneW;
			h = 0.0376157 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class JSH_GUI_ADMIN_ACTIVEAI_FRAME: RscFrame
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_ACTIVEAI_FRAME;
			text = "ACTIVE AI"; //--- ToDo: Localize;
			x = (0.453282 - 0.073363) * safezoneW + safezoneX;
			y = 0.622251 * safezoneH + safezoneY;
			w = 0.0308496 * safezoneW;
			h = 0.0376157 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class JSH_GUI_ADMIN_SERVERFPS_COUNTER: RscText
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_SERVERFPS_COUNTER;
			text = "0000"; //--- ToDo: Localize;
			x = (0.410971 - 0.073363) * safezoneW + safezoneX;
			y = 0.635417 * safezoneH + safezoneY;
			w = 0.0220355 * safezoneW;
			h = 0.0188079 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			onLoad = "[] spawn JSH_ADMIN_SERVERFPS_COUNTER";
		};
		class JSH_GUI_ADMIN_ACTIVEAI_COUNTER: RscText
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_ACTIVEAI_COUNTER;
			text = "0000"; //--- ToDo: Localize;
			x = (0.457691 - 0.073363) * safezoneW + safezoneX;
			y = 0.635416 * safezoneH + safezoneY;
			w = 0.0220355 * safezoneW;
			h = 0.0188079 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
			onLoad = "[] spawn JSH_ADMIN_ACTIVEAI_COUNTER";
		};
		class JSH_GUI_ADMIN_MAPBACK: RscMapControl
		{
			idc = IDC_ADMINPANELMK2_JSH_GUI_ADMIN_MAPBACK;
			x = (0.504407 - 0.073363) * safezoneW + safezoneX;
			y = 0.227286 * safezoneH + safezoneY;
			w = 0.321718 * safezoneW;
			h = 0.573639 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};
