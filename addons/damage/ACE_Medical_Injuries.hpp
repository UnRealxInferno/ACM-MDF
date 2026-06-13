class ACE_Medical_Injuries {
    class wounds {
        class ThermalBurn;
        class ChemicalBurn: ThermalBurn { // CBRN
            pain = 0.8;
        };

        // Burn depth wounds (ACM). Depth is selected by burn-event magnitude in the "burn" damageType below.
        // All carry a marginal bleed so they behave like any other wound (bandageable). Pain per spec:
        // 1st = moderate, 2nd = severe, 3rd = config value but dicerolled to 0 on creation
        // (insensate eschar) in ACM_core fnc_woundsHandlerBase.
        class Burn1: ThermalBurn { // superficial / 1st degree
            bleeding = 0.002;
            pain = 0.45;
        };
        class Burn2: ThermalBurn { // partial thickness / 2nd degree
            bleeding = 0.005;
            pain = 0.95;
        };
        class Burn3: ThermalBurn { // full thickness / 3rd degree (pain dicerolled at creation)
            bleeding = 0.003;
            pain = 0.70;
        };
    };

    class damageTypes {
        class slap {
            thresholds[] = {{0.05, 1}, {0.05, 0}};
            selectionSpecific = 1;
            class Contusion {
                weighting[] = {{0.35, 0}, {0.35, 1}};
            };
        };
        class incision {
            thresholds[] = {{0.1, 1}, {0.1, 0}};
            selectionSpecific = 1;
            class Cut {
                weighting[] = {{0.1, 1}, {0.1, 0}};
            };
        };
        class lewisiteburn { // CBRN
            thresholds[] = {{0, 1}};
            selectionSpecific = 0;
            noBlood = 1;
            class ChemicalBurn {
                weighting[] = {{0, 1}};
            };
        };

        // Re-open ACE's "burn" type (fed by woundsHandlerBurning and ACM_burns sources) to select
        // a burn depth from the per-wound damage magnitude. interpolatePoints uses {X=damage, Y=weight}
        // points in DESCENDING X order: input above the largest X returns the first Y, below the
        // smallest X returns the last Y. Each depth therefore dominates a damage band with smooth overlap.
        class burn {
            thresholds[] = {{0, 1}}; // exactly one wound per burn event; depth = its magnitude
            selectionSpecific = 0;
            noBlood = 1;
            class ThermalBurn { // neutralise ACE's generic burn so only the depth wounds are chosen
                weighting[] = {{0, 0}};
            };
            class Burn1 { // dominant at low damage, gone by ~0.30
                weighting[] = {{0.30, 0}, {0.10, 1}};
            };
            class Burn2 { // mid band, peaks ~0.45
                weighting[] = {{0.80, 0}, {0.45, 1}, {0.12, 0}};
            };
            class Burn3 { // dominant at high damage
                weighting[] = {{0.70, 1}, {0.40, 0}};
            };
        };
    };
};
