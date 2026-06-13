class CfgMagazines {
    class CA_Magazine;

    class ACM_Moxifloxacin: CA_Magazine {
        scope = 2;
        author = "Inferno";
        picture = QPATHTOF(ui\moxiflox.paa);
        displayName = CSTRING(Moxifloxacin);
        descriptionShort = CSTRING(Moxifloxacin_Desc);
        ACE_isMedicalItem = 1;
        ACE_asItem = 1;
        count = 5;
        mass = 0.15;
    };
};
