#define COMPONENT burns
#define COMPONENT_BEAUTIFIED Burns
#include "\x\ACM\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_BURNS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_BURNS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BURNS
#endif

#include "\x\ACM\addons\main\script_macros.hpp"

// --- Hypotension from 2nd/3rd-degree burns (flat per-burn blood-volume loss, in litres) ---
// A flat amount removed once per burn wound by the burnApplied listener to simulate fluid loss;
// cumulative across burns, countered by IV fluids.
#define BURN_BLOODLOSS_2 0.2
#define BURN_BLOODLOSS_3 0.3
// Burns alone won't push blood volume below this floor (litres).
#define BURN_BLOOD_FLOOR 3.0

// --- Airway burn (chance from head 2nd/3rd-degree burns -> CBRN airway-inflammation pathway) ---
// Airway burn is BINARY: burned or not, no stacking. On the first successful head-burn roll the airway
// inflammation is set to this fixed severity (0-100); further head burns don't worsen it. The
// breathing-effectiveness penalty in handleUnitVitals reads this value -> serious hypoxia that trends to
// syncope (treated with a cric). Lower this if it deteriorates too fast.
#define BURN_AIRWAY_SEVERITY 50

// Additional pain when a 2nd/3rd-degree burn is bandaged with a non-silver-nylon dressing.
#define BURN_WRONG_DRESSING_PAIN 0.25

// Explosion source: distance (m) over which a nearby blast's burn chance falls off to zero.
#define BURN_EXPLOSION_RANGE 12
