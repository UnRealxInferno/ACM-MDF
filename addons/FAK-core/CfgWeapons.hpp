class CfgWeapons
{
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
    class efak_IFAK: ACE_ItemCore {
        author = "Miss Heda";
        displayName = CSTRING(IFAK_Display);
        descriptionShort = CSTRING(IFAK_DESC);
        scope = 2;
        editorPreview = QPATHTOF(ui\IFAK.paa);
        picture = QPATHTOF(ui\IFAK.paa);
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class efak_AFAK: efak_IFAK {
        displayName = CSTRING(AFAK_Display);
        descriptionShort = CSTRING(AFAK_DESC);
        editorPreview = QPATHTOF(ui\AFAK.paa);
        picture = QPATHTOF(ui\AFAK.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class efak_MFAK: efak_IFAK {
        displayName = CSTRING(MFAK_Display);
        descriptionShort = CSTRING(MFAK_DESC);
        editorPreview = QPATHTOF(ui\MFAK.paa);
        picture = QPATHTOF(ui\MFAK.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };
};