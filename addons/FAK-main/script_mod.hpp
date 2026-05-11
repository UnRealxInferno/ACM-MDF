// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX efak

#include "script_version.hpp"

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCH
#define VERSION_AR  MAJOR,MINOR,PATCH

#define VERSION_CONFIG version = MAJOR.MINOR; versionStr = QUOTE(MAJOR.MINOR.PATCH); versionAr[] = {MAJOR,MINOR,PATCH}

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 2.16
#define REQUIRED_CBA_VERSION {3,17,0}

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(Advanced First Aid Kits - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(Advanced First Aid Kits - COMPONENT)
#endif
