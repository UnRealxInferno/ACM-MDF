#define COMPONENT ophthalmology
#define COMPONENT_BEAUTIFIED Ophthalmology
#include "\x\ACM\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_OPHTHALMOLOGY
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_OPHTHALMOLOGY
    #define DEBUG_SETTINGS DEBUG_SETTINGS_OPHTHALMOLOGY
#endif

#include "\x\ACM\addons\main\script_macros.hpp"

#define GET_DUST_INJURY(unit) ((unit getVariable [QGVAR(dustInjuryLight), 0]) + (unit getVariable [QGVAR(dustInjuryHeavy), 0]))
