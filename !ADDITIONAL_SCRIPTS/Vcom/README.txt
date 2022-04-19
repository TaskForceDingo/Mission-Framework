To enable VCOM in the TFD Framework:

1. Copy 'Vcom' folder into mission folder
2. In 'description.ext' under the CfgFunctions class, remove the '//' before the VCOM #include line:
	
	//#include "vcom\cfgFunctions.hpp"
	
	becomes
	
	#include "vcom\cfgFunctions.hpp"

3. In 'description.ext' in the VCOM section, remove the '//' before the VCM_CBASettings line:

	class Extended_PreInit_EventHandlers
	{
		//VCM_CBASettings = call compile preprocessFileLineNumbers "Vcom\Functions\VCM_Functions\fn_CBASettings.sqf";
	};

	becomes

	class Extended_PreInit_EventHandlers
	{
		VCM_CBASettings = call compile preprocessFileLineNumbers "Vcom\Functions\VCM_Functions\fn_CBASettings.sqf";
	};

4. In `init.sqf` under the 'AI Frameworks' section set 'USE_VCOM' to true.

5. VCOM settings can be adjusted in the 'cba_settings.sqf' file, at the bottom.

-----------------------------------------------------------------------------------------------------------------------

Adding the following lines to a unit's init will adjust that squad's VCOM behaviour

Stop the AI squad from executing advanced movement maneuvers:
	(group this) setVariable ["VCM_NOFLANK",true];

Stop the AI squad from responding to calls for backup:
	(group this) setVariable ["VCM_NORESCUE",true];

Stop the AI squad from calling for backup:
	(group this) setVariable ["VCM_TOUGHSQUAD",true];

Disable VCOM for a specific group:
	(group this) setVariable ["Vcm_Disable",true];

Stop the AI squad from changing formations:
	(group this) setVariable ["VCM_DisableForm",true];

Prevent the AI squad's skills from being adjusted by VCOM:	
	(group this) setVariable ["VCM_Skilldisable",true];