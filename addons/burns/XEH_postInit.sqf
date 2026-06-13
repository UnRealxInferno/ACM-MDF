#include "script_component.hpp"

// Reset burn markers on full heal.
[QACEGVAR(medical_treatment,fullHealLocalMod), LINKFUNC(fullHealLocal)] call CBA_fnc_addEventHandler;

// 2nd/3rd-degree burns (raised from ACM_core fnc_woundsHandlerBase) cause a discrete blood-volume loss
// (hypotension) and, on the head, a chance of an airway burn. Runs where the unit is local.
[QGVAR(burnApplied), {
    params ["_patient", "_bodyPart", "_woundType"];
    if (!GVAR(burnsEnabled)) exitWith {};

    // Hypotension: small per-burn blood-volume loss, floored so burns alone don't exsanguinate.
    // Cumulative over repeated burns; countered by normal saline/plasma/whole-blood IV pathways.
    private _loss = [BURN_BLOODLOSS_2, BURN_BLOODLOSS_3] select (_woundType isEqualTo "Burn3");
    private _blood = _patient getVariable [QEGVAR(circulation,Blood_Volume), 6];
    _patient setVariable [QEGVAR(circulation,Blood_Volume), (_blood - _loss) max (BURN_BLOOD_FLOOR min _blood), true];

    // Airway burn: BINARY. Once burned it stays burned (no stacking). Each head burn is a chance to
    // burn it; on the first success set a fixed severity into the existing CBRN airway-inflammation
    // pathway (max, so it never reduces any CBRN inflammation), which a surgical airway (cric) treats.
    // The marker drives the "Airway Burned" exam label and is the one-shot guard.
    if (_bodyPart isEqualTo "head" && {!(_patient getVariable [QGVAR(AirwayBurned), false])} && {random 1 < GVAR(headBurnAirwayChance)}) then {
        private _inflammation = _patient getVariable [QEGVAR(CBRN,AirwayInflammation), 0];
        _patient setVariable [QEGVAR(CBRN,AirwayInflammation), (_inflammation max BURN_AIRWAY_SEVERITY), true];
        _patient setVariable [QGVAR(AirwayBurned), true, true];
    };
}] call CBA_fnc_addEventHandler;

// Improper care: bandaging a 2nd/3rd-degree burn with anything other than the silver nylon dressing
// (or burn cream) causes additional pain.
[QACEGVAR(medical_treatment,bandageLocal), {
    params ["_patient", "_bodyPart", "_bandageClass"];
    if (!GVAR(burnsEnabled)) exitWith {};
    if (_bandageClass in ["ACM_SilverNylonDressing", "ACM_BurnCream"]) exitWith {};

    private _woundNames = ACEGVAR(medical_damage,woundClassNames);
    private _partKey = toLower _bodyPart;
    private _wounds = ((_patient getVariable [VAR_OPEN_WOUNDS, createHashMap]) getOrDefault [_partKey, []])
                    + ((_patient getVariable [VAR_BANDAGED_WOUNDS, createHashMap]) getOrDefault [_partKey, []]);

    if ((_wounds findIf {(_woundNames param [floor ((_x select 0) / 10), ""]) in ["Burn2", "Burn3"]}) > -1) then {
        [_patient, BURN_WRONG_DRESSING_PAIN] call ACEFUNC(medical_status,adjustPainLevel);
    };
}] call CBA_fnc_addEventHandler;

// Burn sources hook in once CBA settings are available. ACE fire already produces burns on its own;
// here we add nearby explosions via the built-in "explosion" event (fires per unit close to a blast).
["CBA_settingsInitialized", {
    if (!GVAR(sourcesEnabled)) exitWith {};
    ["CAManBase", "explosion", LINKFUNC(handleExplosion)] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;
