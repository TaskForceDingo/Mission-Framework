/*
	This file can be used to add custom sound files to your mission.

	To play custom sounds you can use:
		
		playSound "soundClassname"; // plays 2D sound
		objectVarName say3D ["soundClassname", _distance]; // plays 3D sound from object

	For more info see:
		https://community.bistudio.com/wiki/playSound
		https://community.bistudio.com/wiki/say3D

	Custom sound files should be exported in .ogg format and placed in the 'media\sounds' folder.

	To add custom sounds, copy the following and paste it below the 'Add custom sounds below here:' line:

		NEWSOUND(soundName,fileName.ogg,volume,distance)

	Volume can be a flat value, e.g. 5 or a decibel value e.g. db+60
	Distance is the max range in metres the sound is audible from

	For more info see:
		https://community.bistudio.com/wiki/Description.ext#CfgSounds 
*/

#include "macros.hpp"

// Default TFD intro music (get rid of these 2 lines and delete 2 .ogg files in 'media\sounds' to save some mission file size)
NEWSOUND(tfd_intro_1,tfd_intro_1.ogg,1,100)
NEWSOUND(tfd_intro_2,tfd_intro_2.ogg,1,100)

// Add custom sounds below here:

//NEWSOUND(soundName,fileName.ogg,volume,distance)