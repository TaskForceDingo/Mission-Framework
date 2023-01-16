/*
	This file can be used to add custom unit patches which will appear on the left shoulder
	of compatible uniforms.

	Patch files should be 128px x 128px in size and converted to .paa format using TexView 2
	in Arma 3 Tools. Place the .paa files in the 'media\patches' folder.

	To define a new custom patch, copy and paste the following and paste it below the
	'Add custom patches below here:' line:
		
		NEWPATCH(PatchName,fileName.paa)

	For the framework to autoassign patches to units, the PatchName should be the same as the
	group's name in the TFD_ORBAT array.
*/

#include "macros.hpp" // Contains template config, don't touch this

// Default patches in the framework
/*
	If you aren't using the default patches and want to save a few KB, delete the .paa files
	in 'media\patches' then remove these lines from this file.
*/

NEWPATCH(Command,command.paa)
NEWPATCH(Alpha,a.paa)
NEWPATCH(Bravo,b.paa)
NEWPATCH(Charlie,c.paa)
NEWPATCH(Delta,d.paa)
NEWPATCH(Echo,e.paa)
NEWPATCH(Medic,medic.paa)

// Add custom patches below here:

//NEWPATCH(PatchName,fileName.paa)