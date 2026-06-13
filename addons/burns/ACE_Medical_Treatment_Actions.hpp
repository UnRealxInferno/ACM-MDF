class ACEGVAR(medical_treatment,actions) {
    class BasicBandage;
    class PressureBandage;

    // Silver nylon dressing - the proper burn dressing. A normal bandage action (inherits the bandage
    // callback / "bandage" category / timing from PressureBandage). Burn effectiveness is in the
    // ACM_core Bandaging config; using any OTHER dressing on a 2nd/3rd-degree burn costs pain (see the
    // bandageLocal listener in XEH_postInit).
    class ACM_SilverNylonDressing: PressureBandage {
        displayName         = CSTRING(SilverNylon_Use);
        items[]             = {"ACM_SilverNylonDressing"};
        allowSelfTreatment  = 1;
        ACM_menuIcon        = "";
    };

    // Burn cream - alternative for 1st-degree burns ONLY. Gated to parts with an open Burn1; the
    // Bandaging config gives it zero effect on anything else.
    class ACM_BurnCream: PressureBandage {
        displayName         = CSTRING(BurnCream_Use);
        displayNameProgress = CSTRING(BurnCream_Progress);
        items[]             = {"ACM_BurnCream"};
        allowSelfTreatment  = 1;
        condition           = QUOTE([ARR_3(_medic,_patient,_bodyPart)] call FUNC(canTreatBurnCream));
        ACM_menuIcon        = "";
    };
};
