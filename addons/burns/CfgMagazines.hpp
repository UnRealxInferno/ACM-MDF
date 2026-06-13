class CfgMagazines {
    class CA_Magazine;

    // Silver nylon dressing - the proper burn dressing (used as a normal bandage; effectiveness in the
    // ACM_core Bandaging config). Using any other dressing on a 2nd/3rd-degree burn costs pain.
    class ACM_SilverNylonDressing: CA_Magazine {
        scope = 2;
        author = "INFERNO";
        picture = "\x\ACM\addons\circulation\ui\paracetamol_ca.paa";
        displayName = CSTRING(SilverNylon);
        descriptionShort = CSTRING(SilverNylon_Desc);
        ACE_isMedicalItem = 1;
        ACE_asItem = 1;
        count = 3;
        mass = 0.2;
    };

    // Burn cream - alternative treatment for 1st-degree burns only.
    class ACM_BurnCream: ACM_SilverNylonDressing {
        displayName = CSTRING(BurnCream);
        descriptionShort = CSTRING(BurnCream_Desc);
        count = 5;
        mass = 0.3;
    };
};
