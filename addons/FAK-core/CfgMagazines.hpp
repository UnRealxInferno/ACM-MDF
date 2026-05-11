class CfgMagazines {
    class CA_Magazine;

    class efak_IFAK_Magazine: CA_Magazine {
        scope = 2;
        scopeArsenal = 0;
        author = "Miss Heda";
        displayName = CSTRING(IFAK_Display);
        descriptionShort = CSTRING(IFAK_DESC);
        picture = QPATHTOF(ui\IFAK.paa);
        
        ammo = "";
        count = 15;
        initSpeed = 0;
        tracersEvery = 0;
        lastRoundsTracer = 0;
        mass = 15;
    };

    class efak_AFAK_Magazine: CA_Magazine {
        scope = 2;
        scopeArsenal = 0;
        author = "Miss Heda";
        displayName = CSTRING(AFAK_Display);
        descriptionShort = CSTRING(AFAK_DESC);
        picture = QPATHTOF(ui\AFAK.paa);

        ammo = "";
        count = 63;
        initSpeed = 0;
        tracersEvery = 0;
        lastRoundsTracer = 0;
        mass = 25;
    };

    class efak_MFAK_Magazine: CA_Magazine {
        scope = 2;
        scopeArsenal = 0;
        author = "Miss Heda";
        displayName = CSTRING(MFAK_Display);
        descriptionShort = CSTRING(MFAK_DESC);
        picture = QPATHTOF(ui\MFAK.paa);

        ammo = "";
        count = 255;
        initSpeed = 0;
        tracersEvery = 0;
        lastRoundsTracer = 0;
        mass = 50;
    };
};
