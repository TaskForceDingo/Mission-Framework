To enable VCOM in the TFD Framework:

1. In `init.sqf` under the 'AI Frameworks' section set 'USE_VCOM' to true.

2. VCOM settings can be adjusted in the 'vcom/Functions/VcomAI_DefaultSerrings.sqf

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