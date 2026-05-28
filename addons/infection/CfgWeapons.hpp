class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACM_Moxifloxacin_SinglePack: ACE_ItemCore {
        scope = 1;
        picture = "\x\ACM\addons\circulation\ui\paracetamol_singlepack_ca.paa";
        displayName = CSTRING(Moxifloxacin_SinglePack);
        descriptionShort = CSTRING(Moxifloxacin_Desc);
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.03;
        };
    };
};
