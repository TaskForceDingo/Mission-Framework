/*
	This file contains config templates for 'patches.hpp' and 'sounds.hpp'. Don't edit these!
*/

#define PATCH_FOLDER media\patches
#define SOUND_FOLDER media\sounds

#define STRINGIFY(S) #S
#define PATCH_PATH(FILENAME) STRINGIFY(PATCH_FOLDER\FILENAME)
#define SOUND_PATH(FILENAME) STRINGIFY(SOUND_FOLDER\FILENAME)

#define NEWPATCH(NAME,FILENAME)\
class NAME \
{ \
	displayName = #NAME; \
	author = "TFD"; \
	texture = PATCH_PATH(FILENAME); \
};

#define NEWSOUND(NAME,FILENAME,VOLUME,DISTANCE)\
class NAME \
{ \
	name = #NAME; \
	sound[] = { SOUND_PATH(FILENAME), VOLUME, 1, DISTANCE }; \
	titles[] = {0,""}; \
};
