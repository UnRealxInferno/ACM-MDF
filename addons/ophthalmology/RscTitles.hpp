#define ST_LEFT 0
#define ST_CENTER 2
#define ST_RIGHT 1

#define pixelW  (1 / (getResolution select 2))
#define pixelH  (1 / (getResolution select 3))
#define pixelScale  0.50

// pixel grids macros
#define UI_GRID_W (pixelW * pixelGridBase)
#define UI_GRID_H (pixelH * pixelGridBase)

#define SAFEZONE_X_RIGHTEDGE ((safeZoneX - 1) * -1)
#define SAFEZONE_Y_LOWEDGE ((safeZoneY - 1) * -1)

#define FRAME_W(N) ((UI_GRID_W * (N)) * (1.7777 / (getResolution select 4)))
#define FRAME_H(N) ((UI_GRID_H * (N)))

class RscPicture;
class RscTitles
{
    class ACM_EyeShield
    {
        idd = 17101;
        enableSimulation = 1;
        movingEnable = 0;
        fadeIn=0;
        fadeOut=1;
        duration = 10e10;
        onLoad = "uiNamespace setVariable ['ACM_EyeShield', _this select 0];";
        class controls
        {
            class EyeShieldRight: RscPicture
            {
                idc = 17102;
                text = "\x\ACM\addons\ophthalmology\UI\RightEyeShield.paa";
                show = 0;
                x = QUOTE(safeZoneXAbs);
                y = QUOTE(safeZoneY);
                w = QUOTE(safeZoneWAbs);
                h = QUOTE(safeZoneH);
            };
            class EyeShieldLeft: EyeShieldRight
            {
                idc = 17103;
                text = "\x\ACM\addons\ophthalmology\UI\LeftEyeShield.paa";
            };
        };
    };
};
